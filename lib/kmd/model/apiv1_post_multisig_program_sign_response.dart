        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_multisig_program_sign_response.g.dart';

abstract class APIV1POSTMultisigProgramSignResponse implements Built<APIV1POSTMultisigProgramSignResponse, APIV1POSTMultisigProgramSignResponseBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'error')
    bool get error;
    
        @nullable
    @BuiltValueField(wireName: r'message')
    String get message;
    
        @nullable
    @BuiltValueField(wireName: r'multisig')
    String get multisig;

    // Boilerplate code needed to wire-up generated code
    APIV1POSTMultisigProgramSignResponse._();

    factory APIV1POSTMultisigProgramSignResponse([updates(APIV1POSTMultisigProgramSignResponseBuilder b)]) = _$APIV1POSTMultisigProgramSignResponse;
    static Serializer<APIV1POSTMultisigProgramSignResponse> get serializer => _$aPIV1POSTMultisigProgramSignResponseSerializer;

}

