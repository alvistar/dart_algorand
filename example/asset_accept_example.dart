import 'package:dart_algorand/dart_algorand.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final senderPrivateKey = to_private_key(mnemonic);
  final senderAddress = address_from_private_key(senderPrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';
  final index = 1234; // identifying index of the asset

  // create the asset config transaction
  final txn = AssetTransferTxn(
    sender: senderAddress,
    fee: feePerByte,
    first_valid_round: firstValidRound,
    last_valid_round: lastValidRound,
    genesis_hash: genesisHash,
    index: index,
    receiver: senderAddress, // to start accepting assets, set receiver to sender
    amt: 0, // to start accepting assets, set amount to 0
  );

  // sign the transction
  final signedTxn = txn.sign(senderPrivateKey);
}