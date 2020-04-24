import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/logic.dart';

abstract class Template {
  /// Return the address of the contract.
  String get_address() {
    return get_program_address(get_program());
  }

  Uint8List get_program();
}

enum ValueType { integer, address, base64 }



int put_uvarint(List<int> buf, int x) {
  var i = 0;
  while (x >= 0x80) {
    buf.add((x & 0xFF) | 0x80);
    x >>= 7;
    i += 1;
  }

  buf.add(x & 0xFF);
  return i + 1;
}

Uint8List inject(
    {Uint8List orig,
    List<int> offsets,
    List<dynamic> values,
    List<ValueType> values_types}) {
  // make sure we have enough values
  assert(
      offsets.length == values.length && values.length == values_types.length);

  var res = orig.toList() ;

  List replace(
      List<int> arr, List<int> new_val, int offset, int place_holder_length) {
    return arr.sublist(0, offset) +
        new_val +
        arr.sublist(offset + place_holder_length);
  }

  for (var i=0; i < offsets.length; i++) {
    var val = values[i];
    final val_type = values_types[i];
    var dec_len = 0;

    switch (val_type) {
      case ValueType.integer:
        {
          final buf = <int>[];
          dec_len = put_uvarint(buf, val) - 1;
          res = replace(res, buf, offsets[i], 1);
        }
        break;

      case ValueType.address:
        {
          res = replace(res, decode_address(val), offsets[i], 32);
        }
        break;

      case ValueType.base64:
        {
          final value = base64Decode(val).toList();
          final buf = <int>[];
          dec_len = put_uvarint(buf, value.length) + value.length - 2;
          res = replace(res, buf + value, offsets[i], 2);
        }
    }

    // update offsets
    if (dec_len != 0) {
      for (var o=0; o < offsets.length; o++) {
        offsets[o] += dec_len;
      }
    }
  }

  return Uint8List.fromList(res);
}
