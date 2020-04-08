import '../model/apiv1_wallet_handle.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_wallet_renew_response.g.dart';

abstract class APIV1POSTWalletRenewResponse
    implements
        Built<APIV1POSTWalletRenewResponse,
            APIV1POSTWalletRenewResponseBuilder> {
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
  APIV1POSTWalletRenewResponse._();

  factory APIV1POSTWalletRenewResponse(
          [updates(APIV1POSTWalletRenewResponseBuilder b)]) =
      _$APIV1POSTWalletRenewResponse;

  static Serializer<APIV1POSTWalletRenewResponse> get serializer =>
      _$aPIV1POSTWalletRenewResponseSerializer;
}
