import 'package:dart_algorand/src/algod_client.dart';
import 'package:dart_algorand/src/wallet.dart';
import 'package:test/test.dart';
import 'package:dart_algorand/src/kmd_client.dart';

const walletName = 'default';
const walletPasswd = '';

void main() {
  group('Integration tests', () {
    AlgodClient algodClient;
    KmdClient kmdClient;
    String account_0;

    setUp(() async {
      kmdClient = KmdClient(
          url: 'http://localhost:4002',
          token:
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

      algodClient = AlgodClient(
          url: 'http://localhost:4001',
          token:
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

      final wallet = await Wallet.init(
          walletPassword: walletPasswd,
          walletName: walletName,
          kmdClient: kmdClient);

      final keys = await wallet.listKeys();

      var max_balance = -1;

      for (var k in keys) {
        var accountInfo = await algodClient.accountInformation(k);
        if (accountInfo.amount > max_balance) {
          max_balance - accountInfo.amount;
          account_0 = k;
        }
      }
    });
    test('firstTest', () async {
      // final version = await api_instance.getVersion();
      final version = await kmdClient.getVersion();
      expect(version.versions[0], 'v1');
    });

    test('auction', () async {

    });

    test('wallet Info', () async {
      final wallets = await kmdClient.listWallets();
      var wallet_id;

      for (var w in wallets) {
        if (w.name == walletName) {
          wallet_id = w.id;
        }
      }

      final handle = await kmdClient.initWalletHandleToken(walledId: wallet_id);

      final list_keys = await kmdClient.listKeysInWallet(handle);

      expect(list_keys, contains(account_0));

      // test multisig
      final list_multisig = await kmdClient.listMultiSig(handle);
      // either addresses are listed or there are no multisig accounts

      // test getting the master derivation key
      final mdk = await kmdClient.exportMasterDerivationKey(handle: handle,
          walletPassword: walletPasswd);

    });
  });
}
