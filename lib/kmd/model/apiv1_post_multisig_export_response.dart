            import 'package:built_collection/built_collection.dart';
        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_multisig_export_response.g.dart';

abstract class APIV1POSTMultisigExportResponse implements Built<APIV1POSTMultisigExportResponse, APIV1POSTMultisigExportResponseBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'error')
    bool get error;
    
        @nullable
    @BuiltValueField(wireName: r'message')
    String get message;
    
        @nullable
    @BuiltValueField(wireName: r'multisig_version')
    int get multisigVersion;
    
        @nullable
    @BuiltValueField(wireName: r'pks')
    BuiltList<BuiltList> get pks;
    
        @nullable
    @BuiltValueField(wireName: r'threshold')
    int get threshold;

    // Boilerplate code needed to wire-up generated code
    APIV1POSTMultisigExportResponse._();

    factory APIV1POSTMultisigExportResponse([updates(APIV1POSTMultisigExportResponseBuilder b)]) = _$APIV1POSTMultisigExportResponse;
    static Serializer<APIV1POSTMultisigExportResponse> get serializer => _$aPIV1POSTMultisigExportResponseSerializer;

}

