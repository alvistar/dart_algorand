import 'dart:convert';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/algod_client.dart';
import 'package:dart_algorand/src/auction.dart';
import 'package:dart_algorand/src/multisig_txn.dart';
import 'package:dart_algorand/src/wallet.dart';
import 'package:test/test.dart';
import 'package:dart_algorand/src/kmd_client.dart';

const walletName = 'default';
const walletPasswd = '';

void main() {
  group('Integration tests', () {
    AlgodClient algodClient;
    KmdClient kmdClient;
    String account0;

    Future<String> getWalletId() async {
      final wallets = await kmdClient.listWallets();

      return wallets.firstWhere((e) => e.name == walletName).id;
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
          max_balance = accountInfo.amount;
          account0 = k;
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
      final walletID = await getWalletId();

      // get a new handle for the wallet
      final handle = await kmdClient.initWalletHandleToken(walledId: walletID);

      // generate account with kmd
      final account1 =
          await kmdClient.generateKey(handle: handle, displayMnemonic: false);

      addTearDown(() async =>
          // delete key
          await kmdClient.deleteKey(
              handle: handle, password: walletPasswd, address: account1));

      // get suggested params and fee
      final params = await algodClient.transactionParams();

      // get account0 private key
      final privateKey0 = await kmdClient.exportKey(
          handle: handle, password: walletPasswd, address: account0);

      // create bid
      final bid = Bid(
          bidder: account0,
          bid_currency: 10000,
          max_price: 260,
          bid_id: 3,
          auction_key: account1,
          auction_id: 4);

      final sb = bid.sign(privateKey0);
      final nf =
          NoteField(signed_bid: sb, note_field_type: NOTE_FIELD_TYPE_BID);

      // Create transaction
      final txn = PaymentTxn(
          sender: account0,
          fee: params.fee,
          first_valid_round: params.lastRound,
          last_valid_round: params.lastRound + 100,
          genesis_hash: params.genesishashb64,
          receiver: account1,
          amt: 1000,
          note: base64Decode(msgpack_encode(nf)),
          genesis_id: params.genesisID);

      // sign transaction with account
      final stxn = txn.sign(privateKey0);

      // send transaction
      final send = await algodClient.sendTransaction(stxn);
      expect(send, txn.get_txid());
    }, skip: 'Avoid sending funds');

    test('transaction', () async {
      final walletID = await getWalletId();

      // get a new handle for the wallet
      final handle = await kmdClient.initWalletHandleToken(walledId: walletID);

      // generate account and check if it's valid
      final account1 = generate_account();
      expect(is_valid_address(account1.address), isTrue);

      // import generated account
      final importAddress = await kmdClient.importKey(
          handle: handle, privateKey: account1.private_key);

      String account2;

      addTearDown(() async {
        // delete keys
        await kmdClient.deleteKey(
            handle: handle, password: walletPasswd, address: account1.address);

        await kmdClient.deleteKey(
            handle: handle, password: walletPasswd, address: account2);
      });

      expect(importAddress, account1.address);

      // generate account with kmd
      account2 =
          await kmdClient.generateKey(handle: handle, displayMnemonic: false);

      // get suggested params
      final params = await algodClient.transactionParams();

      // create transaction
      final txn = PaymentTxn(
          sender: account0,
          fee: params.fee,
          first_valid_round: params.lastRound,
          last_valid_round: params.lastRound + 100,
          genesis_hash: params.genesishashb64,
          genesis_id: params.genesisID,
          receiver: account1.address,
          amt: 100000);

      // sign transaction with kmd
      final signedTxn = await kmdClient.signTransaction(
          handle: handle, password: walletPasswd, transaction: txn);

      // get account0 private key
      final privateKey0 = await kmdClient.exportKey(
          handle: handle, password: walletPasswd, address: account0);

      // sign transaction with account
      final signedTxnLocal = txn.sign(privateKey0);
      final txid = txn.get_txid();

      // check that signing both ways results in the same thing
      expect(msgpack_encode(signedTxn), msgpack_encode(signedTxnLocal));

      // send transaction
      final send = await algodClient.sendTransaction(signedTxnLocal);
      expect(send, txid);

      // get transaction info in pending transactions
      expect((await algodClient.pendingTransactionInfo(txid)).tx, txid);

      // wait for transaction to send
      await algodClient.statusAfterBlock(params.lastRound + 2);

      // get transaction info in two different ways
      final info1 = await algodClient.transactionsByAddress(
          address: account0,
          first: params.lastRound - 2,
          last: params.lastRound + 2);

      final info2 = await algodClient.transactionInfo(
          address: account0, transactionID: txid);

      expect(info1.transactions, isNotEmpty);
      expect(info2.tx, txid);
    }, skip: 'Taking long and spending');

    test('multisig', () async {
      final walletID = await getWalletId();
      String account1, account2, msigAddress;

      // get new handle for wallet
      final handle = await kmdClient.initWalletHandleToken(
          walledId: walletID, walletPassword: walletPasswd);

      addTearDown(() async {
        // delete keys
        await kmdClient.deleteKey(
            handle: handle, password: walletPasswd, address: account1);

        await kmdClient.deleteKey(
            handle: handle, password: walletPasswd, address: account2);

        await kmdClient.deleteKey(
            handle: handle, password: walletPasswd, address: msigAddress);
      });

      // generate two accounts with kmd
      account1 =
          await kmdClient.generateKey(handle: handle, displayMnemonic: false);

      account2 =
          await kmdClient.generateKey(handle: handle, displayMnemonic: false);

      // get their private keys
      final privateKey1 = await kmdClient.exportKey(
          handle: handle, password: walletPasswd, address: account1);

      final privateKey2 = await kmdClient.exportKey(
          handle: handle, password: walletPasswd, address: account2);

      // get suggested params and fee
      final params = await algodClient.transactionParams();

      // create multisig account and transaction
      final msig =
          Multisig(version: 1, threshold: 2, addresses: [account1, account2]);

      final txn = PaymentTxn(
          sender: msig.address(),
          fee: params.fee,
          first_valid_round: params.lastRound,
          last_valid_round: params.lastRound + 100,
          genesis_id: params.genesisID,
          genesis_hash: params.genesishashb64,
          receiver: account0,
          amt: 1000);

      // check the multisig account is valid
      msig.validate();

      // import multisig account
      msigAddress =
          await kmdClient.importMultisig(handle: handle, multisig: msig);

      // export multisig account
      final exported =
          await kmdClient.exportMultisig(handle: handle, address: msigAddress);

      expect(exported.subsigs.length, 2);

      // create multisig transaction
      final mtx = MultisigTransaction(transaction: txn, multisig: msig);

      // sign using kmd
      final msig1 = await kmdClient.signMultisigTransaction(
          handle: handle,
          password: walletPasswd,
          publicKey: account1,
          mtx: mtx);

      final signedKmd = await kmdClient.signMultisigTransaction(
          handle: handle,
          password: walletPasswd,
          publicKey: account2,
          mtx: msig1);

      // sign offline
      final mtx1 = MultisigTransaction(transaction: txn, multisig: msig);
      mtx1.sign(privateKey1);
      final mtx2 = MultisigTransaction(transaction: txn, multisig: msig);
      mtx2.sign(privateKey2);
      final signedLocal = MultisigTransaction.merge([mtx1, mtx2]);

      final tmp = signedLocal.dictify();
      final tmp2 = signedKmd.dictify();

      // check that they are the same
      expect(tmp, tmp2);
      expect(msgpack_encode(signedLocal), msgpack_encode(signedKmd));
    });

    test('handle', () async {
      // create wallet; should raise error since wallet already exists
      expect(
          () async => await kmdClient.createWallet(
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
          throwsA(isA<ClientError>()));
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

      expect(list_keys, contains(account0));

      // test multisig
      final list_multisig = await kmdClient.listMultiSig(handle);
      // either addresses are listed or there are no multisig accounts

      // test getting the master derivation key
      final mdk = await kmdClient.exportMasterDerivationKey(
          handle: handle, walletPassword: walletPasswd);
    });
  });
}
