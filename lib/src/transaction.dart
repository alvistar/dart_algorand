import 'package:dart_algorand/src/asset_config_txn.dart';
import 'package:dart_algorand/src/asset_freeze_txn.dart';
import 'package:meta/meta.dart';
import 'dart:collection';

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:pinenacl/ed25519.dart';
import 'package:base32/base32.dart';

import 'account.dart';
import 'asset_transfer_txn.dart';
import 'constants.dart';
import 'encoding.dart';

class Mappable {
  SplayTreeMap<String, dynamic> dictify() {
    return SplayTreeMap();
  }
}

/// Superclass for various transaction types.
class Transaction implements Mappable {
  String sender;
  int fee;
  int first_valid_round;
  int last_valid_round;
  Uint8List note;
  String genesis_id;
  String genesis_hash;
  Uint8List lease;
  String type;
  Uint8List group;

  Transaction(
      {this.sender,
      this.fee,
      this.first_valid_round,
      this.last_valid_round,
      this.note,
      this.genesis_id,
      this.genesis_hash,
      this.lease,
      this.type}) {
    if (lease != null) {
      if (lease.length != LEASE_LENGTH) {
        throw WrongLeaseLengthError();
      }
    }
  }

  factory Transaction.from(Transaction tx) {
    return undictify(tx.dictify());
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();

    m['fee'] = fee;
    m['fv'] = first_valid_round;

    if (genesis_id != null) {
      m['gen'] = genesis_id;
    }

    m['gh'] = base64.decode(genesis_hash);
    m['lv'] = last_valid_round;
    m['type'] = type;
    m['snd'] = decode_address(sender);

    if (note != null) {
      m['note'] = note;
    }

    if (group != null) {
      m['grp'] = group;
    }

    if (lease != null) {
      m['lx'] = lease;
    }

    return m;
  }

  static Transaction undictify(Map<String, dynamic> m) {
    final args = {
      'sender': encode_address(m['snd']),
      'fee': m['fee'],
      'first': m.containsKey('fv') ? m['fv'] : 0,
      'last': m['lv'],
      'gh': base64Encode(m['gh']),
      'note': m.containsKey('note') ? m['note'] : null,
      'gen': m.containsKey('gen') ? m['gen'] : null,
      'lease': m.containsKey('lx') ? m['lx'] : null,
      'grp': m.containsKey('grp') ? m['grp'] : null
    };

    Transaction txn;

    if (m['type'] == PAYMENT_TXN) {
      args.addAll(PaymentTxn._undictify(m));
      txn = PaymentTxn(
        sender: args['sender'],
        fee: args['fee'],
        first_valid_round: args['first'],
        last_valid_round: args['last'],
        genesis_hash: args['gh'],
        note: args['note'],
        genesis_id: args['gen'],
        lease: args['lx'],
        close_remainder_to: args['close_remainder_to'],
        amt: args['amt'],
        receiver: args['receiver'],
        flat_fee: true,
      );
    }

    if (m['type'] == KEYREG_TXN) {
      args.addAll(KeyregTxn._undictify(m));
      txn = KeyregTxn(
        sender: args['sender'],
        fee: args['fee'],
        first_valid_round: args['first'],
        last_valid_round: args['last'],
        genesis_hash: args['gh'],
        note: args['note'],
        genesis_id: args['gen'],
        lease: args['lx'],
        flat_fee: true,
        votelst: args['votelst'],
        selkey: args['selkey'],
        votekd: args['votekd'],
        votekey: args['votekey'],
        votefst: args['votefst'],
      );
    }

    if (m['type'] == ASSETCONFIG_TXN) {
      args.addAll(AssetConfigTxn.undictify(m));

      txn = AssetConfigTxn(
          sender: args['sender'],
          fee: args['fee'],
          first_valid_round: args['first'],
          last_valid_round: args['last'],
          genesis_hash: args['gh'],
          note: args['note'],
          genesis_id: args['gen'],
          lease: args['lx'],
          flat_fee: true,
          index: args['index'],
          total: args['total'],
          default_frozen: args['default_frozen'] ?? false,
          unit_name: args['unit_name'],
          asset_name: args['asset_name'],
          manager: args['manager'],
          reserve: args['reserve'],
          freeze: args['freeze'],
          clawback: args['clawback'],
          url: args['url'],
          metadata_hash: args['metadata_hash'],
          decimals: args['decimals'],
          strict_empty_address_check: false);
    }

    if (m['type'] == ASSETFREEZE_TXN) {
      args.addAll(AssetFreezeTxn.undictify(m));

      txn = AssetFreezeTxn(
          sender: args['sender'],
          fee: args['fee'],
          first_valid_round: args['first'],
          last_valid_round: args['last'],
          genesis_hash: args['gh'],
          note: args['note'],
          genesis_id: args['gen'],
          lease: args['lx'],
          flat_fee: true,
          index: args['index'],
          new_freeze_state: args['new_freeze_state'],
          target: args['target']);
    }

    if (m['type'] == ASSET_TRANSFER_TXN) {
      args.addAll(AssetTransferTxn.undictify(m));

      txn = AssetTransferTxn(
          sender: args['sender'],
          fee: args['fee'],
          first_valid_round: args['first'],
          last_valid_round: args['last'],
          genesis_hash: args['gh'],
          note: args['note'],
          genesis_id: args['gen'],
          lease: args['lx'],
          flat_fee: true,
          receiver: args['receiver'],
          amt: args['amt'],
          index: args['index'],
          close_assets_to: args['close_assets_to'],
          revocation_target: args['revocation_target']);
    }

    if (args.containsKey('grp')) {
      txn.group = args['grp'];
    }

    return txn;
  }

