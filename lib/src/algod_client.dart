import 'dart:convert';

import 'package:dart_algorand/algod/model/node_status.dart';
import 'package:dart_algorand/algod/model/pending_transactions.dart';
import 'package:dart_algorand/algod/model/transaction_params.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../algod.dart' as algod;
import '../dart_algorand.dart';

class AlgodClient {
  algod.AlgodApi api;

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

    api = algod.Openapi(dio: dio).getAlgodApi();
  }

  Future<algod.Account> accountInformation(String address) async {
    return (await api.accountInformation(address)).data;
  }

  /// Get parameters for constructing a new transaction
  Future<TransactionParams> transactionParams() async {
    return (await api.transactionParams()).data;
  }

  /// Broadcast a signed transaction object to the network.
  /// Returns transaction ID
  Future<String> sendTransaction(SignedTransaction transaction) async {
    return (await api.rawTransaction(base64Decode(msgpack_encode(transaction))))
        .data
        .txId;
  }

  /// Return transaction information for a pending transaction.
  Future<algod.Transaction> pendingTransactionInfo(String transactionID) async {
    return (await api.pendingTransactionInformation(transactionID)).data;
  }

  /// Return node status immediately after blocknum
  Future<NodeStatus> statusAfterBlock(int blockNum) async {

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
  Future<NodeStatus> status() async {
    return (await api.getStatus()).data;
  }

  /// Return pending transactions.
  /// [maxTxns] is maximumnumber of transactions to return;
  ///   if [maxTxns] is 0, return all pending transactions
  Future<PendingTransactions> pendingTransactions([int maxTxns=0]) async{
    return (await api.getPendingTransactions(max: maxTxns)).data;
  }

}
