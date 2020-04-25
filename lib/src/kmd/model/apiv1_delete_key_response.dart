import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_delete_key_response.g.dart';

abstract class APIV1DELETEKeyResponse
    implements Built<APIV1DELETEKeyResponse, APIV1DELETEKeyResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  // Boilerplate code needed to wire-up generated code
  APIV1DELETEKeyResponse._();

  factory APIV1DELETEKeyResponse(
          [Function(APIV1DELETEKeyResponseBuilder) updates]) =
      _$APIV1DELETEKeyResponse;

  static Serializer<APIV1DELETEKeyResponse> get serializer =>
      _$aPIV1DELETEKeyResponseSerializer;
}
