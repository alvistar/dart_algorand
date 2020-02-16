import 'dart:collection';

import 'dart:convert';
import 'dart:typed_data';

import 'package:pinenacl/api.dart';
import 'package:base32/base32.dart';

import 'constants.dart';
import 'encoding.dart';
import 'package:convert/convert.dart';

class Mappable {
  SplayTreeMap <String, dynamic> dictify() {
    return SplayTreeMap();
  }
}

class Transaction implements Mappable{
  String sender;
  int fee;
  int first_valid_round;
  int last_valid_round;
  String note;
  String genesis_id;
  String genesis_hash;
  String lease;
  String type;

  Transaction({this.sender,
    this.fee,
    this.first_valid_round,
    this.last_valid_round,
    this.note,
    this.genesis_id,
    this.genesis_hash,
    this.lease,
    this.type } ) {}

  SplayTreeMap <String, dynamic> dictify() {
    var m = SplayTreeMap<String, dynamic>();

    m['fee'] = fee;
    m['fv'] = first_valid_round;
    m['gen'] = genesis_id;
    m['gh'] = base64.decode(genesis_hash);
    m['lv'] = last_valid_round;
    m['type'] = type;
    m['snd'] = decode_address(sender);

    return m;
  }

  SignedTransaction sign (String private_key) {
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

  String get_txid() {
    final txn = msgpack_encode(this);
    final to_sign = Utf8Encoder().convert(TXID_PREFIX) + base64Decode(txn);
    final txid = checksum(Uint8List.fromList(to_sign));
    return undo_padding(base32.encode(txid));
  }

}

class PaymentTxn extends Transaction {
  String receiver;
  int amt;
  int close_remainder_to;

  PaymentTxn({sender,
    fee,
    first_valid_round,
    last_valid_round,
    note='',
    genesis_id=Null,
    genesis_hash,
    lease='',
    this.amt,
    this.receiver,
    this.close_remainder_to = 0} ) :
        super(
          sender:sender,
          fee:fee,
          first_valid_round:first_valid_round,
          last_valid_round:last_valid_round,
          note:note,
          genesis_id:genesis_id,
          genesis_hash:genesis_hash,
          lease:lease,
          type:PAYMENT_TXN
      );

  @override
  SplayTreeMap <String, dynamic> dictify(){
    var m = super.dictify();

    m['amt'] = amt;
    m['rcv'] = decode_address(receiver);

    if (note != '') {
      m['note'] = note;
    }

    return m;
  }

}

class SignedTransaction implements Mappable{
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