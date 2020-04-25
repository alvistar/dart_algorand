import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'asset_params.dart';

part 'asset_config_transaction_type.g.dart';

abstract class AssetConfigTransactionType
    implements
        Built<AssetConfigTransactionType, AssetConfigTransactionTypeBuilder> {
  /* AssetID is the asset being configured (or empty if creating) */
  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'params')
  AssetParams get params;

  // Boilerplate code needed to wire-up generated code
  AssetConfigTransactionType._();

  factory AssetConfigTransactionType(
          [updates(AssetConfigTransactionTypeBuilder b)]) =
      _$AssetConfigTransactionType;

  static Serializer<AssetConfigTransactionType> get serializer =>
      _$assetConfigTransactionTypeSerializer;
}
