import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create a kmd client
  final kcl = KmdClient(token: kmdToken, url: kmdUrl);

  // create a wallet object
  final wallet = await Wallet.init(
      walletName: existingWalletName,
      walletPassword: existingWalletPassword,
      kmdClient: kcl);

  // get the wallet's master derivation key
  final mdk = await wallet.exportMasterDerivationKey();
  print('Master derivation key: ${mdk}');

  // get backup phrase
  final backup = from_master_derivation_key(mdk);
  print('Wallet backup phrase: ${backup}');
}
