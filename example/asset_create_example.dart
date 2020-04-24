import 'dart:convert';

import 'package:dart_algorand/dart_algorand.dart';

void main() async {
  final creator = generate_account();
  final freeze = generate_account();
  final manager = generate_account();
  final clawback = generate_account();
  final reserve = generate_account();

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';

  final total = 100; // how many of this asset there will be
  final assetName = 'assetname';
  final unitName = 'unitname';
  final url = 'website';

  final metadata = AsciiEncoder()
      .convert('fACPO4nRgO55j1ndAK3W6Sgc4APkcyFh'); // should be a 32-byte hash

  final defaultFrozen = false; // whether accounts should be frozen by default

// create the asset creation transaction
  final txn = AssetConfigTxn(
      sender: creator.address,
      fee: feePerByte,
      first_valid_round: firstValidRound,
      last_valid_round: lastValidRound,
      genesis_hash: genesisHash,
      total: total,
      manager: manager.address,
      reserve: reserve.address,
      freeze: freeze.address,
      clawback: clawback.address,
      unit_name: unitName,
      asset_name: assetName,
      url: url,
      metadata_hash: metadata,
      default_frozen: defaultFrozen
  );

// sign the transaction
  final signed_txn = txn.sign(creator.private_key);
}