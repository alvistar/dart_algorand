import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_params.g.dart';

abstract class AssetParams implements Built<AssetParams, AssetParamsBuilder> {
  /* AssetName specifies the name of this asset, as supplied by the creator. */
  @nullable
  @BuiltValueField(wireName: r'assetname')
  String get assetname;
  /* ClawbackAddr specifies the address used to clawback holdings of this asset.  If empty, clawback is not permitted. */
  @nullable
  @BuiltValueField(wireName: r'clawbackaddr')
  String get clawbackaddr;
  /* Creator specifies the address that created this asset. This is the address where the parameters for this asset can be found, and also the address where unwanted asset units can be sent in the worst case. */
  @nullable
  @BuiltValueField(wireName: r'creator')
  String get creator;
  /* Decimals specifies the number of digits to use after the decimal point when displaying this asset. If 0, the asset is not divisible. If 1, the base unit of the asset is in tenths. If 2, the base unit of the asset is in hundredths, and so on. */
  @nullable
  @BuiltValueField(wireName: r'decimals')
  int get decimals;
  /* DefaultFrozen specifies whether holdings in this asset are frozen by default. */
  @nullable
  @BuiltValueField(wireName: r'defaultfrozen')
  bool get defaultfrozen;
  /* FreezeAddr specifies the address used to freeze holdings of this asset.  If empty, freezing is not permitted. */
  @nullable
  @BuiltValueField(wireName: r'freezeaddr')
  String get freezeaddr;
  /* ManagerAddr specifies the address used to manage the keys of this asset and to destroy it. */
  @nullable
  @BuiltValueField(wireName: r'managerkey')
  String get managerkey;
  /* MetadataHash specifies a commitment to some unspecified asset metadata. The format of this metadata is up to the application. */
  @nullable
  @BuiltValueField(wireName: r'metadatahash')
  String get metadatahash;
  /* ReserveAddr specifies the address holding reserve (non-minted) units of this asset. */
  @nullable
  @BuiltValueField(wireName: r'reserveaddr')
  String get reserveaddr;
  /* Total specifies the total number of units of this asset. */
  @nullable
  @BuiltValueField(wireName: r'total')
  int get total;
  /* UnitName specifies the name of a unit of this asset, as supplied by the creator. */
  @nullable
  @BuiltValueField(wireName: r'unitname')
  String get unitname;
  /* URL specifies a URL where more information about the asset can be retrieved */
  @nullable
  @BuiltValueField(wireName: r'url')
  String get url;

  // Boilerplate code needed to wire-up generated code
  AssetParams._();

  factory AssetParams([updates(AssetParamsBuilder b)]) = _$AssetParams;
  static Serializer<AssetParams> get serializer => _$assetParamsSerializer;
}
