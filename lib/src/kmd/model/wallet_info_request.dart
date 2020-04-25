import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'wallet_info_request.g.dart';

abstract class WalletInfoRequest
    implements Built<WalletInfoRequest, WalletInfoRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  // Boilerplate code needed to wire-up generated code
  WalletInfoRequest._();

  factory WalletInfoRequest([Function(WalletInfoRequestBuilder) updates]) =
      _$WalletInfoRequest;
  static Serializer<WalletInfoRequest> get serializer =>
      _$walletInfoRequestSerializer;
}
