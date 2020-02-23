import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_algorand/algod/model/transaction.dart';

part 'transaction_list.g.dart';

abstract class TransactionList
    implements Built<TransactionList, TransactionListBuilder> {
  /* TransactionList is a list of transactions */
  @nullable
  @BuiltValueField(wireName: r'transactions')
  BuiltList<Transaction> get transactions;

  // Boilerplate code needed to wire-up generated code
  TransactionList._();

  factory TransactionList([updates(TransactionListBuilder b)]) =
      _$TransactionList;

  static Serializer<TransactionList> get serializer =>
      _$transactionListSerializer;
}
