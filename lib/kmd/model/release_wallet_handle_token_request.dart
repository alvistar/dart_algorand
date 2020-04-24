import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'release_wallet_handle_token_request.g.dart';

abstract class ReleaseWalletHandleTokenRequest
    implements
        Built<ReleaseWalletHandleTokenRequest,
            ReleaseWalletHandleTokenRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  // Boilerplate code needed to wire-up generated code
  ReleaseWalletHandleTokenRequest._();

  factory ReleaseWalletHandleTokenRequest(
          [updates(ReleaseWalletHandleTokenRequestBuilder b)]) =
      _$ReleaseWalletHandleTokenRequest;
  static Serializer<ReleaseWalletHandleTokenRequest> get serializer =>
      _$releaseWalletHandleTokenRequestSerializer;
}
