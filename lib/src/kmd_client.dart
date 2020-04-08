import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/kmd/model/apiv1_get_wallets_response.dart';
import 'package:dart_algorand/kmd/model/apiv1_post_key_list_response.dart';
import 'package:dart_algorand/kmd/model/apiv1_post_wallet_init_response.dart';
import 'package:dart_algorand/kmd/model/apiv1_wallet.dart';
import 'package:dart_algorand/kmd/model/export_master_key_request.dart';
import 'package:dart_algorand/kmd/model/init_wallet_handle_token_request.dart';
import 'package:dart_algorand/kmd/model/list_keys_request.dart';
import 'package:dart_algorand/kmd/model/list_multisig_request.dart';
import 'package:dart_algorand/kmd/model/versions_response.dart';
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
    final request = InitWalletHandleTokenRequest((b) => b
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
    final request = ExportMasterKeyRequest((b) => b
      ..walletHandleToken = handle
      ..walletPassword = walletPassword);

    return (await api.exportMasterKey(request)).data.masterDerivationKey;
  }
}
