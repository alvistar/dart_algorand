        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_key_response.g.dart';

abstract class APIV1POSTKeyResponse implements Built<APIV1POSTKeyResponse, APIV1POSTKeyResponseBuilder> {

    
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
    APIV1POSTKeyResponse._();

    factory APIV1POSTKeyResponse([updates(APIV1POSTKeyResponseBuilder b)]) = _$APIV1POSTKeyResponse;
    static Serializer<APIV1POSTKeyResponse> get serializer => _$aPIV1POSTKeyResponseSerializer;

}

