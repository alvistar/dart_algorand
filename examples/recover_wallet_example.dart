import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create a kmd client
  final kcl = KmdClient(token: kmdToken, url: kmdUrl);

  // get the master derivation key from the mnemonic
  final backup =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final mdk = to_master_derivation_key(backup);

  // recover the wallet by passing mdk when creating a wallet
  await kcl.createWallet(
      name: 'new_wallet', password: 'pass', masterDerivKey: mdk);
}
