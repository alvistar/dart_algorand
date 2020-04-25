import 'package:built_collection/built_collection.dart';
import 'package:dart_algorand/src/multisig_txn.dart';
import 'package:meta/meta.dart';

import '../dart_algorand.dart';
import '../kmd.dart';
import 'kmd_client.dart';

/// Represents a wallet.
class Wallet {
  String walletName;
  String walletPassword;
  KmdClient kmdClient;
  String id;
  String _handle;

  Future<String> get handle async {
    if (_handle == null) {
      await init_handle();
    } else {
      try {
        await renew_handle();
      } catch (e) {
        await init_handle();
      }
    }

    return _handle;
  }

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
      String driverName = 'sqlite',
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

    wallet._handle = await kmdClient.initWalletHandleToken(
        walledId: wallet.id, walletPassword: wallet.walletPassword);

    return wallet;
  }

  /// Get a new handle.
  Future<bool> init_handle() async {
    _handle = await kmdClient.initWalletHandleToken(
        walledId: id, walletPassword: walletPassword);
    return true;
  }

  /// Renew handle
  Future<APIV1WalletHandle> renew_handle() async {
    return await kmdClient.renewWalletHandle(_handle);
  }

  /// List all keys in the wallet.
  Future<BuiltList<String>> listKeys() async {
    return await kmdClient.listKeysInWallet(await handle);
  }

  /// Get the wallet's master derivation key.
  Future<String> exportMasterDerivationKey() async {
    return await (kmdClient.exportMasterDerivationKey(
        handle: await handle, walletPassword: walletPassword));
  }

  /// Get recovery phrase mnemonic for the wallet.
  Future<String> getMnemonic() async {
    final mdk = await exportMasterDerivationKey();
    return from_master_derivation_key(mdk);
  }

  /// Delete a key in the wallet.
  Future<bool> deleteKey(String address) async {
    return await kmdClient.deleteKey(
        handle: await handle, password: walletPassword, address: address);
  }

  /// Import an account into a wallet.
  /// Return base32 address of the account
  Future<String> importKey(String privateKey) async {
    return await kmdClient.importKey(
        handle: await handle, privateKey: privateKey);
  }

  /// Generate a key in the wallet.
  /// Return base32 address of the account
  Future<String> generateKey([bool displayMnemonic = false]) async {
    return await kmdClient.generateKey(
        handle: await handle, displayMnemonic: displayMnemonic);
  }

  /// Return an account [address] private key.
  Future<String> exportKey(String address) async {
    return await kmdClient.exportKey(
        handle: await handle, password: walletPassword, address: address);
  }

  /// Sign a transaction [txn].
  Future<SignedTransaction> signTransaction(Transaction txn) async {
    return await kmdClient.signTransaction(
        handle: await handle, password: walletPassword, transaction: txn);
  }

  /// Import a [multisig] account into the wallet.
  /// Returns base32 address of the multisig account
  Future<String> importMultisig(Multisig multisig) async {
    return await kmdClient.importMultisig(
        handle: await handle, multisig: multisig);
  }

  /// List all multisig accounts in the wallet.
  /// Returns list of base32 multisig account addresses
  Future<BuiltList<String>> listMultisig() async {
    return await kmdClient.listMultiSig(await handle);
  }

  /// Export a multisig account [address].
  /// Returns multisig object corresponding to the addres
  Future<Multisig> exportMultisig(String address) async {
    return await kmdClient.exportMultisig(
        handle: await handle, address: address);
  }

  /// Sign a multisig transaction [mtx] for the given public key [publicKey].
  /// [publicKey] is base32 address that is signing the transaction
  /// [mtx] contains unsigned or partially signed multisig
  /// Returns multisig transaction with added signature
  Future<MultisigTransaction> signMultisigTransaction(
      String publicKey, MultisigTransaction mtx) async {
    return await kmdClient.signMultisigTransaction(
        handle: await handle,
        password: walletPassword,
        publicKey: publicKey,
        mtx: mtx);
  }

  /// Rename the wallet with [newName]
  Future<APIV1Wallet> rename(String newName) async {
    final result = await kmdClient.renameWallet(
        id: id, password: walletPassword, newName: newName);

    walletName = newName;
    return result;
  }

  /// Get wallet information
  Future<APIV1WalletHandle> info() async {
    return await kmdClient.getWalletInfo(await handle);
  }

  /// Deactivate the current handle
  Future<bool> releaseHandle() async {
    final result = await kmdClient.releaseWalletHandle(_handle);
    _handle = null;
    return result;
  }
}
