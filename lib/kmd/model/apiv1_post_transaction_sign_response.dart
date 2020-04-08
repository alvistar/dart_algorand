        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_transaction_sign_response.g.dart';

abstract class APIV1POSTTransactionSignResponse implements Built<APIV1POSTTransactionSignResponse, APIV1POSTTransactionSignResponseBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'error')
    bool get error;
    
        @nullable
    @BuiltValueField(wireName: r'message')
    String get message;
    
        @nullable
    @BuiltValueField(wireName: r'signed_transaction')
    String get signedTransaction;

    // Boilerplate code needed to wire-up generated code
    APIV1POSTTransactionSignResponse._();

    factory APIV1POSTTransactionSignResponse([updates(APIV1POSTTransactionSignResponseBuilder b)]) = _$APIV1POSTTransactionSignResponse;
    static Serializer<APIV1POSTTransactionSignResponse> get serializer => _$aPIV1POSTTransactionSignResponseSerializer;

}

