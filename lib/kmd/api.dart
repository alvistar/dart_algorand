library openapi.api;

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';
import 'api/kmd_api.dart';

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

  /// Get DefaultApi instance, base route and serializer can be overridden by a
  /// given but be careful,
  /// by doing that all interceptors will not be executed
  KmdApi getKmdApi() {
    return KmdApi(dio, serializers);
  }
}
