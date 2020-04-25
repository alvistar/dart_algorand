import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';
import 'api/algod_api.dart';

class Openapi {
  Dio dio;
  Serializers serializers;
  String basePath;

  Openapi(
      {this.dio, Serializers serializers, this.basePath = 'http://localhost'}) {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: basePath,
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      dio = Dio(options);
    }

    this.serializers = serializers ?? standardSerializers;
  }

  AlgodApi getAlgodApi() {
    return AlgodApi(dio, serializers);
  }
}
