import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';

import '../model/list_multisig_request.dart';
import '../model/create_wallet_request.dart';
import '../model/sign_multisig_request.dart';
import '../model/wallet_info_request.dart';
import '../model/sign_program_request.dart';
import '../model/apiv1_delete_multisig_response.dart';
import '../model/apiv1_post_multisig_transaction_sign_response.dart';
import '../model/apiv1_get_wallets_response.dart';
import '../model/apiv1_post_wallet_renew_response.dart';
import '../model/apiv1_post_multisig_export_response.dart';
import '../model/apiv1_post_key_import_response.dart';
import '../model/apiv1_post_wallet_response.dart';
import '../model/apiv1_post_key_response.dart';
import '../model/apiv1_post_program_sign_response.dart';
import '../model/apiv1_post_key_list_response.dart';
import '../model/delete_key_request.dart';
import '../model/export_key_request.dart';
import '../model/apiv1_post_wallet_init_response.dart';
import '../model/delete_multisig_request.dart';
import '../model/apiv1_post_multisig_program_sign_response.dart';
import '../model/export_master_key_request.dart';
import '../model/generate_key_request.dart';
import '../model/apiv1_post_master_key_export_response.dart';
import '../model/apiv1_post_wallet_info_response.dart';
import '../model/import_key_request.dart';
import '../model/init_wallet_handle_token_request.dart';
import '../model/renew_wallet_handle_token_request.dart';
import '../model/sign_transaction_request.dart';
import '../model/release_wallet_handle_token_request.dart';
import '../model/rename_wallet_request.dart';
import '../model/apiv1_post_wallet_rename_response.dart';
import '../model/apiv1_delete_key_response.dart';
import '../model/sign_program_multisig_request.dart';
import '../model/versions_response.dart';
import '../model/import_multisig_request.dart';
import '../model/apiv1_post_transaction_sign_response.dart';
import '../model/apiv1_post_key_export_response.dart';
import '../model/export_multisig_request.dart';
import '../model/apiv1_post_multisig_import_response.dart';
import '../model/apiv1_post_multisig_list_response.dart';
import '../model/apiv1_post_wallet_release_response.dart';
import '../model/list_keys_request.dart';

class KmdApi {
  final Dio _dio;
  Serializers _serializers;

  KmdApi(this._dio, this._serializers);

