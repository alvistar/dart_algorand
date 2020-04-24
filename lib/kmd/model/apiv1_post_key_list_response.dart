import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_key_list_response.g.dart';

abstract class APIV1POSTKeyListResponse
    implements
        Built<APIV1POSTKeyListResponse, APIV1POSTKeyListResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'addresses')
  BuiltList<String> get addresses;

  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  // Boilerplate code needed to wire-up generated code
  APIV1POSTKeyListResponse._();

  factory APIV1POSTKeyListResponse(
          [updates(APIV1POSTKeyListResponseBuilder b)]) =
      _$APIV1POSTKeyListResponse;
  static Serializer<APIV1POSTKeyListResponse> get serializer =>
      _$aPIV1POSTKeyListResponseSerializer;
}
