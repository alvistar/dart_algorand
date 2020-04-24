import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_delete_multisig_response.g.dart';

abstract class APIV1DELETEMultisigResponse
    implements
        Built<APIV1DELETEMultisigResponse, APIV1DELETEMultisigResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  // Boilerplate code needed to wire-up generated code
  APIV1DELETEMultisigResponse._();

  factory APIV1DELETEMultisigResponse(
          [updates(APIV1DELETEMultisigResponseBuilder b)]) =
      _$APIV1DELETEMultisigResponse;
  static Serializer<APIV1DELETEMultisigResponse> get serializer =>
      _$aPIV1DELETEMultisigResponseSerializer;
}
