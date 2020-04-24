import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_wallet.g.dart';

abstract class APIV1Wallet implements Built<APIV1Wallet, APIV1WalletBuilder> {
  @nullable
  @BuiltValueField(wireName: r'driver_name')
  String get driverName;

  @nullable
  @BuiltValueField(wireName: r'driver_version')
  int get driverVersion;

  @nullable
  @BuiltValueField(wireName: r'id')
  String get id;

  @nullable
  @BuiltValueField(wireName: r'mnemonic_ux')
  bool get mnemonicUx;

  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: r'supported_txs')
  BuiltList<String> get supportedTxs;

  // Boilerplate code needed to wire-up generated code
  APIV1Wallet._();

  factory APIV1Wallet([updates(APIV1WalletBuilder b)]) = _$APIV1Wallet;
  static Serializer<APIV1Wallet> get serializer => _$aPIV1WalletSerializer;
}
