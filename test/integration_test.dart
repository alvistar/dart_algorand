import 'package:dart_algorand/dart_algorand.dart';
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

    Future<String> getWalletId() async {
      final wallets = await kmdClient.listWallets();

      return wallets
          .firstWhere((e) => e.name == walletName)
          .id;
    }

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
      // get default wallet
      final wallets = await kmdClient.listWallets();
      var wallet_id;

      for (var w in wallets) {
        if (w.name == walletName) {
          wallet_id = w.id;
        }
      }

      // get a new handle for the wallet
      final handle = await kmdClient.initWalletHandleToken(walledId: wallet_id);

      // generate account with kmd
      // TODO: implement
      throw UnimplementedError();
    });

    test('handle', () async {
      // create wallet; should raise error since wallet already exists
      expect(
              () async =>
          await kmdClient.createWallet(
              name: walletName, password: walletPasswd),
          throwsA(predicate((e) =>
          e is ClientError &&
              e.response.data['message'] ==
                  'wallet with same name already exists')));

      // get the wallet id
      final walletID = await getWalletId();

      // rename wallet
      var newWallet = await kmdClient.renameWallet(
          id: walletID,
          password: walletPasswd,
          newName: walletName + 'newname');

      expect(newWallet.name, walletName + 'newname');

      // change it back
      newWallet = await kmdClient.renameWallet(
          id: walletID, password: walletPasswd, newName: walletName);
      expect(newWallet.name, walletName);

      // get new handle for the wallet
      final handle = await kmdClient.initWalletHandleToken(
          walledId: walletID, walletPassword: walletPasswd);

      // get wallet
      final walletHandle = await kmdClient.getWalletInfo(handle);
      expect(walletHandle.expiresSeconds, greaterThan(0));

      // renew handle
      final renewed_handle = await kmdClient.renewWalletHandle(handle);
      expect(renewed_handle.expiresSeconds, greaterThan(0));

      // release the handle
      expect(await kmdClient.releaseWalletHandle(handle), isTrue);

      // check the handle has been released
      expect(() async => await kmdClient.getWalletInfo(handle),
          throwsA(isA <ClientError>()));
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
      final mdk = await kmdClient.exportMasterDerivationKey(
          handle: handle, walletPassword: walletPasswd);
    });
  });
}
`