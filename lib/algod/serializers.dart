library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dart_algorand/algod/model/asset_holding.dart';
import 'model/account.dart';
import 'model/asset.dart';
import 'model/asset_config_transaction_type.dart';
import 'model/asset_freeze_transaction_type.dart';
import 'model/asset_list.dart';
import 'model/asset_params.dart';
import 'model/asset_transfer_transaction_type.dart';
import 'model/block.dart';
import 'model/build_version.dart';
import 'model/keyreg_transaction_type.dart';
import 'model/node_status.dart';
import 'model/participation.dart';
import 'model/payment_transaction_type.dart';
import 'model/pending_transactions.dart';
import 'model/supply.dart';
import 'model/transaction.dart';
import 'model/transaction_fee.dart';
import 'model/transaction_id.dart';
import 'model/transaction_list.dart';
import 'model/transaction_params.dart';
import 'model/transaction_results.dart';
import 'model/version.dart';

part 'serializers.g.dart';

// ignore: unnecessary_const
@SerializersFor(const [
  Account,
  Asset,
  AssetConfigTransactionType,
  AssetHolding,
  AssetFreezeTransactionType,
  AssetList,
  AssetParams,
  AssetTransferTransactionType,
  Block,
  BuildVersion,
  KeyregTransactionType,
  NodeStatus,
  Participation,
  PaymentTransactionType,
  PendingTransactions,
  Supply,
  Transaction,
  TransactionFee,
  TransactionID,
  TransactionList,
  TransactionParams,
  TransactionResults,
  Version,
])
//allow all models to be serialized within a list
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Account)]),
          () => ListBuilder<Account>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Asset)]),
          () => ListBuilder<Asset>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(AssetConfigTransactionType)]),
          () => ListBuilder<AssetConfigTransactionType>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(AssetFreezeTransactionType)]),
          () => ListBuilder<AssetFreezeTransactionType>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(AssetList)]),
          () => ListBuilder<AssetList>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(AssetParams)]),
          () => ListBuilder<AssetParams>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(AssetTransferTransactionType)]),
          () => ListBuilder<AssetTransferTransactionType>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Block)]),
          () => ListBuilder<Block>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(BuildVersion)]),
          () => ListBuilder<BuildVersion>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(KeyregTransactionType)]),
          () => ListBuilder<KeyregTransactionType>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NodeStatus)]),
          () => ListBuilder<NodeStatus>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Participation)]),
          () => ListBuilder<Participation>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(PaymentTransactionType)]),
          () => ListBuilder<PaymentTransactionType>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(PendingTransactions)]),
          () => ListBuilder<PendingTransactions>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Supply)]),
          () => ListBuilder<Supply>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Transaction)]),
          () => ListBuilder<Transaction>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(TransactionFee)]),
          () => ListBuilder<TransactionFee>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(TransactionID)]),
          () => ListBuilder<TransactionID>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(TransactionList)]),
          () => ListBuilder<TransactionList>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(TransactionParams)]),
          () => ListBuilder<TransactionParams>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(AssetHolding)]),
          () => ListBuilder<AssetHolding>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Version)]),
          () => ListBuilder<Version>()))

    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
