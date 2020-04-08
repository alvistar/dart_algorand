        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'export_multisig_request.g.dart';

abstract class ExportMultisigRequest implements Built<ExportMultisigRequest, ExportMultisigRequestBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'address')
    String get address;
    
        @nullable
    @BuiltValueField(wireName: r'wallet_handle_token')
    String get walletHandleToken;

    // Boilerplate code needed to wire-up generated code
    ExportMultisigRequest._();

    factory ExportMultisigRequest([updates(ExportMultisigRequestBuilder b)]) = _$ExportMultisigRequest;
    static Serializer<ExportMultisigRequest> get serializer => _$exportMultisigRequestSerializer;

}

