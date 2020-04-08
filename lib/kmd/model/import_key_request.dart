            import 'package:built_collection/built_collection.dart';
        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'import_key_request.g.dart';

abstract class ImportKeyRequest implements Built<ImportKeyRequest, ImportKeyRequestBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'private_key')
    BuiltList<int> get privateKey;
    
        @nullable
    @BuiltValueField(wireName: r'wallet_handle_token')
    String get walletHandleToken;

    // Boilerplate code needed to wire-up generated code
    ImportKeyRequest._();

    factory ImportKeyRequest([updates(ImportKeyRequestBuilder b)]) = _$ImportKeyRequest;
    static Serializer<ImportKeyRequest> get serializer => _$importKeyRequestSerializer;

}

