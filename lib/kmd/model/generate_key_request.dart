import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generate_key_request.g.dart';

abstract class GenerateKeyRequest
    implements Built<GenerateKeyRequest, GenerateKeyRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'display_mnemonic')
  bool get displayMnemonic;

  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  // Boilerplate code needed to wire-up generated code
  GenerateKeyRequest._();

  factory GenerateKeyRequest([updates(GenerateKeyRequestBuilder b)]) =
      _$GenerateKeyRequest;
  static Serializer<GenerateKeyRequest> get serializer =>
      _$generateKeyRequestSerializer;
}
