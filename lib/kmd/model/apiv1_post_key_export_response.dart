import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_key_export_response.g.dart';

abstract class APIV1POSTKeyExportResponse
    implements
        Built<APIV1POSTKeyExportResponse, APIV1POSTKeyExportResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: r'private_key')
  String get privateKey;

  // Boilerplate code needed to wire-up generated code
  APIV1POSTKeyExportResponse._();

  factory APIV1POSTKeyExportResponse(
          [Function(APIV1POSTKeyExportResponseBuilder) updates]) =
      _$APIV1POSTKeyExportResponse;

  static Serializer<APIV1POSTKeyExportResponse> get serializer =>
      _$aPIV1POSTKeyExportResponseSerializer;
}
