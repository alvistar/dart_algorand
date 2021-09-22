import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../algod.dart' as algod;
import '../dart_algorand.dart';

class AlgodClient {
  algod.AlgodApi api;

  AlgodClient(
      {String token,
      @required String url,
      Map<String, dynamic> headers = const {}}) {
    final options = BaseOptions(
      baseUrl: url,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (token != null) {
        options.headers['X-Algo-API-Token'] = token;
      }
      options.headers.addAll(headers);
    }, onError: (DioError e, handler) {
      if (e.response != null) {
        throw ClientError(
            request: e.requestOptions,
            response: e.response,
            type: e.type,
            error: e.error);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }

      return handler.next(e);
    }));

    api = algod.Openapi(dio: dio).getAlgodApi();
  }

  Future<algod.Account> accountInformation(String address) async {
    return (await api.accountInformation(address)).data;
  }

  /// Get parameters for constructing a new transaction
  Future<algod.TransactionParams> transactionParams() async {
    return (await api.transactionParams()).data;
  }

  /// Broadcast a signed transaction object to the network.
  /// Returns transaction ID
  Future<String> sendTransaction(SignedTransactionBase transaction) async {
    return (await api.rawTransaction(base64Decode(msgpack_encode(transaction))))
        .data
        .txId;
  }

  /// Broadcast list of a signed transaction objects to the network.
  /// Returns first transaction id
  Future<String> sendTransactions(List<SignedTransactionBase> txns) async {
    final serialized = <int>[];
    for (var txn in txns) {
      serialized.addAll(base64Decode(msgpack_encode(txn)));
    }
    return (await api.rawTransaction(Uint8List.fromList(serialized))).data.txId;
  }

  /// Return transaction information for a pending transaction.
  Future<algod.Transaction> pendingTransactionInfo(String transactionID) async {
    return (await api.pendingTransactionInformation(transactionID)).data;
  }

  /// Return node status immediately after blocknum
  Future<algod.NodeStatus> statusAfterBlock(int blockNum) async {
    return (await api.waitForBlock(blockNum)).data;
  }

  /// Return transactions for an address. If indexer is not enabled, you can
  /// search by date and you do not have to specify first and last rounds.
  /// address: account public key
  /// first: no transactions before this block will be
  ///   returned
  /// last: no transactions after this block will be
  ///   returned; defaults to last round
  /// limit: maximum number of transactions to return;
  ///   default is 100
  /// from_date: no transactions before this date will be
  ///   returned
  /// to_date: no transactions after this date will be
  ///   returned
  Future<algod.TransactionList> transactionsByAddress(
      {@required String address,
      int first,
      int last,
      int limit,
      DateTime fromDate,
      DateTime toDate}) async {
    return (await api.transactions(address,
            firstRound: first,
            lastRound: last,
            max: limit,
            fromDate: fromDate,
            toDate: toDate))
        .data;
  }

  /// Return transaction information.
  Future<algod.Transaction> transactionInfo(
      {@required String address, @required String transactionID}) async {
    return (await api.transactionInformation(address, transactionID)).data;
  }

  /// Return null if node is running
  Future<void> health() async {
    await api.healthCheck();
  }

  /// Return node status
  Future<algod.NodeStatus> status() async {
    return (await api.getStatus()).data;
  }

  /// Return pending transactions.
  /// [maxTxns] is maximumnumber of transactions to return;
  ///   if [maxTxns] is 0, return all pending transactions
  Future<algod.PendingTransactions> pendingTransactions(
      [int maxTxns = 0]) async {
    return (await api.getPendingTransactions(max: maxTxns)).data;
  }

  /// Return algod versions.
  Future<algod.Version> versions() async {
    return (await api.getVersion()).data;
  }

  /// Return supply details for node's ledger
  Future<algod.Supply> ledgerSupply() async {
    return (await api.getSupply()).data;
  }

  /// Return block information of block number [round]
  Future<algod.Block> blockInfo(int round) async {
    return (await api.getBlock(round)).data;
  }

  /// Return suggested transaction fee.
  Future<algod.TransactionFee> suggestedFee() async {
    return (await api.suggestedFee()).data;
  }

  /// Return information for asset with [index] id.
  Future<algod.AssetParams> assetInfo(int index) async {
    return (await api.assetInformation(index)).data;
  }
}
