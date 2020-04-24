import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/asset_config_txn.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final managerPrivateKey = to_private_key(mnemonic);
  final managerAddress = address_from_private_key(managerPrivateKey);

  final newFreeze = generate_account();
  final newManager = generate_account();
  final newClawback = generate_account();
  final newReserve = generate_account();

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';

  final index = 1234; // identifying index of the asset

  // create the asset config transaction
  final txn = AssetConfigTxn(
      sender: managerAddress,
      fee: feePerByte,
      first_valid_round: firstValidRound,
      last_valid_round: lastValidRound,
      genesis_hash: genesisHash,
      manager: newManager.address,
      reserve: newReserve.address,
      freeze: newFreeze.address,
      clawback: newClawback.address,
      index: index);

  // sign the transction
  final signedTxn = txn.sign(managerPrivateKey);
}
