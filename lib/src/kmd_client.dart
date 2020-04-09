import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/kmd/model/apiv1_get_wallets_response.dart';
import 'package:dart_algorand/kmd/model/apiv1_post_key_list_response.dart';
import 'package:dart_algorand/kmd/model/apiv1_post_wallet_init_response.dart';
import 'package:dart_algorand/kmd/model/apiv1_wallet.dart';
import 'package:dart_algorand/kmd/model/apiv1_wallet_handle.dart';
import 'package:dart_algorand/kmd/model/create_wallet_request.dart';
import 'package:dart_algorand/kmd/model/delete_key_request.dart';
import 'package:dart_algorand/kmd/model/export_key_request.dart';
import 'package:dart_algorand/kmd/model/export_master_key_request.dart';
import 'package:dart_algorand/kmd/model/generate_key_request.dart';
import 'package:dart_algorand/kmd/model/import_key_request.dart';
import 'package:dart_algorand/kmd/model/init_wallet_handle_token_request.dart';
import 'package:dart_algorand/kmd/model/list_keys_request.dart';
import 'package:dart_algorand/kmd/model/list_multisig_request.dart';
import 'package:dart_algorand/kmd/model/release_wallet_handle_token_request.dart';
import 'package:dart_algorand/kmd/model/rename_wallet_request.dart';
import 'package:dart_algorand/kmd/model/renew_wallet_handle_token_request.dart';
import 'package:dart_algorand/kmd/model/sign_multisig_request.dart';
import 'package:dart_algorand/kmd/model/sign_transaction_request.dart';
import 'package:dart_algorand/kmd/model/versions_response.dart';
import 'package:dart_algorand/kmd/model/wallet_info_request.dart';
import 'package:dio/dio.dart';
import 'package:dart_algorand/kmd.dart';
import 'package:meta/meta.dart';

class KmdClient {
  KmdApi api;

  KmdClient({String token, String url}) {
    final options = BaseOptions(
      baseUrl: url,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
      options.headers['X-KMD-API-Token'] = token;
    }, onError: (DioError e) {
      Exception newException;
      if (e.response != null) {
//        print(e.response.data);
//        print(e.response.headers);
//        print(e.response.request);
        throw ClientError(
            request: e.request,
            response: e.response,
            type: e.type,
            error: e.error);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }

      return e;
    }));

    api = Openapi(dio: dio).getKmdApi();
  }

  Future<VersionsResponse> getVersion() async {
    return (await api.getVersion()).data;
  }

  Future<BuiltList<APIV1Wallet>> listWallets() async {
    return (await api.listWallets()).data.wallets;
  }

  Future<String> initWalletHandleToken(
      {@required String walledId, String walletPassword}) async {
    final request = InitWalletHandleTokenRequest((b) =>
    b
      ..walletId = walledId
      ..walletPassword = walletPassword);

    return (await api.initWalletHandleToken(request)).data.walletHandleToken;
  }

  Future<BuiltList<String>> listKeysInWallet(String handle) async {
    final request = ListKeysRequest((b) => b.walletHandleToken = handle);

    return (await api.listKeysInWallet(request)).data.addresses;
  }

  Future<BuiltList<String>> listMultiSig(String handle) async {
    final request = ListMultisigRequest((b) => b.walletHandleToken = handle);

    return (await api.listMultisg(request)).data.addresses;
  }

  Future<String> exportMasterDerivationKey(
      {@required String handle, @required walletPassword}) async {
    final request = ExportMasterKeyRequest((b) =>
    b
      ..walletHandleToken = handle
      ..walletPassword = walletPassword);

    return (await api.exportMasterKey(request)).data.masterDerivationKey;
  }

  /// Create a new wallet.
  Future<APIV1Wallet> createWallet({@required String name,
    @required String password,
    String driverName = 'sqlite',
    String masterDerivKey}) async {
    final request = CreateWalletRequest((b) =>
    b
      ..masterDerivationKey = masterDerivKey
      ..walletPassword = password
      ..walletName = name
      ..walletDriverName = driverName);

    return (await api.createWallet(request)).data.wallet;
  }

  Future<APIV1Wallet> renameWallet({@required String id,
    @required String password,
    @required String newName}) async {
    final request = RenameWalletRequest((b) =>
    b
      ..walletId = id
      ..walletPassword = password
      ..walletName = newName);

    return (await api.renameWallet(request)).data.wallet;
  }

  Future<APIV1WalletHandle> getWalletInfo(String handle) async {
    final request = WalletInfoRequest((b) => b.walletHandleToken = handle);
    return (await api.getWalletInfo(request)).data.walletHandle;
  }

  Future<APIV1WalletHandle> renewWalletHandle(String handle) async {
    final request =
    RenewWalletHandleTokenRequest((b) => b.walletHandleToken = handle);
    return (await api.renewWalletHandleToken(request)).data.walletHandle;
  }

  Future<bool> releaseWalletHandle(String handle) async {
    final request =
    ReleaseWalletHandleTokenRequest((b) => b.walletHandleToken = handle);

    await api.releaseWalletHandleToken(request);

    return true;
  }

  /// Generate a key in the wallet.
  ///
  /// handle: wallet handle token
  /// display_mnemonic: whether or not the mnemonic should be displayed
  /// Returns base32 address of the generated account
  Future<String> generateKey(
      {@required String handle, bool displayMnemonic = true}) async {
    final request = GenerateKeyRequest((b) =>
    b
      ..walletHandleToken = handle
      ..displayMnemonic = displayMnemonic);

    return (await api.generateKey(request)).data.address;
  }

  /// Return an account private key.
  ///
  /// handle: wallet handle token
  /// password: wallet password
  /// address: base32 address of the account
  Future exportKey({@required String handle,
    @required String password,
    @required String address}) async {
    final request = ExportKeyRequest((b) =>
    b
      ..address = address
      ..walletHandleToken = handle
      ..walletPassword = password);

    return (await api.exportKey(request)).data.privateKey;
  }

  /// Delete a key in the wallet.
  Future<bool> deleteKey({@required String handle,
    @required String password,
    @required String address}) async {
    final request = DeleteKeyRequest((b) =>
    b
      ..walletPassword = password
      ..walletHandleToken = handle
      ..address = address);

    await api.deleteKey(request);
    return true;
  }

  /// Import an account into the wallet.
  /// Returns base32 address of the account
  Future<String> importKey(
      {@required String handle, @required String privateKey}) async {
    final request = ImportKeyRequest((b) =>
    b
      ..walletHandleToken = handle
      ..privateKey = privateKey);

    return (await api.importKey(request)).data.address;
  }

  /// Sign a transaction.
  /// Returns signed transaction with signature of sender
  Future<SignedTransaction> signTransaction({@required String handle,
    @required String password,
    @required Transaction transaction}) async {
    final request = SignTransactionRequest((b) =>
    b
      ..walletHandleToken = handle
      ..walletPassword = password
      ..transaction = msgpack_encode(transaction)
    );
    final signedTxn = (await api.signTransaction(request)).data
        .signedTransaction;

    return msgpack_decode(signedTxn);
  }

}