  /// Sign the transaction with [private_key].
  /// Returns signed transaction with the signature
  SignedTransaction sign(String private_key) {
    final sig = raw_sign(private_key);
    final b64sig = base64Encode(sig);
    final stx = SignedTransaction(transaction: this, signature: b64sig);
    return stx;
  }

  /// Sign the transaction with [private_key].
  /// Returns signature in bytes
  Uint8List raw_sign(String private_key) {
    final pkey = base64Decode(private_key);
    final txn = msgpack_encode(this);
    final to_sign = Uint8List.fromList(
        Utf8Encoder().convert(TXID_PREFIX) + base64Decode(txn));
    final signing_key = SigningKey.fromSeed(pkey.sublist(0, KEY_LEN_BYTES));
    final signed = signing_key.sign(to_sign);
    return signed.signature.toUint8List();
  }

  ///  Get the transaction's ID.
  ///  Returns txid as string (encoded in base32)
  String get_txid() {
    final txn = msgpack_encode(this);
    final to_sign = Utf8Encoder().convert(TXID_PREFIX) + base64Decode(txn);
    final txid = checksum(Uint8List.fromList(to_sign));
    return undo_padding(base32.encode(txid));
  }

  int estimate_size() {
    final account = generate_account();
    final stx = sign(account.private_key);
    return base64Decode(msgpack_encode(stx)).length;
  }
}

/// Represents a payment transaction.
class PaymentTxn extends Transaction {
  String receiver;
  int amt;
  String close_remainder_to;

  /// [sender]: address of the sender
  ///
  /// [fee]: transaction fee (per byte if flat_fee is false)
  ///
  /// [first_valid_round]: first round for which the transaction is valid
  ///
  /// [last_valid_round]: last round for which the transaction is valid
  ///
  /// [gh]: genesis_hash
  ///
  /// [receiver]: address of the receiver
  ///
  /// [amt]: amount in microAlgos to be sent
  ///
  /// [close_remainder_to]: if nonempty, account will be closed
  ///       and remaining algos will be sent to this address
  ///
  /// [note]: arbitrary optional bytes
  ///
  /// [gen]: genesis_id
  ///
  /// [flat_fee]: whether the specified fee is a flat fee
  ///
  /// [lease]: specifies a lease, and no other transaction
  ///       with the same sender and lease can be confirmed in this
  ///       transaction's valid rounds
  PaymentTxn({
    String sender,
    int fee,
    int first_valid_round,
    int last_valid_round,
    Uint8List note,
    String genesis_id,
    String genesis_hash,
    Uint8List lease,
    this.amt,
    this.receiver,
    this.close_remainder_to,
    flat_fee = false,
  }) : super(
            sender: sender,
            fee: fee,
            first_valid_round: first_valid_round,
            last_valid_round: last_valid_round,
            note: note,
            genesis_id: genesis_id,
            genesis_hash: genesis_hash,
            lease: lease,
            type: PAYMENT_TXN) {
    this.fee = flat_fee
        ? max(MIN_TXN_FEE, fee)
        : max(estimate_size() * fee, MIN_TXN_FEE);
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    var m = super.dictify();

    m['amt'] = amt;
    m['rcv'] = decode_address(receiver);

    if (close_remainder_to != null) {
      m['close'] = decode_address(close_remainder_to);
    }

    return m;
  }

  static Map<String, dynamic> _undictify(Map<String, dynamic> m) {
    return {
      'close_remainder_to':
          m.containsKey('close') ? encode_address(m['close']) : null,
      'amt': m.containsKey('amt') ? m['amt'] : 0,
      'receiver': m.containsKey('rcv') ? encode_address(m['rcv']) : null
    };
  }
}

abstract class SignedTransactionBase {}

///   Represents a signed transaction.
class SignedTransaction implements Mappable, SignedTransactionBase {
  String signature;
  Transaction transaction;

  /// Creates a SignedTransaction using [transaction] that was signed
  /// and [signature] of a single address
  SignedTransaction({this.signature, this.transaction});

