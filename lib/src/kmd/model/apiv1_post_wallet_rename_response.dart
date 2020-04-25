import 'apiv1_wallet.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_wallet_rename_response.g.dart';

abstract class APIV1POSTWalletRenameResponse
    implements
        Built<APIV1POSTWalletRenameResponse,
            APIV1POSTWalletRenameResponseBuilder> {
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
  APIV1POSTWalletRenameResponse._();

  factory APIV1POSTWalletRenameResponse(
          [updates(APIV1POSTWalletRenameResponseBuilder b)]) =
      _$APIV1POSTWalletRenameResponse;

  static Serializer<APIV1POSTWalletRenameResponse> get serializer =>
      _$aPIV1POSTWalletRenameResponseSerializer;
}
