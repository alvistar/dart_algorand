import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transaction_fee.g.dart';

abstract class TransactionFee
    implements Built<TransactionFee, TransactionFeeBuilder> {
  /* Fee is transaction fee Fee is in units of micro-Algos per byte. Fee may fall to zero but transactions must still have a fee of at least MinTxnFee for the current network protocol. */
  @nullable
  @BuiltValueField(wireName: r'fee')
  int get fee;

  // Boilerplate code needed to wire-up generated code
  TransactionFee._();

  factory TransactionFee([updates(TransactionFeeBuilder b)]) = _$TransactionFee;
  static Serializer<TransactionFee> get serializer =>
      _$transactionFeeSerializer;
}
