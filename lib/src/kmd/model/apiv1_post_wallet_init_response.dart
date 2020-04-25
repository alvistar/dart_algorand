import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_wallet_init_response.g.dart';

abstract class APIV1POSTWalletInitResponse
    implements
        Built<APIV1POSTWalletInitResponse, APIV1POSTWalletInitResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  // Boilerplate code needed to wire-up generated code
  APIV1POSTWalletInitResponse._();

  factory APIV1POSTWalletInitResponse(
          [updates(APIV1POSTWalletInitResponseBuilder b)]) =
      _$APIV1POSTWalletInitResponse;

  static Serializer<APIV1POSTWalletInitResponse> get serializer =>
      _$aPIV1POSTWalletInitResponseSerializer;
}
