        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_transaction_type.g.dart';

abstract class PaymentTransactionType implements Built<PaymentTransactionType, PaymentTransactionTypeBuilder> {

    /* Amount is the amount of MicroAlgos intended to be transferred */
        @nullable
    @BuiltValueField(wireName: r'amount')
    int get amount;
    /* CloseRemainderTo is the address the sender closed to */
        @nullable
    @BuiltValueField(wireName: r'close')
    String get close;
    /* CloseAmount is the amount sent to CloseRemainderTo, for committed transaction */
        @nullable
    @BuiltValueField(wireName: r'closeamount')
    int get closeamount;
    /* CloseRewards is the amount of pending rewards applied to the CloseRemainderTo account as part of this transaction. */
        @nullable
    @BuiltValueField(wireName: r'closerewards')
    int get closerewards;
    /* To is the receiver's address */
        @nullable
    @BuiltValueField(wireName: r'to')
    String get to;
    /* ToRewards is the amount of pending rewards applied to the To account as part of this transaction. */
        @nullable
    @BuiltValueField(wireName: r'torewards')
    int get torewards;

    // Boilerplate code needed to wire-up generated code
    PaymentTransactionType._();

    factory PaymentTransactionType([updates(PaymentTransactionTypeBuilder b)]) = _$PaymentTransactionType;
    static Serializer<PaymentTransactionType> get serializer => _$paymentTransactionTypeSerializer;

}

