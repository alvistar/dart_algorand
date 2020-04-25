// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(Account.serializer)
      ..add(Asset.serializer)
      ..add(AssetConfigTransactionType.serializer)
      ..add(AssetFreezeTransactionType.serializer)
      ..add(AssetHolding.serializer)
      ..add(AssetList.serializer)
      ..add(AssetParams.serializer)
      ..add(AssetTransferTransactionType.serializer)
      ..add(Block.serializer)
      ..add(BuildVersion.serializer)
      ..add(KeyregTransactionType.serializer)
      ..add(NodeStatus.serializer)
      ..add(Participation.serializer)
      ..add(PaymentTransactionType.serializer)
      ..add(PendingTransactions.serializer)
      ..add(Supply.serializer)
      ..add(Transaction.serializer)
      ..add(TransactionFee.serializer)
      ..add(TransactionID.serializer)
      ..add(TransactionList.serializer)
      ..add(TransactionParams.serializer)
      ..add(TransactionResults.serializer)
      ..add(Version.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Asset)]),
          () => ListBuilder<Asset>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Transaction)]),
          () => ListBuilder<Transaction>())
      ..addBuilderFactory(
          const FullType(BuiltMap, [FullType(String), FullType(AssetHolding)]),
          () => MapBuilder<String, AssetHolding>())
      ..addBuilderFactory(
          const FullType(BuiltMap, [FullType(String), FullType(AssetParams)]),
          () => MapBuilder<String, AssetParams>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
