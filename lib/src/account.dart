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

/// Return the address for the private key.
String address_from_private_key(String private_key) {
  final pk = base64Decode(private_key).sublist(KEY_LEN_BYTES);
  return encode_address(pk);
}