        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_key_import_response.g.dart';

abstract class APIV1POSTKeyImportResponse implements Built<APIV1POSTKeyImportResponse, APIV1POSTKeyImportResponseBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'address')
    String get address;
    
        @nullable
    @BuiltValueField(wireName: r'error')
    bool get error;
    
        @nullable
    @BuiltValueField(wireName: r'message')
    String get message;

    // Boilerplate code needed to wire-up generated code
    APIV1POSTKeyImportResponse._();

    factory APIV1POSTKeyImportResponse([updates(APIV1POSTKeyImportResponseBuilder b)]) = _$APIV1POSTKeyImportResponse;
    static Serializer<APIV1POSTKeyImportResponse> get serializer => _$aPIV1POSTKeyImportResponseSerializer;

}

