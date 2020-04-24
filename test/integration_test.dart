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
    String address0;

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
          address0 = k;
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

      // get address0 private key
      final privateKey0 = await kmdClient.exportKey(
          handle: handle, password: walletPasswd, address: address0);

      // create bid
      final bid = Bid(
          bidder: address0,
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
          sender: address0,
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
          sender: address0,
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

      // get address0 private key
      final privateKey0 = await kmdClient.exportKey(
          handle: handle, password: walletPasswd, address: address0);

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
          address: address0,
          first: params.lastRound - 2,
          last: params.lastRound + 2);

      final info2 = await algodClient.transactionInfo(
          address: address0, transactionID: txid);

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
          receiver: address0,
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

      expect(list_keys, contains(address0));

      // test multisig
      final list_multisig = await kmdClient.listMultiSig(handle);
      // either addresses are listed or there are no multisig accounts

      // test getting the master derivation key
      final mdk = await kmdClient.exportMasterDerivationKey(
          handle: handle, walletPassword: walletPasswd);
    });

    test('wallet', () async {
      // initialize wallet
      final w = await Wallet.init(
          walletName: walletName,
          walletPassword: walletPasswd,
          kmdClient: kmdClient);

      AlgoAccount account1;
      String address2, msigAddress;

      addTearDown(() async {
        // delete keys
        await w.deleteKey(account1.address);
        await w.deleteKey(address2);
        await w.deleteKey(msigAddress);
      });

      // get master derivation key
      final mdk = await w.exportMasterDerivationKey();

      // get mnemonic
      final mn = await w.getMnemonic();

      // make sure mnemonic can be converted back to mdk
      expect(mdk, to_master_derivation_key(mn));

      // generate account with account and check if it's valid
      account1 = generate_account();

      // import generated account
      final importKey = await w.importKey(account1.private_key);
      expect(importKey, account1.address);

      // check account is in the wallet
      final keys = await w.listKeys();
      expect(keys, contains(account1.address));

      // generate account with kmd
      address2 = await w.generateKey();
      final privateKey2 = await w.exportKey(address2);

      // get suggested params and fee
      final params = await algodClient.transactionParams();

      // create transaction
      final txn = PaymentTxn(
          sender: address0,
          fee: params.fee,
          first_valid_round: params.lastRound,
          last_valid_round: params.lastRound + 100,
          genesis_hash: params.genesishashb64,
          genesis_id: params.genesisID,
          receiver: account1.address,
          amt: 100000);

      // sign transaction with wallet
      final signedKmd = await w.signTransaction(txn);

      // get address0 private key
      final privateKey0 = await w.exportKey(address0);

      // sign transaction offline
      final signedOffline = txn.sign(privateKey0);

      // check that signing both ways result in the same thing
      expect(msgpack_encode(signedOffline), msgpack_encode(signedKmd));

      // create multisig account and transaction
      final msig = Multisig(
          version: 1, threshold: 2, addresses: [account1.address, address2]);

      final mtxn = PaymentTxn(
          sender: msig.address(),
          fee: params.fee,
          first_valid_round: params.lastRound,
          last_valid_round: params.lastRound + 100,
          genesis_hash: params.genesishashb64,
          genesis_id: params.genesisID,
          receiver: address0,
          amt: 1000);

      // import multisig account and transaction
      msigAddress = await w.importMultisig(msig);

      // check that the multisig account is listed
      final msigs = await w.listMultisig();

      expect(msigs, contains(msigAddress));

      // export multisig account
      final exported = await w.exportMultisig(msigAddress);
      expect(exported.subsigs.length, 2);

      // create multisig transaction
      final mtx = MultisigTransaction(transaction: mtxn, multisig: msig);

      // sign the multisig using kmd
      final msig_1 = await w.signMultisigTransaction(account1.address, mtx);
      final signedMsigKmd = await w.signMultisigTransaction(address2, msig_1);

      // sign the multisig offline
      final mtx1 = MultisigTransaction(transaction: mtxn, multisig: msig);
      mtx1.sign(account1.private_key);
      final mtx2 = MultisigTransaction(transaction: mtxn, multisig: msig);
      mtx2.sign(privateKey2);
      final signedMsigOffline = MultisigTransaction.merge([mtx1, mtx2]);

      // check they are the same
      expect(msgpack_encode(signedMsigOffline), msgpack_encode(signedMsigKmd));

      // test renaming the wallet
      await w.rename(walletName + '1');
      var info = await w.info();
      expect(info.wallet.name, walletName + '1');

      await w.rename(walletName);
      info = await w.info();
      expect(info.wallet.name, walletName);

      // test releasing the handle
      await w.releaseHandle();
    });
  });
}
