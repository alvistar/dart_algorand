import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';

import 'kmd_client.dart';

/// Represents a wallet.
class Wallet {
  String walletName;
  String walletPassword;
  KmdClient kmdClient;
  String id;
  String handle;

  Wallet._internal({this.walletPassword, this.walletName, this.kmdClient});

  ///  walletName: wallet name
  ///  walletPassword: wallet password
  ///  kmdClient: a KMDClient to handle wallet requests
  ///  mdk: master derivation key if recovering wallet
  ///
  /// Note:
  ///        When initializing, if the wallet doesn't already exist, it will be
  ///        created.
  static Future<Wallet> init(
      {@required String walletName,
      @required String walletPassword,
      @required KmdClient kmdClient,
      String driverName='sqlite',
      String mdk}) async {
    final wallet = Wallet._internal(
        walletName: walletName,
        walletPassword: walletPassword,
        kmdClient: kmdClient);

    final wallets = (await kmdClient.listWallets());

    for (var w in wallets) {
      if (w.name == walletName) {
        wallet.id = w.id;
      }
    }

    // Create wallet
    if (wallet.id == null) {
      throw UnimplementedError();
    }

    wallet.handle = await kmdClient.initWalletHandleToken(
        walledId: wallet.id, walletPassword: wallet.walletPassword);

    return wallet;
  }

  Future<BuiltList<String>> listKeys() async{
    return await kmdClient.listKeysInWallet(handle);
  }
}
