import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_algorand/src/template.dart';

/// Hash Time Locked Contract allows a user to recieve the Algo prior to
/// deadline (in terms of a round) by proving knowledge of a special value
/// or to forfeit the ability to claim, returning it to the payer.
/// This contract is usually used to perform cross-chained atomic swaps.
///
/// More formally, algos can be transfered under only two circumstances:
///     1. To receiver if hash_function(arg_0) = hash_value
///     2. To owner if txn.FirstValid > expiry_round
class HTLC extends Template {
  String owner, receiver, hash_function, hash_image;
  int expiry_round, max_fee;

  /// owner: an address that can receive the asset after the expiry
  ///     round
  /// receiver: address to receive Algos
  /// hash_function: the hash function to be used (must be either
  ///     sha256 or keccak256)
  /// hash_image: the hash image in base64
  /// expiry_round: the round on which the assets can be transferred
  ///     back to owner
  /// max_fee: the maximum fee that can be paid to the network by the
  ///   account
  HTLC(
      {this.owner,
      this.receiver,
      this.hash_function,
      this.hash_image,
      this.expiry_round,
      this.max_fee});

  /// Return a byte array to be used in LogicSig.
  @override
  Uint8List get_program() {
    final orig = 'ASAEBQEABiYDIP68oLsUSlpOp7Q4pGgayA5soQW8tgf8VlMlyVaV9qITAQ'
        'Yg5pqWHm8tX3rIZgeSZVK+mCNe0zNjyoiRi7nJOKkVtvkxASIOMRAjEhAx'
        'BzIDEhAxCCQSEDEJKBItASkSEDEJKhIxAiUNEBEQ';

    final orig_decoded = base64Decode(orig);
    var hash_inject = 0;

    if (hash_function == 'sha256') {
      hash_inject = 1;
    } else if (hash_function == 'keccak256') {
      hash_inject = 2;
    }

    final offsets = [3, 6, 10, 42, 45, 102];

    final values = [
      max_fee,
      expiry_round,
      receiver,
      hash_image,
      owner,
      hash_inject
    ];

    final types = [
      ValueType.integer,
      ValueType.integer,
      ValueType.address,
      ValueType.base64,
      ValueType.address,
      ValueType.integer
    ];

    return inject(
        orig: orig_decoded,
        offsets: offsets,
        values_types: types,
        values: values);
  }
}
