import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_holding.g.dart';

abstract class AssetHolding implements Built<AssetHolding, AssetHoldingBuilder> {


  /* Creator specifies the address that created this asset. This is the address where the parameters for this asset can be found, and also the address where unwanted asset units can be sent in the worst case. */
  @BuiltValueField(wireName: r'creator')
  String get creator;

  @BuiltValueField(wireName: r'amount')
  int get amount;

  @BuiltValueField(wireName: r'frozen')
  bool get frozen;

  // Boilerplate code needed to wire-up generated code
  AssetHolding._();

  factory AssetHolding([updates(AssetHoldingBuilder b)]) = _$AssetHolding;
  static Serializer<AssetHolding> get serializer => _$assetHoldingSerializer;

}

