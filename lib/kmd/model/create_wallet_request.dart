import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_wallet_request.g.dart';

abstract class CreateWalletRequest
    implements Built<CreateWalletRequest, CreateWalletRequestBuilder> {
  /* MasterDerivationKey is used to derive ed25519 keys for use in wallets */
  @nullable
  @BuiltValueField(wireName: r'master_derivation_key')
  String get masterDerivationKey;

  @nullable
  @BuiltValueField(wireName: r'wallet_driver_name')
  String get walletDriverName;

  @nullable
  @BuiltValueField(wireName: r'wallet_name')
  String get walletName;

  @nullable
  @BuiltValueField(wireName: r'wallet_password')
  String get walletPassword;

  // Boilerplate code needed to wire-up generated code
  CreateWalletRequest._();

  factory CreateWalletRequest([Function(CreateWalletRequestBuilder) b]) =
      _$CreateWalletRequest;

  static Serializer<CreateWalletRequest> get serializer =>
      _$createWalletRequestSerializer;
}
