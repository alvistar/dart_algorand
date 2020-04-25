import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_multisig_transaction_sign_response.g.dart';

abstract class APIV1POSTMultisigTransactionSignResponse
    implements
        Built<APIV1POSTMultisigTransactionSignResponse,
            APIV1POSTMultisigTransactionSignResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: r'multisig')
  String get multisig;

  // Boilerplate code needed to wire-up generated code
  APIV1POSTMultisigTransactionSignResponse._();

  factory APIV1POSTMultisigTransactionSignResponse(
          [updates(APIV1POSTMultisigTransactionSignResponseBuilder b)]) =
      _$APIV1POSTMultisigTransactionSignResponse;
  static Serializer<APIV1POSTMultisigTransactionSignResponse> get serializer =>
      _$aPIV1POSTMultisigTransactionSignResponseSerializer;
}
