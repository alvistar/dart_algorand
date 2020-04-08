        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_wallet_release_response.g.dart';

abstract class APIV1POSTWalletReleaseResponse implements Built<APIV1POSTWalletReleaseResponse, APIV1POSTWalletReleaseResponseBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'error')
    bool get error;
    
        @nullable
    @BuiltValueField(wireName: r'message')
    String get message;

    // Boilerplate code needed to wire-up generated code
    APIV1POSTWalletReleaseResponse._();

    factory APIV1POSTWalletReleaseResponse([updates(APIV1POSTWalletReleaseResponseBuilder b)]) = _$APIV1POSTWalletReleaseResponse;
    static Serializer<APIV1POSTWalletReleaseResponse> get serializer => _$aPIV1POSTWalletReleaseResponseSerializer;

}

