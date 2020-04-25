import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'asset_params.dart';

part 'asset.g.dart';

abstract class Asset implements Built<Asset, AssetBuilder> {
  /* AssetIndex is the unique asset identifier */
  @nullable
  @BuiltValueField(wireName: r'AssetIndex')
  int get assetIndex;

  @nullable
  @BuiltValueField(wireName: r'AssetParams')
  AssetParams get assetParams;

  // Boilerplate code needed to wire-up generated code
  Asset._();

  factory Asset([updates(AssetBuilder b)]) = _$Asset;

  static Serializer<Asset> get serializer => _$assetSerializer;
}
