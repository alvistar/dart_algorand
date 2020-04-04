import 'dart:collection';
import 'dart:math';
import 'dart:typed_data';

import 'package:dart_algorand/dart_algorand.dart';

import 'transaction.dart';
import 'package:meta/meta.dart';

///   Represents a transaction for freezing or unfreezing an account's asset
///   holdings. Must be issued by the asset's freeze manager.
class AssetFreezeTxn extends Transaction {
  int index;
  String target;
  bool new_freeze_state;

  ///  sender: address of the sender, who must be the asset's freeze
  ///  manager
  ///
  ///  fee: transaction fee (per byte if flat_fee is false)
  ///
  ///  first: first round for which the transaction is valid
  ///
  ///  last: last round for which the transaction is valid
  ///
  ///  gh: genesis_hash
  ///
  ///  index: index of the asset
  ///
  ///  target: address having its assets frozen or unfrozen
  ///
  ///  new_freeze_state: true if the assets should be frozen, false if
  ///  they should be transferrable
  ///
  ///  note: arbitrary optional bytes
  ///
  ///  gen: genesis_id
  ///
  ///  flat_fee: whether the specified fee is a flat fee
  ///
  ///  lease: specifies a lease, and no other transaction
  ///  with the same sender and lease can be confirmed in this
  ///  transaction's valid rounds

  AssetFreezeTxn({
    @required String sender,
    @required int fee,
    @required int first_valid_round,
    @required int last_valid_round,
    Uint8List note,
    String genesis_id,
    @required String genesis_hash,
    Uint8List lease,
    bool flat_fee = false,
    @required this.index,
    @required this.target,
    @required this.new_freeze_state,
  }) : super(
            sender: sender,
            fee: fee,
            first_valid_round: first_valid_round,
            last_valid_round: last_valid_round,
            note: note,
            genesis_id: genesis_id,
            genesis_hash: genesis_hash,
            lease: lease,
            type: ASSETFREEZE_TXN) {
    this.fee = flat_fee
        ? max(MIN_TXN_FEE, fee)
        : max(estimate_size() * fee, MIN_TXN_FEE);
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    final m = super.dictify();

    if (new_freeze_state) {
      m['afrz'] = new_freeze_state;
    }

    m['fadd'] = decode_address(target);

    if (index != 0) {
      m['faid'] = index;
    }

    return m;
  }

  static Map<String, dynamic> undictify(Map<String, dynamic> m) {
    return {
      'index': m['faid'],
      'new_freeze_state': m.containsKey('afrz') ? m['afrz'] : false,
      'target': encode_address(m['fadd'])
    };

  }
}
