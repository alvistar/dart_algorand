        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_key_request.g.dart';

abstract class DeleteKeyRequest implements Built<DeleteKeyRequest, DeleteKeyRequestBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'address')
    String get address;
    
        @nullable
    @BuiltValueField(wireName: r'wallet_handle_token')
    String get walletHandleToken;
    
        @nullable
    @BuiltValueField(wireName: r'wallet_password')
    String get walletPassword;

    // Boilerplate code needed to wire-up generated code
    DeleteKeyRequest._();

    factory DeleteKeyRequest([updates(DeleteKeyRequestBuilder b)]) = _$DeleteKeyRequest;
    static Serializer<DeleteKeyRequest> get serializer => _$deleteKeyRequestSerializer;

}

