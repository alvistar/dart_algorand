import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pinenacl/signing.dart';
import 'package:collection/collection.dart';

import 'encoding.dart';

Function eq = const ListEquality().equals;

/// Represents a signed transaction.
class MultisigTransaction {
  Transaction transaction;
  Multisig multisig;

  ///  transaction: transaction that was signed
  ///  multisig: multisig account and signatures
  MultisigTransaction({@required this.transaction, @required this.multisig});

  factory MultisigTransaction.undictify(Map<String, dynamic> m) {
    return MultisigTransaction(
        transaction: Transaction.undictify(Map.from(m['txn'])),
        multisig: m.containsKey('msig')
            ? Multisig.undictify(Map.from(m['msig']))
            : null);
  }

  /// Merge partially signed multisig transactions from list of partially
  /// signed multisig transactions [part_stxs]
  ///
  /// Returns multisig transaction containing signatures
  ///
  /// Note:
  ///  Only use this if you are given two partially signed multisig
  ///  transactions. To append a signature to a multisig transaction, just
  ///  use MultisigTransaction.sign()
  factory MultisigTransaction.merge(List<MultisigTransaction> part_stxs) {
    String ref_addr;

    for (var stx in part_stxs) {
      ref_addr ??= stx.multisig.address();
      if (stx.multisig.address() != ref_addr) {
        throw MergeKeysMismatchError();
      }
    }

    MultisigTransaction msigstx;

    for (var stx in part_stxs) {
      if (msigstx == null) {
        msigstx = stx;
      } else {
        for (var s = 0; s < stx.multisig.subsigs.length; s += 1) {
          if (stx.multisig.subsigs[s].signature != null) {
            if (msigstx.multisig.subsigs[s].signature == null) {
              msigstx.multisig.subsigs[s].signature =
                  stx.multisig.subsigs[s].signature;
            } else if (!eq(msigstx.multisig.subsigs[s].signature,
                stx.multisig.subsigs[s].signature)) {
              throw DuplicateSigMismatchError();
            }
          }
        }
      }
    }

    return msigstx;
  }

  /// Sign the multisig transaction with [private_key]
  ///         Note:
  ///            A new signature will replace the old if there is already a
  ///            signature for the address. To sign another transaction, you can
  ///            either overwrite the signatures in the current Multisig, or you
  ///            can use Multisig.get_multisig_account() to get a new multisig
  ///            object with the same addresses.
  void sign(String private_key) {
    multisig.validate();
    final addr = multisig.address();

    if (transaction.sender != addr) {
      throw BadTxnSenderError();
    }

    var index = -1;
    final public_key = base64Decode(private_key).sublist(KEY_LEN_BYTES);

    for (var s = 0; s < multisig.subsigs.length; s += 1) {
      if (eq(multisig.subsigs[s].public_key, public_key)) {
        index = s;
        break;
      }
    }

    if (index == -1) {
      throw InvalidSecretKeyError();
    }

    final sig = transaction.raw_sign(private_key);
    multisig.subsigs[index].signature = sig;
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();

    if (multisig != null) {
      m['msig'] = multisig.dictify();
    }
    m['txn'] = transaction.dictify();

    return m;
  }
}

/// Represents a multisig account and signatures.
class Multisig {
  int version;
  int threshold;
  List<MultisigSubsig> subsigs = [];

  /// version: currently, the version is 1
  /// threshold: how many signatures are necessary
  /// addresses: addresses in the multisig account
  Multisig(
      {@required this.version,
      @required this.threshold,
      @required List<String> addresses}) {
    for (var a in addresses) {
      subsigs.add(MultisigSubsig(public_key: decode_address(a)));
    }
  }

  factory Multisig.undictify(Map<String, dynamic> m) {
    final msig = Multisig(version: m['v'], threshold: m['thr'], addresses: []);

    msig.subsigs = [
      for (var s in m['subsig']) MultisigSubsig.undictify(Map.from(s))
    ];

    return msig;
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();
    m['subsig'] = [for (var subsig in subsigs) subsig.dictify()];
    m['thr'] = threshold;
    m['v'] = version;
    return m;
  }

  Map<String, dynamic> json_dictify() {
    return {
      'subsig': [for (var subsig in subsigs) subsig.json_dictify()],
      'thr': threshold,
      'v': version,
    };
  }

  /// Check if the multisig account is valid.
  void validate() {
    if (version != 1) {
      throw UnknownMsigVersionError();
    }

    if (threshold <= 0 || subsigs.isEmpty || threshold > subsigs.length) {
      throw InvalidThresholdError();
    }

    if (subsigs.length > MULTISIG_ACCOUNT_LIMIT) {
      throw MultisigAccountSizeError();
    }
  }

  /// Return the multisig account address.
  String address() {
    var msig_bytes = Utf8Encoder().convert(MSIG_ADDR_PREFIX) +
        Uint8List.fromList([version]) +
        Uint8List.fromList([threshold]);

    for (var s in subsigs) {
      msig_bytes += s.public_key;
    }

    final addr = checksum(Uint8List.fromList(msig_bytes));
    return encode_address(addr);
  }

  /// Verify that the multisig is valid for the message.
  bool verify(Uint8List message) {
    try {
      validate();
    } on UnknownMsigVersionError {
      return false;
    } on InvalidThresholdError {
      return false;
    }

    final counter = [for (var s in subsigs) if (s.signature != null) s].length;

    if (counter < threshold) {
      return false;
    }

    var verified_count = 0;
    VerifyKey verify_key;

    for (var subsig in subsigs) {
      if (subsig.signature != null) {
        verify_key = VerifyKey(subsig.public_key);
        try {
          verify_key.verify(signature: Signature(subsig.signature), message: message);
          verified_count += 1;
        } catch (e) {
          return false;
        }
      }
    }

    if (verified_count < threshold) {
      return false;
    }

    return true;
  }

  /// Return a Multisig object without signatures.
  Multisig get_multisig_account() {
    final msig = Multisig(
        version: version, threshold: threshold, addresses: get_public_keys());

    for (var s in msig.subsigs) {
      s.signature = null;
    }

    return msig;
  }

  /// Return the base32 encoded addresses for the multisig account.
  List<String> get_public_keys() {
    return [for (var s in subsigs) encode_address(s.public_key)];
  }
}

class MultisigSubsig {
  Uint8List public_key;
  Uint8List signature;

  MultisigSubsig({@required this.public_key, this.signature});

  factory MultisigSubsig.undictify(Map<String, dynamic> m) {
    return MultisigSubsig(
        public_key: m['pk'], signature: m.containsKey('s') ? m['s'] : null);
  }

  Map<String, dynamic> json_dictify() {
    final m = <String, dynamic>{'pk': base64Encode(public_key)};

    if (signature != null) {
      m['s'] = base64Encode(signature);
    }

    return m;
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();
    m['pk'] = public_key;
    if (signature != null) {
      m['s'] = signature;
    }
    return m;
  }

  @override
  List<Object> get props => [public_key, signature];
}
