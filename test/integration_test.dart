import 'package:dart_algorand/kmd.dart';
import 'package:dart_algorand/kmd/model/init_wallet_handle_token_request.dart';
import 'package:dart_algorand/kmd/model/list_keys_request.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

const wallet_name = 'default';
const wallet_passwd = '';

void main() {
  KmdApi init_client({String token, String url}) {
    final options = BaseOptions(
      baseUrl: url,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
      options.headers['X-KMD-API-Token'] = token;
    }, onError: (DioError e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }

      return e;
    }));

    return Openapi(dio: dio).getKmdApi();
  }

  group('Integration tests', () {
    KmdApi api_instance;
    setUp(() {
      api_instance = init_client(
          url: 'http://localhost:4002',
          token:
              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    });
    test('firstTest', () async {
      final version = await api_instance.getVersion();
      expect(version.data.versions[0], 'v1');
    });

    test('wallet Info', () async {
      final wallets = await api_instance.listWallets();
      var wallet_id;

      for (var w in wallets.data.wallets) {
        if (w.name == wallet_name) {
          wallet_id = w.id;
        }
      }

      // get new handle for the wallet
      final handle = await api_instance
          .initWalletHandleToken(InitWalletHandleTokenRequest((b) => b
            ..walletId = wallet_id
            ..walletPassword = wallet_passwd));

      // test list keys
      final list_keys = await api_instance.listKeysInWallet(
        ListKeysRequest()
      )
    });
  });
}
