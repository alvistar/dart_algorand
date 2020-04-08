        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'export_master_key_request.g.dart';

abstract class ExportMasterKeyRequest implements Built<ExportMasterKeyRequest, ExportMasterKeyRequestBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'wallet_handle_token')
    String get walletHandleToken;
    
        @nullable
    @BuiltValueField(wireName: r'wallet_password')
    String get walletPassword;

    // Boilerplate code needed to wire-up generated code
    ExportMasterKeyRequest._();

    factory ExportMasterKeyRequest([updates(ExportMasterKeyRequestBuilder b)]) = _$ExportMasterKeyRequest;
    static Serializer<ExportMasterKeyRequest> get serializer => _$exportMasterKeyRequestSerializer;

}

