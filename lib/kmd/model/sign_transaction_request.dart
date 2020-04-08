        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_transaction_request.g.dart';

abstract class SignTransactionRequest implements Built<SignTransactionRequest, SignTransactionRequestBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'transaction')
    String get transaction;
    
        @nullable
    @BuiltValueField(wireName: r'wallet_handle_token')
    String get walletHandleToken;
    
        @nullable
    @BuiltValueField(wireName: r'wallet_password')
    String get walletPassword;

    // Boilerplate code needed to wire-up generated code
    SignTransactionRequest._();

    factory SignTransactionRequest([updates(SignTransactionRequestBuilder b)]) = _$SignTransactionRequest;
    static Serializer<SignTransactionRequest> get serializer => _$signTransactionRequestSerializer;

}

