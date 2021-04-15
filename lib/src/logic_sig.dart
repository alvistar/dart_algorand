import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dart_algorand/src/multisig_txn.dart';
import 'package:meta/meta.dart';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/logic.dart';
import 'package:pinenacl/api.dart';
import 'package:pinenacl/ed25519.dart';

class _MultiSigResult {
  int index;
  String sig;

  _MultiSigResult({this.index, this.sig});
}

/// Represents a logic signature
class LogicSig {
  Uint8List program;
  List<Uint8List> args;
  String sig;
  Multisig msig;

  LogicSig({@required this.program, this.args}) {
    if (!check_program(program, args)) {
      throw InvalidProgram();
    }
  }

  factory LogicSig.undictify(Map<String, dynamic> m) {
    final lsig = LogicSig(
        program: m['l'],
        args: m.containsKey('arg') ? m['arg'].cast<Uint8List>() : null);

    if (m.containsKey('sig')) {
      lsig.sig = base64Encode(m['sig']);
    } else if (m.containsKey('msig')) {
      lsig.msig = Multisig.undictify(Map.from(m['msig']));
    }

    return lsig;
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();

    if (args != null) {
      m['arg'] = args;
    }

    m['l'] = program;

    if (sig != null) {
      m['sig'] = base64Decode(sig);
    } else if (msig != null) {
      m['msig'] = msig.dictify();
    }

    return m;
  }

  /// Verifies LogicSig against the transaction's sender address [public_key].
  /// Returns true if the signature is valid (the sender address matches
  /// the logic hash or the signature is valid against the sender
  /// address), false otherwise
  bool verify(Uint8List public_key) {
    if (sig != null && msig != null) {
      return false;
    }

    try {
      check_program(program, args);
    } on InvalidProgram {
      return false;
    }

    final to_sign = Utf8Encoder().convert(LOGIC_PREFIX) + program;

    if (sig == null && msig == null) {
      final chksum = checksum(Uint8List.fromList(to_sign));
      return eq(chksum, public_key);
    }

    if (sig != null) {
      final verify_key = VerifyKey(public_key);
      try {
        verify_key.verify(
            signature: Signature(base64Decode(sig)), message: to_sign);
        return true;
      } catch (e) {
        return false;
      }
    }

    return msig.verify(Uint8List.fromList(to_sign));
  }

  ///  Compute hash of the logic sig program (that is the same as escrow
  ///  account address) as string address
  String address() {
    return get_program_address(program);
  }

  static String sign_program(Uint8List program, String private_key) {
    final pkey = base64Decode(private_key);
    final signing_key = SigningKey(seed: pkey.sublist(0, KEY_LEN_BYTES));
    final to_sign = Utf8Encoder().convert(LOGIC_PREFIX) + program;
    final signed = signing_key.sign(to_sign);
    return base64Encode(signed.signature);
  }

  static _MultiSigResult single_sig_multisig(
      {Uint8List program, String private_key, Multisig multisig}) {
    var index = -1;
    final public_key = base64Decode(private_key).sublist(KEY_LEN_BYTES);

    for (var s = 0; s < multisig.subsigs.length; s++) {
      if (eq(multisig.subsigs[s].public_key, public_key)) {
        index = s;
        break;
      }
    }

    if (index == -1) {
      throw InvalidSecretKeyError();
    }

    return _MultiSigResult(
        index: index, sig: sign_program(program, private_key));
  }

  /// Creates signature (if no pk provided) or multi signature
  /// private_key: private key of signing account
  /// multisig: optional multisig account without signatures
  ///           to sign with
  void sign({@required String private_key, Multisig multisig}) {
    if (multisig == null) {
      sig = sign_program(program, private_key);
    } else {
      final result = single_sig_multisig(
          program: program, private_key: private_key, multisig: multisig);

      multisig.subsigs[result.index].signature = base64Decode(result.sig);
      msig = multisig;
    }
  }

  /// Appends a signature to multi signature
  void append_to_multisig(String private_key) {
    if (msig == null) {
      throw InvalidSecretKeyError();
    }

    final result = single_sig_multisig(
        program: program, private_key: private_key, multisig: msig);

    msig.subsigs[result.index].signature = base64Decode(result.sig);
  }
}
