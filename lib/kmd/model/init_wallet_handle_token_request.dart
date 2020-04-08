import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_wallet_handle_token_request.g.dart';

abstract class InitWalletHandleTokenRequest
    implements
        Built<InitWalletHandleTokenRequest,
            InitWalletHandleTokenRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'wallet_id')
  String get walletId;

  @nullable
  @BuiltValueField(wireName: r'wallet_password')
  String get walletPassword;

  // Boilerplate code needed to wire-up generated code
  InitWalletHandleTokenRequest._();

  factory InitWalletHandleTokenRequest(
          [updates(InitWalletHandleTokenRequestBuilder b)]) =
      _$InitWalletHandleTokenRequest;

  static Serializer<InitWalletHandleTokenRequest> get serializer =>
      _$initWalletHandleTokenRequestSerializer;
}
