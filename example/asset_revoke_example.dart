import 'package:dart_algorand/dart_algorand.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final clawbackPrivateKey = to_private_key(mnemonic);
  final clawbackAddress = address_from_private_key(clawbackPrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';
  final index = 1234; // identifying index of the asset
  final receiver = generate_account(); // where to send the revoked assets
  final targetAddress =
      'WO3QIJ6T4DZHBX5PWJH26JLHFSRT7W7M2DJOULPXDTUS6TUX7ZRIO4KDFY'; // address to revoke assets from.

  // create the asset config transaction
  final txn = AssetTransferTxn(
    sender: clawbackAddress,
    fee: feePerByte,
    first_valid_round: firstValidRound,
    last_valid_round: lastValidRound,
    genesis_hash: genesisHash,
    index: index,
    receiver: receiver.address,
    amt: 100,
    revocation_target: targetAddress,
  );

  // sign the transction
  final signedTxn = txn.sign(clawbackPrivateKey);
}
