import 'package:meta/meta.dart';
import 'dart:collection';

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:pinenacl/api.dart';
import 'package:base32/base32.dart';
import 'package:convert/convert.dart';

import 'account.dart';
import 'constants.dart';
import 'encoding.dart';

class Mappable {
  SplayTreeMap<String, dynamic> dictify() {
    return SplayTreeMap();
  }
}

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

  SplayTreeMap<String, dynamic> dictify() {
    var m = SplayTreeMap<String, dynamic>();

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

    txn.group = args['grp'];

    return txn;
  }

  SignedTransaction sign(String private_key) {
    final sig = raw_sign(private_key);
    final b64sig = base64Encode(sig);
    final stx = SignedTransaction(transaction: this, signature: b64sig);
    return stx;
  }

  Uint8List raw_sign(String private_key) {
    final pkey = base64Decode(private_key);
    final txn = msgpack_encode(this);
    final to_sign = Utf8Encoder().convert(TXID_PREFIX) + base64Decode(txn);
    final signing_key = SigningKey.fromSeed(pkey.sublist(0, KEY_LEN_BYTES));
    final signed = signing_key.sign(to_sign);
    return signed.signature;
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

class PaymentTxn extends Transaction {
  String receiver;
  int amt;
  String close_remainder_to;

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

  static _undictify(Map<String, dynamic> m) {
    return {
      'close_remainder_to':
          m.containsKey('close') ? encode_address(m['close']) : null,
      'amt': m.containsKey('amt') ? m['amt'] : 0,
      'receiver': m.containsKey('rcv') ? encode_address(m['rcv']) : null
    };
  }
}

class SignedTransaction implements Mappable {
  String signature;
  Transaction transaction;

  SignedTransaction({this.signature, this.transaction});

  @override
  SplayTreeMap<String, dynamic> dictify() {
    final d = SplayTreeMap<String, dynamic>();
    d['sig'] = base64Decode(signature);
    d['txn'] = transaction.dictify();
    return d;
  }
}

///Represents a transaction for asset transfer.
///
///To begin accepting an asset, supply the same address as both sender and
///receiver, and set amount to 0.
///
///To revoke an asset, set revocation_target, and issue the transaction from
///the asset's revocation manager account.

class AssetTransferTxn extends Transaction {
  String receiver;
  int amt;
  int index;
  String close_assets_to;
  String revocation_target;

  AssetTransferTxn({
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
    this.index,
    this.close_assets_to,
    this.revocation_target,
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
            type: ASSET_TRANSFER_TXN) {
    this.fee = flat_fee
        ? max(MIN_TXN_FEE, fee)
        : max(estimate_size() * fee, MIN_TXN_FEE);
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    var m = super.dictify();

    if (amt > 0) {
      m['aamt'] = amt;
    }

    m['arcv'] = decode_address(receiver);

    if (close_assets_to != null) {
      m['aclose'] = decode_address(close_assets_to);
    }

    if (revocation_target != null) {
      m['asnd'] = decode_address(revocation_target);
    }

    m['xaid'] = index;

    return m;
  }
}

class TxGroup {
  List<Uint8List> txns;

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
    var m = super.dictify();

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
