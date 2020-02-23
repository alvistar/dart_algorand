        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'keyreg_transaction_type.g.dart';

abstract class KeyregTransactionType implements Built<KeyregTransactionType, KeyregTransactionTypeBuilder> {

    /* SelectionPK is the VRF public key used in key registration transactions */
        @nullable
    @BuiltValueField(wireName: r'selkey')
    String get selkey;
    /* VoteFirst is the first round this participation key is valid */
        @nullable
    @BuiltValueField(wireName: r'votefst')
    int get votefst;
    /* VoteKeyDilution is the dilution for the 2-level participation key */
        @nullable
    @BuiltValueField(wireName: r'votekd')
    int get votekd;
    /* VotePK is the participation public key used in key registration transactions */
        @nullable
    @BuiltValueField(wireName: r'votekey')
    String get votekey;
    /* VoteLast is the last round this participation key is valid */
        @nullable
    @BuiltValueField(wireName: r'votelst')
    int get votelst;

    // Boilerplate code needed to wire-up generated code
    KeyregTransactionType._();

    factory KeyregTransactionType([updates(KeyregTransactionTypeBuilder b)]) = _$KeyregTransactionType;
    static Serializer<KeyregTransactionType> get serializer => _$keyregTransactionTypeSerializer;

}

