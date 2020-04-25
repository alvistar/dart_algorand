import 'apiv1_wallet_handle.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_wallet_info_response.g.dart';

abstract class APIV1POSTWalletInfoResponse
    implements
        Built<APIV1POSTWalletInfoResponse, APIV1POSTWalletInfoResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: r'wallet_handle')
  APIV1WalletHandle get walletHandle;

  // Boilerplate code needed to wire-up generated code
  APIV1POSTWalletInfoResponse._();

  factory APIV1POSTWalletInfoResponse(
          [updates(APIV1POSTWalletInfoResponseBuilder b)]) =
      _$APIV1POSTWalletInfoResponse;

  static Serializer<APIV1POSTWalletInfoResponse> get serializer =>
      _$aPIV1POSTWalletInfoResponseSerializer;
}
