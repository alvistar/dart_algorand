import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_multisig_list_response.g.dart';

abstract class APIV1POSTMultisigListResponse
    implements
        Built<APIV1POSTMultisigListResponse,
            APIV1POSTMultisigListResponseBuilder> {
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
  APIV1POSTMultisigListResponse._();

  factory APIV1POSTMultisigListResponse(
          [updates(APIV1POSTMultisigListResponseBuilder b)]) =
      _$APIV1POSTMultisigListResponse;
  static Serializer<APIV1POSTMultisigListResponse> get serializer =>
      _$aPIV1POSTMultisigListResponseSerializer;
}