  factory SignedTransaction.from(SignedTransaction st) {
    return undictify(st.dictify());
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    final d = SplayTreeMap<String, dynamic>();

    if (signature != null) {
      d['sig'] = base64Decode(signature);
    }

    d['txn'] = transaction.dictify();
    return d;
  }

  static SignedTransaction undictify(Map<String, dynamic> m) {
    final sig = m.containsKey('sig') ? base64Encode(m['sig']) : null;
    final txn = Transaction.undictify(Map.from(m['txn']));
    return SignedTransaction(transaction: txn, signature: sig);
  }
}

class TxGroup {
  List<Uint8List> txns;

  ///  Transactions specifies a list of transactions that must appear
  ///  together, sequentially, in a block in order for the group to be
  ///  valid.  Each hash in the list is a hash of a transaction with
  ///  the `Group` field omitted.

  TxGroup(this.txns) {
    if (txns.length > TX_GROUP_LIMIT) {
      throw TransactionGroupSizeError();
    }
  }

  SplayTreeMap<String, dynamic> dictify() {
    final od = SplayTreeMap<String, dynamic>();
    od['txlist'] = txns;
    return od;
  }

  static TxGroup undictify(Map<String, dynamic> m) {
    return TxGroup(m['txlist'].cast<Uint8List>());
  }
}

/// Calculate group id for a given list of unsigned transactions [txns]
///
/// Returns checksum value representing the group id
Uint8List calculate_group_id(List<Transaction> txns) {
  if (txns.length > TX_GROUP_LIMIT) {
    throw TransactionGroupSizeError();
  }

  String raw_txn;
  Uint8List to_hash;
  final txids = <Uint8List>[];

  for (var txn in txns) {
    raw_txn = msgpack_encode(txn);
    to_hash = Uint8List.fromList(
        Utf8Encoder().convert(TXID_PREFIX) + base64Decode(raw_txn));
    txids.add(checksum(to_hash));
  }

  final group = TxGroup(txids);

  final encoded = msgpack_encode(group);
  final to_sign = Utf8Encoder().convert(TGID_PREFIX) + base64Decode(encoded);
  final gid = checksum(Uint8List.fromList(to_sign));

  return gid;
}

/// Represents a key registration transaction
class KeyregTxn extends Transaction {
  String votekey;
  String selkey;
  int votefst;
  int votelst;
  int votekd;

  /// KeyregTxn Constructor
  ///
  /// sender: address of sender
  /// fee: transaction fee (per byte if flat_fee is false)
  /// first: first round for which the transaction is valid
  /// last: last round for which the transaction is valid
  /// gh: genesis_hash
  /// votekey: participation public key
  /// selkey: VRF public key
  /// votefst: first round to vote
  /// votelst: last round to vote
  /// votekd: vote key dilution
  /// note: arbitrary optional bytes
  /// gen: genesis_id
  /// flat_fee: whether the specified fee is a flat fee
  /// lease: specifies a lease, and no other transaction
  /// with the same sender and lease can be confirmed in this
  /// transaction's valid rounds

  KeyregTxn(
      {@required String sender,
      @required int fee,
      @required int first_valid_round,
      @required int last_valid_round,
      Uint8List note,
      String genesis_id,
      @required String genesis_hash,
      Uint8List lease,
      bool flat_fee = false,
      @required this.votekey,
      @required this.selkey,
      @required this.votefst,
      @required this.votelst,
      @required this.votekd})
      : super(
            sender: sender,
            fee: fee,
            first_valid_round: first_valid_round,
            last_valid_round: last_valid_round,
            note: note,
            genesis_id: genesis_id,
            genesis_hash: genesis_hash,
            lease: lease,
            type: KEYREG_TXN) {
    this.fee = flat_fee
        ? max(MIN_TXN_FEE, fee)
        : max(estimate_size() * fee, MIN_TXN_FEE);
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    final m = super.dictify();

    m['selkey'] = decode_address(selkey);
    m['votefst'] = votefst;
    m['votekd'] = votekd;
    m['votekey'] = decode_address(votekey);
    m['votelst'] = votelst;

    return m;
  }

  static Map<String, dynamic> _undictify(Map<String, dynamic> m) {
    return {
      'votekey': encode_address(m['votekey']),
      'selkey': encode_address(m['selkey']),
      'votefst': m['votefst'],
      'votelst': m['votelst'],
      'votekd': m['votekd']
    };
  }
}

/// Assign group id to a given list of unsigned transactions [txns]

/// [address] is optional sender address specifying which transaction return

/// Returns list of unsigned transactions with group property set
List<Transaction> assign_group_id(
    {@required List<Transaction> txns, String address}) {
  if (txns.length > TX_GROUP_LIMIT) {
    throw TransactionGroupSizeError();
  }

  final gid = calculate_group_id(txns);

  final result = <Transaction>[];

  for (var tx in txns) {
    if (address == null || tx.sender == address) {
      tx.group = gid;
      result.add(tx);
    }
  }

  return result;
}
