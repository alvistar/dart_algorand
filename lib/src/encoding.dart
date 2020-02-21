import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:msgpack_dart/msgpack_dart.dart';


import 'package:base32/base32.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:collection/collection.dart';

import 'constants.dart';
import 'error.dart';


String msgpack_encode(obj) {
  if (! (obj is SplayTreeMap)) {
    obj = obj.dictify();
  }

  return base64.encode(serialize(obj));
}


decode_address(String a) {
  if (a.length != ADDRESS_LEN) {
    throw WrongKeyLengthError();
  }

  final decoded = base32.decode(_correct_padding(a));
  final addr = decoded.sublist(0, decoded.length - CHECK_SUM_LEN_BYTES);
  final expected_checksum = decoded.sublist(decoded.length - CHECK_SUM_LEN_BYTES);
  final ck = _checksum(addr);


  if (ListEquality().equals(ck, expected_checksum)) {
    return addr;
  }
  else {
    throw WrongChecksumError();
  }
}

/// Encode a byte address into a string composed of the encoded bytes and the
/// checksum.
String encode_address(Uint8List addr_bytes) {
  if (addr_bytes == null) {
    return null;
  }

  if (addr_bytes.length != KEY_LEN_BYTES) {
    throw WrongKeyBytesLengthError;
  }

  final cksum = _checksum(addr_bytes);
  final addr = base32.encode(Uint8List.fromList(addr_bytes+cksum));
  return undo_padding(addr);
}

String _correct_padding(String a) {
  if (a.length % 8 == 0) {
    return a;
  }

  return a + '=' * (8-a.length % 8);
}

String undo_padding(String a) {
  return a.replaceAll(RegExp(r'='), '');
}

Uint8List checksum(Uint8List data) {
  Digest sha512 = Digest("SHA-512/256");
  return sha512.process(data);

}

Uint8List _checksum(Uint8List addr) {
  return checksum(addr).sublist(addr.length - CHECK_SUM_LEN_BYTES);
}