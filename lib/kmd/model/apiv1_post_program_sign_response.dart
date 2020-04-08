        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_program_sign_response.g.dart';

abstract class APIV1POSTProgramSignResponse implements Built<APIV1POSTProgramSignResponse, APIV1POSTProgramSignResponseBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'error')
    bool get error;
    
        @nullable
    @BuiltValueField(wireName: r'message')
    String get message;
    
        @nullable
    @BuiltValueField(wireName: r'sig')
    String get sig;

    // Boilerplate code needed to wire-up generated code
    APIV1POSTProgramSignResponse._();

    factory APIV1POSTProgramSignResponse([updates(APIV1POSTProgramSignResponseBuilder b)]) = _$APIV1POSTProgramSignResponse;
    static Serializer<APIV1POSTProgramSignResponse> get serializer => _$aPIV1POSTProgramSignResponseSerializer;

}

