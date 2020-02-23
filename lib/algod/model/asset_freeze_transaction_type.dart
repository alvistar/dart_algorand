        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_freeze_transaction_type.g.dart';

abstract class AssetFreezeTransactionType implements Built<AssetFreezeTransactionType, AssetFreezeTransactionTypeBuilder> {

    /* Account specifies the account where the asset is being frozen or thawed. */
        @nullable
    @BuiltValueField(wireName: r'acct')
    String get acct;
    /* NewFreezeStatus specifies the new freeze status. */
        @nullable
    @BuiltValueField(wireName: r'freeze')
    bool get freeze;
    /* AssetID is the asset being configured (or empty if creating) */
        @nullable
    @BuiltValueField(wireName: r'id')
    int get id;

    // Boilerplate code needed to wire-up generated code
    AssetFreezeTransactionType._();

    factory AssetFreezeTransactionType([updates(AssetFreezeTransactionTypeBuilder b)]) = _$AssetFreezeTransactionType;
    static Serializer<AssetFreezeTransactionType> get serializer => _$assetFreezeTransactionTypeSerializer;

}

