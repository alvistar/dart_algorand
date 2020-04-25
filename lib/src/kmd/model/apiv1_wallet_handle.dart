import 'apiv1_wallet.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_wallet_handle.g.dart';

abstract class APIV1WalletHandle
    implements Built<APIV1WalletHandle, APIV1WalletHandleBuilder> {
  @nullable
  @BuiltValueField(wireName: r'expires_seconds')
  int get expiresSeconds;

  @nullable
  @BuiltValueField(wireName: r'wallet')
  APIV1Wallet get wallet;

  // Boilerplate code needed to wire-up generated code
  APIV1WalletHandle._();

  factory APIV1WalletHandle([updates(APIV1WalletHandleBuilder b)]) =
      _$APIV1WalletHandle;

  static Serializer<APIV1WalletHandle> get serializer =>
      _$aPIV1WalletHandleSerializer;
}
