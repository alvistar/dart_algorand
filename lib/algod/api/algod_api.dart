import 'dart:async';
import 'package:dart_algorand/algod/model/account.dart';
import 'package:dart_algorand/algod/model/asset_list.dart';
import 'package:dart_algorand/algod/model/asset_params.dart';
import 'package:dart_algorand/algod/model/block.dart';
import 'package:dart_algorand/algod/model/node_status.dart';
import 'package:dart_algorand/algod/model/pending_transactions.dart';
import 'package:dart_algorand/algod/model/supply.dart';
import 'package:dart_algorand/algod/model/transaction.dart';
import 'package:dart_algorand/algod/model/transaction_fee.dart';
import 'package:dart_algorand/algod/model/transaction_id.dart';
import 'package:dart_algorand/algod/model/transaction_list.dart';
import 'package:dart_algorand/algod/model/transaction_params.dart';
import 'package:dart_algorand/algod/model/version.dart';
import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:http/http.dart' as http;

import 'dart:typed_data';

class AlgodApi {
  final Dio _dio;
  Serializers _serializers;

  AlgodApi(this._dio, this._serializers);

  /// Get account information.
  ///
  /// Given a specific account public key, this call returns the accounts status, balance and spendable amounts
  Future<Response<Account>> accountInformation(
    String address, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/account/{address}"
        .replaceAll("{" r'address' "}", address.toString());

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(Account);
      var data =
          _serializers.deserializeWith<Account>(serializer, response.data);

      return Response<Account>(
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

  /// Get asset information.
  ///
  /// Given the asset&#39;s unique index, this call returns the asset&#39;s creator, manager, reserve, freeze, and clawback addresses
  Future<Response<AssetParams>> assetInformation(
    int index, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path =
        "/v1/asset/{index}".replaceAll("{" r'index' "}", index.toString());

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(AssetParams);
      var data =
          _serializers.deserializeWith<AssetParams>(serializer, response.data);

      return Response<AssetParams>(
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

  /// List assets
  ///
  /// Returns list of up to &#x60;max&#x60; assets, where the maximum assetIdx is &lt;&#x3D; &#x60;assetIdx&#x60;
  Future<Response<AssetList>> assets({
    int assetIdx,
    int max,
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/assets";

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams[r'assetIdx'] = assetIdx;
    queryParams[r'max'] = max;
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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(AssetList);
      var data =
          _serializers.deserializeWith<AssetList>(serializer, response.data);

      return Response<AssetList>(
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

  /// Get the block for the given round.
  ///
  ///
  Future<Response<Block>> getBlock(
    int round, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path =
        "/v1/block/{round}".replaceAll("{" r'round' "}", round.toString());

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(Block);
      var data = _serializers.deserializeWith<Block>(serializer, response.data);

      return Response<Block>(
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

  /// Get a list of unconfirmed transactions currently in the transaction pool.
  ///
  /// Get the list of pending transactions, sorted by priority, in decreasing order, truncated at the end at MAX. If MAX &#x3D; 0, returns all pending transactions.
  Future<Response<PendingTransactions>> getPendingTransactions({
    int max,
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/transactions/pending";

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams[r'max'] = max;
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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(PendingTransactions);
      var data = _serializers.deserializeWith<PendingTransactions>(
          serializer, response.data);

      return Response<PendingTransactions>(
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

  /// Get a list of unconfirmed transactions currently in the transaction pool by address.
  ///
  /// Get the list of pending transactions by address, sorted by priority, in decreasing order, truncated at the end at MAX. If MAX &#x3D; 0, returns all pending transactions.
  Future<Response<PendingTransactions>> getPendingTransactionsByAddress(
    String addr, {
    int max,
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/account/{addr}/transactions/pending"
        .replaceAll("{" r'addr' "}", addr.toString());

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams[r'max'] = max;
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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(PendingTransactions);
      var data = _serializers.deserializeWith<PendingTransactions>(
          serializer, response.data);

      return Response<PendingTransactions>(
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

  /// Gets the current node status.
  ///
  ///
  Future<Response<NodeStatus>> getStatus({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/status";

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(NodeStatus);
      var data =
          _serializers.deserializeWith<NodeStatus>(serializer, response.data);

      return Response<NodeStatus>(
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

  /// Get the current supply reported by the ledger.
  ///
  ///
  Future<Response<Supply>> getSupply({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/ledger/supply";

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(Supply);
      var data =
          _serializers.deserializeWith<Supply>(serializer, response.data);

      return Response<Supply>(
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

  ///
  ///
  /// Retrieves the current version
  Future<Response<Version>> getVersion({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/versions";

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(Version);
      var data =
          _serializers.deserializeWith<Version>(serializer, response.data);

      return Response<Version>(
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

  /// Returns OK if healthy.
  ///
  ///
  Future<Response> healthCheck({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/health";

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = [];

    return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    );
  }

  /// Return metrics about algod functioning.
  ///
  ///
  Future<Response> metrics({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/metrics";

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = [];

    return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    );
  }

  /// Get a specific pending transaction.
  ///
  /// Given a transaction id of a recently submitted transaction, it returns information about it.  There are several cases when this might succeed: - transaction committed (committed round &gt; 0) - transaction still in the pool (committed round &#x3D; 0, pool error &#x3D; \&quot;\&quot;) - transaction removed from pool due to error (committed round &#x3D; 0, pool error !&#x3D; \&quot;\&quot;) Or the transaction may have happened sufficiently long ago that the node no longer remembers it, and this will return an error.
  Future<Response<Transaction>> pendingTransactionInformation(
    String txid, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/transactions/pending/{txid}"
        .replaceAll("{" r'txid' "}", txid.toString());

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(Transaction);
      var data =
          _serializers.deserializeWith<Transaction>(serializer, response.data);

      return Response<Transaction>(
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

  /// Broadcasts a raw transaction to the network.
  ///
  ///
  Future<Response<TransactionID>> rawTransaction(
    Uint8List rawtxn, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/transactions";

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    List<String> contentTypes = ["application/x-binary"];

//            var serializedBody = _serializers.serialize(rawtxn);
//            var jsonrawtxn = json.encode(serializedBody);
//            bodyData = jsonrawtxn;

    bodyData = http.ByteStream.fromBytes(rawtxn);

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'post'.toUpperCase(),
        headers: headerParams,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(TransactionID);
      var data = _serializers.deserializeWith<TransactionID>(
          serializer, response.data);

      return Response<TransactionID>(
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

  /// Get the suggested fee
  ///
  /// Suggested Fee is returned in units of micro-Algos per byte. Suggested Fee may fall to zero but submitted transactions must still have a fee of at least MinTxnFee for the current network protocol.
  Future<Response<TransactionFee>> suggestedFee({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/transactions/fee";

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(TransactionFee);
      var data = _serializers.deserializeWith<TransactionFee>(
          serializer, response.data);

      return Response<TransactionFee>(
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
  Future<Response<String>> swaggerJSON({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/swagger.json";

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
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

  /// Get an information of a single transaction.
  ///
  /// Returns the transaction information of the given txid. Works only if the indexer is enabled.
  Future<Response<Transaction>> transaction(
    String txid, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path =
        "/v1/transaction/{txid}".replaceAll("{" r'txid' "}", txid.toString());

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(Transaction);
      var data =
          _serializers.deserializeWith<Transaction>(serializer, response.data);

      return Response<Transaction>(
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

  /// Get a specific confirmed transaction.
  ///
  /// Given a wallet address and a transaction id, it returns the confirmed transaction information. This call scans up to &lt;CurrentProtocol&gt;.MaxTxnLife blocks in the past.
  Future<Response<Transaction>> transactionInformation(
    String address,
    String txid, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/account/{address}/transaction/{txid}"
        .replaceAll("{" r'address' "}", address.toString())
        .replaceAll("{" r'txid' "}", txid.toString());

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(Transaction);
      var data =
          _serializers.deserializeWith<Transaction>(serializer, response.data);

      return Response<Transaction>(
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

  /// Get parameters for constructing a new transaction
  ///
  ///
  Future<Response<TransactionParams>> transactionParams({
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/transactions/params";

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(TransactionParams);
      var data = _serializers.deserializeWith<TransactionParams>(
          serializer, response.data);

      return Response<TransactionParams>(
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

  /// Get a list of confirmed transactions.
  ///
  /// Returns the list of confirmed transactions between within a date range. This call is available only when the indexer is running.
  Future<Response<TransactionList>> transactions(
    String address, {
    int firstRound,
    int lastRound,
    DateTime fromDate,
    DateTime toDate,
    int max,
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/account/{address}/transactions"
        .replaceAll("{" r'address' "}", address.toString());

    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;

    queryParams[r'firstRound'] = firstRound;
    queryParams[r'lastRound'] = lastRound;
    queryParams[r'fromDate'] = fromDate;
    queryParams[r'toDate'] = toDate;
    queryParams[r'max'] = max;
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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(TransactionList);
      var data = _serializers.deserializeWith<TransactionList>(
          serializer, response.data);

      return Response<TransactionList>(
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

  /// Gets the node status after waiting for the given round.
  ///
  /// Waits for a block to appear after round {round} and returns the node&#39;s status at the time.
  Future<Response<NodeStatus>> waitForBlock(
    int round, {
    CancelToken cancelToken,
    Map<String, String> headers,
  }) async {
    String _path = "/v1/status/wait-for-block-after/{round}/"
        .replaceAll("{" r'round' "}", round.toString());

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
            contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
    )
        .then((response) {
      var serializer = _serializers.serializerForType(NodeStatus);
      var data =
          _serializers.deserializeWith<NodeStatus>(serializer, response.data);

      return Response<NodeStatus>(
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
