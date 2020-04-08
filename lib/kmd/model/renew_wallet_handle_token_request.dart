        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'renew_wallet_handle_token_request.g.dart';

abstract class RenewWalletHandleTokenRequest implements Built<RenewWalletHandleTokenRequest, RenewWalletHandleTokenRequestBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'wallet_handle_token')
    String get walletHandleToken;

    // Boilerplate code needed to wire-up generated code
    RenewWalletHandleTokenRequest._();

    factory RenewWalletHandleTokenRequest([updates(RenewWalletHandleTokenRequestBuilder b)]) = _$RenewWalletHandleTokenRequest;
    static Serializer<RenewWalletHandleTokenRequest> get serializer => _$renewWalletHandleTokenRequestSerializer;

}

