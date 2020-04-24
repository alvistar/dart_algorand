import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/asset_config_txn.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final freezePrivateKey = to_private_key(mnemonic);
  final freezeAddress = address_from_private_key(freezePrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';

  final index = 1234; // identifying index of the asset
  final freezeTarget = generate_account(); // address to be frozen or unfrozen

  // create the asset config transaction
  final txn = AssetFreezeTxn(
    sender: freezeAddress,
    fee: feePerByte,
    first_valid_round: firstValidRound,
    last_valid_round: lastValidRound,
    genesis_hash: genesisHash,
    index: index,
    target: freezeTarget.address,
    new_freeze_state: true,
  );

  // sign the transction
  final signedTxn = txn.sign(freezePrivateKey);
}
