        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_multisig_import_response.g.dart';

abstract class APIV1POSTMultisigImportResponse implements Built<APIV1POSTMultisigImportResponse, APIV1POSTMultisigImportResponseBuilder> {

    
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
    APIV1POSTMultisigImportResponse._();

    factory APIV1POSTMultisigImportResponse([updates(APIV1POSTMultisigImportResponseBuilder b)]) = _$APIV1POSTMultisigImportResponse;
    static Serializer<APIV1POSTMultisigImportResponse> get serializer => _$aPIV1POSTMultisigImportResponseSerializer;

}

