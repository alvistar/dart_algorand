import 'dart:convert';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:pinenacl/api.dart';

class Account {
  String private_key;
  String address;

  Account({this.private_key, this.address});
}

/// Generate an account.
Account generate_account() {
  final sk = SigningKey.generate();
  final a = encode_address(sk.verifyKey);
  final private_key = base64Encode(sk);
  return Account(private_key: private_key, address: a);
}