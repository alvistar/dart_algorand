import 'apiv1_wallet.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_wallet_response.g.dart';

abstract class APIV1POSTWalletResponse
    implements Built<APIV1POSTWalletResponse, APIV1POSTWalletResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: r'wallet')
  APIV1Wallet get wallet;

  // Boilerplate code needed to wire-up generated code
  APIV1POSTWalletResponse._();

  factory APIV1POSTWalletResponse([updates(APIV1POSTWalletResponseBuilder b)]) =
      _$APIV1POSTWalletResponse;

  static Serializer<APIV1POSTWalletResponse> get serializer =>
      _$aPIV1POSTWalletResponseSerializer;
}
