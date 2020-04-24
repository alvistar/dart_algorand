import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'export_key_request.g.dart';

abstract class ExportKeyRequest
    implements Built<ExportKeyRequest, ExportKeyRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'address')
  String get address;

  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  @nullable
  @BuiltValueField(wireName: r'wallet_password')
  String get walletPassword;

  // Boilerplate code needed to wire-up generated code
  ExportKeyRequest._();

  factory ExportKeyRequest([updates(ExportKeyRequestBuilder b)]) =
      _$ExportKeyRequest;
  static Serializer<ExportKeyRequest> get serializer =>
      _$exportKeyRequestSerializer;
}
