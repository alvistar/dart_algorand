import 'dart:convert';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:pinenacl/api.dart';

class AlgoAccount {
  String private_key;
  String address;

  AlgoAccount({this.private_key, this.address});
}

/// Generate an account.
AlgoAccount generate_account() {
  final sk = SigningKey.generate();
  final a = encode_address(sk.verifyKey);
  final private_key = base64Encode(sk);
  return AlgoAccount(private_key: private_key, address: a);
}

/// Return the address for the private key.
String address_from_private_key(String private_key) {
  final pk = base64Decode(private_key).sublist(KEY_LEN_BYTES);
  return encode_address(pk);
}
