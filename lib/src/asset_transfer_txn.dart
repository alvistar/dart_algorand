import 'dart:collection';
import 'dart:math';
import 'dart:typed_data';

import 'constants.dart';
import 'encoding.dart';
import 'transaction.dart';

///Represents a transaction for asset transfer.
///
///To begin accepting an asset, supply the same address as both sender and
///receiver, and set amount to 0.
///
///To revoke an asset, set revocation_target, and issue the transaction from
///the asset's revocation manager account.

class AssetTransferTxn extends Transaction {
  String receiver;
  int amt;
  int index;
  String close_assets_to;
  String revocation_target;

  AssetTransferTxn({
    String sender,
    int fee,
    int first_valid_round,
    int last_valid_round,
    Uint8List note,
    String genesis_id,
    String genesis_hash,
    Uint8List lease,
    this.amt,
    this.receiver,
    this.index,
    this.close_assets_to,
    this.revocation_target,
    flat_fee = false,
  }) : super(
      sender: sender,
      fee: fee,
      first_valid_round: first_valid_round,
      last_valid_round: last_valid_round,
      note: note,
      genesis_id: genesis_id,
      genesis_hash: genesis_hash,
      lease: lease,
      type: ASSET_TRANSFER_TXN) {
    this.fee = flat_fee
        ? max(MIN_TXN_FEE, fee)
        : max(estimate_size() * fee, MIN_TXN_FEE);
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    var m = super.dictify();

    if (amt > 0) {
      m['aamt'] = amt;
    }

    m['arcv'] = decode_address(receiver);

    if (close_assets_to != null) {
      m['aclose'] = decode_address(close_assets_to);
    }

    if (revocation_target != null) {
      m['asnd'] = decode_address(revocation_target);
    }

    m['xaid'] = index;

    return m;
  }

  static Map<String, dynamic> undictify(Map<String, dynamic> m) {
    return {
      'receiver': m.containsKey('arcv') ? encode_address(m['arcv']) : null,
      'amt': m.containsKey('aamt') ? m['aamt'] : 0,
      'index': m.containsKey('xaid') ? m['xaid'] : null,
      'close_assets_to': m.containsKey('aclose') ? encode_address(m['aclose']) : null,
      'revocation_target': m.containsKey('asnd') ? encode_address(m['asnd']) : null
    };
  }
}