  /// Create a wallet
  ///
  /// Create a new wallet (collection of keys) with the given parameters.
  Future<Response<APIV1POSTWalletResponse>> createWallet(
    CreateWalletRequest createWalletRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/wallet';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        CreateWalletRequest.serializer, createWalletRequest);
    var jsoncreateWalletRequest = json.encode(serializedBody);
    bodyData = jsoncreateWalletRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(APIV1POSTWalletResponse);
      var data = _serializers.deserializeWith<APIV1POSTWalletResponse>(
          serializer, response.data);

      return Response<APIV1POSTWalletResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Delete a key
  ///
  /// Deletes the key with the passed public key from the wallet.
  Future<Response<APIV1DELETEKeyResponse>> deleteKey(
    DeleteKeyRequest deleteKeyRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/key';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(deleteKeyRequest);
    var jsondeleteKeyRequest = json.encode(serializedBody);
    bodyData = jsondeleteKeyRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'delete'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(APIV1DELETEKeyResponse);
      var data = _serializers.deserializeWith<APIV1DELETEKeyResponse>(
          serializer, response.data);

      return Response<APIV1DELETEKeyResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Delete a multisig
  ///
  /// Deletes multisig preimage information for the passed address from the wallet.
  Future<Response<APIV1DELETEMultisigResponse>> deleteMultisig(
    DeleteMultisigRequest deleteMultisigRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/multisig';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(deleteMultisigRequest);
    var jsondeleteMultisigRequest = json.encode(serializedBody);
    bodyData = jsondeleteMultisigRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'delete'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1DELETEMultisigResponse);
      var data = _serializers.deserializeWith<APIV1DELETEMultisigResponse>(
          serializer, response.data);

      return Response<APIV1DELETEMultisigResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Export a key
  ///
  /// Export the secret key associated with the passed public key.
  Future<Response<APIV1POSTKeyExportResponse>> exportKey(
    ExportKeyRequest exportKeyRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/key/export';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(exportKeyRequest);
    var jsonexportKeyRequest = json.encode(serializedBody);
    bodyData = jsonexportKeyRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTKeyExportResponse);
      var data = _serializers.deserializeWith<APIV1POSTKeyExportResponse>(
          serializer, response.data);

      return Response<APIV1POSTKeyExportResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Export the master derivation key from a wallet
  ///
  /// Export the master derivation key from the wallet. This key is a master \&quot;backup\&quot; key for the underlying wallet. With it, you can regenerate all of the wallets that have been generated with this wallet&#39;s &#x60;POST /v1/key&#x60; endpoint. This key will not allow you to recover keys imported from other wallets, however.
  Future<Response<APIV1POSTMasterKeyExportResponse>> exportMasterKey(
    ExportMasterKeyRequest exportMasterKeyRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/master-key/export';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        ExportMasterKeyRequest.serializer, exportMasterKeyRequest);
    var jsonexportMasterKeyRequest = json.encode(serializedBody);
    bodyData = jsonexportMasterKeyRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTMasterKeyExportResponse);
      var data = _serializers.deserializeWith<APIV1POSTMasterKeyExportResponse>(
          serializer, response.data);

      return Response<APIV1POSTMasterKeyExportResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Export multisig address metadata
  ///
  /// Given a multisig address whose preimage this wallet stores, returns the information used to generate the address, including public keys, threshold, and multisig version.
  Future<Response<APIV1POSTMultisigExportResponse>> exportMultisig(
    ExportMultisigRequest exportMultisigRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/multisig/export';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(exportMultisigRequest);
    var jsonexportMultisigRequest = json.encode(serializedBody);
    bodyData = jsonexportMultisigRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTMultisigExportResponse);
      var data = _serializers.deserializeWith<APIV1POSTMultisigExportResponse>(
          serializer, response.data);

      return Response<APIV1POSTMultisigExportResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Generate a key
  ///
  /// Generates the next key in the deterministic key sequence (as determined by the master derivation key) and adds it to the wallet, returning the public key.
  Future<Response<APIV1POSTKeyResponse>> generateKey(
    GenerateKeyRequest generateKeyRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/key';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(generateKeyRequest);
    var jsongenerateKeyRequest = json.encode(serializedBody);
    bodyData = jsongenerateKeyRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(APIV1POSTKeyResponse);
      var data = _serializers.deserializeWith<APIV1POSTKeyResponse>(
          serializer, response.data);

      return Response<APIV1POSTKeyResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Retrieves the current version
  ///
  ///
  Future<Response<VersionsResponse>> getVersion({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/versions';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(VersionsResponse);
      var data = _serializers.deserializeWith<VersionsResponse>(
          serializer, response.data);

      return Response<VersionsResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Get wallet info
  ///
  /// Returns information about the wallet associated with the passed wallet handle token. Additionally returns expiration information about the token itself.
  Future<Response<APIV1POSTWalletInfoResponse>> getWalletInfo(
    WalletInfoRequest getWalletInfoRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/wallet/info';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        WalletInfoRequest.serializer, getWalletInfoRequest);
    var jsongetWalletInfoRequest = json.encode(serializedBody);
    bodyData = jsongetWalletInfoRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTWalletInfoResponse);
      var data = _serializers.deserializeWith<APIV1POSTWalletInfoResponse>(
          serializer, response.data);

      return Response<APIV1POSTWalletInfoResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Import a key
  ///
  /// Import an externally generated key into the wallet. Note that if you wish to back up the imported key, you must do so by backing up the entire wallet database, because imported keys were not derived from the wallet&#39;s master derivation key.
  Future<Response<APIV1POSTKeyImportResponse>> importKey(
    ImportKeyRequest importKeyRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/key/import';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(importKeyRequest);
    var jsonimportKeyRequest = json.encode(serializedBody);
    bodyData = jsonimportKeyRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTKeyImportResponse);
      var data = _serializers.deserializeWith<APIV1POSTKeyImportResponse>(
          serializer, response.data);

      return Response<APIV1POSTKeyImportResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Import a multisig account
  ///
  /// Generates a multisig account from the passed public keys array and multisig metadata, and stores all of this in the wallet.
  Future<Response<APIV1POSTMultisigImportResponse>> importMultisig(
    ImportMultisigRequest importMultisigRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/multisig/import';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(importMultisigRequest);
    var jsonimportMultisigRequest = json.encode(serializedBody);
    bodyData = jsonimportMultisigRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTMultisigImportResponse);
      var data = _serializers.deserializeWith<APIV1POSTMultisigImportResponse>(
          serializer, response.data);

      return Response<APIV1POSTMultisigImportResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Initialize a wallet handle token
  ///
  /// Unlock the wallet and return a wallet handle token that can be used for subsequent operations. These tokens expire periodically and must be renewed. You can &#x60;POST&#x60; the token to &#x60;/v1/wallet/info&#x60; to see how much time remains until expiration, and renew it with &#x60;/v1/wallet/renew&#x60;. When you&#39;re done, you can invalidate the token with &#x60;/v1/wallet/release&#x60;.
  Future<Response<APIV1POSTWalletInitResponse>> initWalletHandleToken(
    InitWalletHandleTokenRequest initializeWalletHandleTokenRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/wallet/init';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        InitWalletHandleTokenRequest.serializer,
        initializeWalletHandleTokenRequest);
    var jsoninitializeWalletHandleTokenRequest = json.encode(serializedBody);
    bodyData = jsoninitializeWalletHandleTokenRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTWalletInitResponse);
      var data = _serializers.deserializeWith<APIV1POSTWalletInitResponse>(
          serializer, response.data);

      return Response<APIV1POSTWalletInitResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// List keys in wallet
  ///
  /// Lists all of the public keys in this wallet. All of them have a stored private key.
  Future<Response<APIV1POSTKeyListResponse>> listKeysInWallet(
    ListKeysRequest listKeysRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/key/list';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody =
        _serializers.serializeWith(ListKeysRequest.serializer, listKeysRequest);
    var jsonlistKeysRequest = json.encode(serializedBody);
    bodyData = jsonlistKeysRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(APIV1POSTKeyListResponse);
      var data = _serializers.deserializeWith<APIV1POSTKeyListResponse>(
          serializer, response.data);

      return Response<APIV1POSTKeyListResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// List multisig accounts
  ///
  /// Lists all of the multisig accounts whose preimages this wallet stores
  Future<Response<APIV1POSTMultisigListResponse>> listMultisg(
    ListMultisigRequest listMultisigRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/multisig/list';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        ListMultisigRequest.serializer, listMultisigRequest);
    var jsonlistMultisigRequest = json.encode(serializedBody);
    bodyData = jsonlistMultisigRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTMultisigListResponse);
      var data = _serializers.deserializeWith<APIV1POSTMultisigListResponse>(
          serializer, response.data);

      return Response<APIV1POSTMultisigListResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// List wallets
  ///
  /// Lists all of the wallets that kmd is aware of.
  Future<Response<APIV1GETWalletsResponse>> listWallets({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/wallets';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(APIV1GETWalletsResponse);
      var data = _serializers.deserializeWith<APIV1GETWalletsResponse>(
          serializer, response.data);

      return Response<APIV1GETWalletsResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Release a wallet handle token
  ///
  /// Invalidate the passed wallet handle token, making it invalid for use in subsequent requests.
  Future<Response<APIV1POSTWalletReleaseResponse>> releaseWalletHandleToken(
    ReleaseWalletHandleTokenRequest releaseWalletHandleTokenRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/wallet/release';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        ReleaseWalletHandleTokenRequest.serializer,
        releaseWalletHandleTokenRequest);
    var jsonreleaseWalletHandleTokenRequest = json.encode(serializedBody);
    bodyData = jsonreleaseWalletHandleTokenRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTWalletReleaseResponse);
      var data = _serializers.deserializeWith<APIV1POSTWalletReleaseResponse>(
          serializer, response.data);

      return Response<APIV1POSTWalletReleaseResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Rename a wallet
  ///
  /// Rename the underlying wallet to something else
  Future<Response<APIV1POSTWalletRenameResponse>> renameWallet(
    RenameWalletRequest renameWalletRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/wallet/rename';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        RenameWalletRequest.serializer, renameWalletRequest);
    var jsonrenameWalletRequest = json.encode(serializedBody);
    bodyData = jsonrenameWalletRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTWalletRenameResponse);
      var data = _serializers.deserializeWith<APIV1POSTWalletRenameResponse>(
          serializer, response.data);

      return Response<APIV1POSTWalletRenameResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Renew a wallet handle token
  ///
  /// Renew a wallet handle token, increasing its expiration duration to its initial value
  Future<Response<APIV1POSTWalletRenewResponse>> renewWalletHandleToken(
    RenewWalletHandleTokenRequest renewWalletHandleTokenRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/wallet/renew';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serializeWith(
        RenewWalletHandleTokenRequest.serializer,
        renewWalletHandleTokenRequest);
    var jsonrenewWalletHandleTokenRequest = json.encode(serializedBody);
    bodyData = jsonrenewWalletHandleTokenRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTWalletRenewResponse);
      var data = _serializers.deserializeWith<APIV1POSTWalletRenewResponse>(
          serializer, response.data);

      return Response<APIV1POSTWalletRenewResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Sign a program for a multisig account
  ///
  /// Start a multisig signature, or add a signature to a partially completed multisig signature object.
  Future<Response<APIV1POSTMultisigProgramSignResponse>> signMultisigProgram(
    SignProgramMultisigRequest signMultisigProgramRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/multisig/signprogram';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(signMultisigProgramRequest);
    var jsonsignMultisigProgramRequest = json.encode(serializedBody);
    bodyData = jsonsignMultisigProgramRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTMultisigProgramSignResponse);
      var data =
          _serializers.deserializeWith<APIV1POSTMultisigProgramSignResponse>(
              serializer, response.data);

      return Response<APIV1POSTMultisigProgramSignResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Sign a multisig transaction
  ///
  /// Start a multisig signature, or add a signature to a partially completed multisig signature object.
  Future<Response<APIV1POSTMultisigTransactionSignResponse>>
      signMultisigTransaction(
    SignMultisigRequest signMultisigTransactionRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/multisig/sign';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(signMultisigTransactionRequest);
    var jsonsignMultisigTransactionRequest = json.encode(serializedBody);
    bodyData = jsonsignMultisigTransactionRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers
          .serializerForType(APIV1POSTMultisigTransactionSignResponse);
      var data = _serializers
          .deserializeWith<APIV1POSTMultisigTransactionSignResponse>(
              serializer, response.data);

      return Response<APIV1POSTMultisigTransactionSignResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Sign program
  ///
  /// Signs the passed program with a key from the wallet, determined by the account named in the request.
  Future<Response<APIV1POSTProgramSignResponse>> signProgram(
    SignProgramRequest signProgramRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/program/sign';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(signProgramRequest);
    var jsonsignProgramRequest = json.encode(serializedBody);
    bodyData = jsonsignProgramRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTProgramSignResponse);
      var data = _serializers.deserializeWith<APIV1POSTProgramSignResponse>(
          serializer, response.data);

      return Response<APIV1POSTProgramSignResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Sign a transaction
  ///
  /// Signs the passed transaction with a key from the wallet, determined by the sender encoded in the transaction.
  Future<Response<APIV1POSTTransactionSignResponse>> signTransaction(
    SignTransactionRequest signTransactionRequest, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/v1/transaction/sign';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ['application/json'];

    var serializedBody = _serializers.serialize(signTransactionRequest);
    var jsonsignTransactionRequest = json.encode(serializedBody);
    bodyData = jsonsignTransactionRequest;

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer =
          _serializers.serializerForType(APIV1POSTTransactionSignResponse);
      var data = _serializers.deserializeWith<APIV1POSTTransactionSignResponse>(
          serializer, response.data);

      return Response<APIV1POSTTransactionSignResponse>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }

  /// Gets the current swagger spec.
  ///
  /// Returns the entire swagger spec in json.
  Future<Response<String>> swaggerHandler({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = '/swagger.json';

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = [];

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(String);
      var data =
          _serializers.deserializeWith<String>(serializer, response.data);

      return Response<String>(
        data: data,
        headers: response.headers,
        request: response.request,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }
}
