import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transaction_results.g.dart';

abstract class TransactionResults
    implements Built<TransactionResults, TransactionResultsBuilder> {
  /* CreatedAssetIndex indicates the asset index of an asset created by this txn */
  @nullable
  @BuiltValueField(wireName: r'createdasset')
  int get createdasset;

  // Boilerplate code needed to wire-up generated code
  TransactionResults._();

  factory TransactionResults([updates(TransactionResultsBuilder b)]) =
      _$TransactionResults;
  static Serializer<TransactionResults> get serializer =>
      _$transactionResultsSerializer;
}
