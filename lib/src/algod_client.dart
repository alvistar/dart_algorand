import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../algod.dart';
import '../dart_algorand.dart';

class AlgodClient {
  AlgodApi api;

  AlgodClient({@required String token, @required String url}) {
    final options = BaseOptions(
      baseUrl: url,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) {
      options.headers['X-Algo-API-Token'] = token;
    }, onError: (DioError e) {
      Exception newException;
      if (e.response != null) {
//        print(e.response.data);
//        print(e.response.headers);
//        print(e.response.request);
        throw ClientError(request:e.request, response:e.response, type: e.type, error: e.error);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }

      return e;
    }));

    api = Openapi(dio: dio).getAlgodApi();
  }

  Future<Account> accountInformation(String address) async{
    return (await api.accountInformation(address)).data;
  }
  
}