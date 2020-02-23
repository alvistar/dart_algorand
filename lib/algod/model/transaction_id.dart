        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transaction_id.g.dart';

abstract class TransactionID implements Built<TransactionID, TransactionIDBuilder> {

    /* TxId is the string encoding of the transaction hash */
        @nullable
    @BuiltValueField(wireName: r'txId')
    String get txId;

    // Boilerplate code needed to wire-up generated code
    TransactionID._();

    factory TransactionID([updates(TransactionIDBuilder b)]) = _$TransactionID;
    static Serializer<TransactionID> get serializer => _$transactionIDSerializer;

}

