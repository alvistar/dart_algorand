import 'dart:convert';
import 'dart:typed_data';
import 'package:meta/meta.dart';


import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/wordlist.dart';
import 'package:pinenacl/api.dart';

/// Return the private key for the mnemonic.
String to_private_key(String mnemonic) {
  final keyBytes = to_key(mnemonic);
  final key = SigningKey(seed:keyBytes);
  return base64Encode(keyBytes + key.verifyKey);
}

/// Return the mnemonic for the private [key] in base64.
String from_private_key(String key) {
  final keyBytes = base64Decode(key);
  return from_key(keyBytes.sublist(0, KEY_LEN_BYTES));
}

/// Give the corresponding key for the mnemonic.
@visibleForTesting
Uint8List to_key(String mnemonic) {
  final mlist = mnemonic.split(' ');

  if (mlist.length != MNEMONIC_LEN) {
    throw WrongMnemonicLengthError();
  }

  final mChecksum = mlist.last;
  final mm = _from_words(mlist.sublist(0, mlist.length-1));
  final mbytes = _to_bytes(mm);

  if (mbytes.last != 0) {
    throw WrongChecksumError();
  }

  final chksum = mnemonicChecksum(mbytes.sublist(0,KEY_LEN_BYTES));

  if (chksum == mChecksum) {
    return mbytes.sublist(0,KEY_LEN_BYTES);
  }
  else {
    throw WrongChecksumError();
  }
}

/// Return the mnemonic for the key.
@visibleForTesting
String from_key(Uint8List key) {
  if (key.length != KEY_LEN_BYTES) {
    throw WrongKeyBytesLengthError();
  }

  final chksum = mnemonicChecksum(key);
  final nums = _to_11_bit(key);
  final words = _apply_words(nums);

  return words.join(' ') + ' ' + chksum;
}


int idxHelper(int idx) {
  if (idx == -1 ) {
    throw WordNotInList();
  }

  return idx;
}

///    Get the corresponding 11-bit numbers for a list of words.
///
///    Args:
///        words (str[]): list of words
///
///    Returns:
///        int[]: list of 11-bit numbers

List<int> _from_words(List<String> words) {
  final word_list = WORD_LIST_RAW.split('\n');

  return [for (var w in words) idxHelper(word_list.indexOf(w))];
}

/// Convert a list of 11-bit numbers to a bytearray.
Uint8List _to_bytes(List<int> nums) {
  var buffer = 0;
  var num_of_bits = 0;
  var output = <int>[];


  for (var i in nums) {
    buffer |= i << num_of_bits;
    num_of_bits += 11;

    while (num_of_bits >= 8) {
      output.add(buffer & 255);
      buffer = buffer >> 8;
      num_of_bits -= 8;
    }
  }

  if (num_of_bits != 0) {
    output.add(buffer & 255);
  }

  return Uint8List.fromList(output);
}

/// Compute the mnemonic checksum.
@visibleForTesting
String mnemonicChecksum(Uint8List data) {
  final chksum = checksum(data);
  final nums = _to_11_bit(chksum.sublist(0, 2));
  return _apply_words(nums)[0];
}

/// Get the corresponding words for a list of 11-bit numbers.
List<String> _apply_words(List<int> nums) {
  final word_list = WORD_LIST_RAW.split('\n');

  return [for (var n in nums) word_list[n] ];
}


///  Convert a bytearray to an list of 11-bit numbers.
List<int> _to_11_bit(Uint8List data) {
  var buffer = 0;
  var num_of_bits = 0;
  var output = <int>[];

  for (var i in data) {
    buffer |= i << num_of_bits;
    num_of_bits += 8;

    if (num_of_bits >= 11) {
      output.add(buffer & 2047);
      buffer = buffer >> 11;
      num_of_bits -= 11;
    }
  }

  if (num_of_bits != 0) {
    output.add(buffer & 2047);
  }

  return output;
}