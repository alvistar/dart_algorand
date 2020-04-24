import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_algorand/src/template.dart';

/// Split allows locking assets in an account which allows transfering
/// to two predefined addresses in a specific M:N ratio. Note that the ratio is
/// specified by the first address part. For example, if you would like to
/// have a split where the first address receives 30 percent and the second
/// receives 70, set ratn and ratd to 30 and 100, respectively. Split also
/// have an expiry round, in which the owner can transfer back the
/// assets.
class Split extends Template {
  String owner, receiver_1, receiver_2;
  int ratn, ratd, expiry_round, min_pay, max_fee;

  /// owner: an address that can receive the asset after the expiry round
  /// receiver_1: first address to receive assets
  /// receiver_2: second address to receive assets
  /// ratn: the numerator of the first address fraction
  /// ratd: the denominator of the first address fraction
  /// expiry_round: the round on which the assets can be transferred
  ///     back to owner
  /// min_pay: the minimum number of assets that can be transferred
  ///     from the account to receiver_1
  /// max_fee: half the maximum fee that can be paid to the network by
  ///     the account

  Split(
      {this.owner,
        this.receiver_1,
        this.receiver_2,
        this.ratn,
        this.ratd,
        this.expiry_round,
        this.min_pay,
        this.max_fee});

  /// Return a byte array to be used in LogicSig.
  @override
  Uint8List get_program() {
    final orig = 'ASAIAQUCAAYHCAkmAyDYHIR7TIW5eM/WAZcXdEDqv7BD+baMN6i2/A5JatG'
        'bNCDKsaoZHPQ3Zg8zZB/BZ1oDgt77LGo5np3rbto3/gloTyB40AS2H3I72Y'
        'CbDk4hKpm7J7NnFy2Xrt39TJG0ORFg+zEQIhIxASMMEDIEJBJAABkxCSgSM'
        'QcyAxIQMQglEhAxAiEEDRAiQAAuMwAAMwEAEjEJMgMSEDMABykSEDMBByoS'
        'EDMACCEFCzMBCCEGCxIQMwAIIQcPEBA=';

    final orig_decoded = base64Decode(orig);
    final offsets = [4, 7, 8, 9, 10, 14, 47, 80];

    final values = [
      max_fee,
      expiry_round,
      ratn,
      ratd,
      min_pay,
      owner,
      receiver_1,
      receiver_2
    ];

    final types = [
      ValueType.integer,
      ValueType.integer,
      ValueType.integer,
      ValueType.integer,
      ValueType.integer,
      ValueType.address,
      ValueType.address,
      ValueType.address,
    ];

    return inject(
        orig: orig_decoded,
        offsets: offsets,
        values: values,
        values_types: types);
  }
}