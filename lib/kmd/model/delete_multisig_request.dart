import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_multisig_request.g.dart';

abstract class DeleteMultisigRequest
    implements Built<DeleteMultisigRequest, DeleteMultisigRequestBuilder> {
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
  DeleteMultisigRequest._();

  factory DeleteMultisigRequest([updates(DeleteMultisigRequestBuilder b)]) =
      _$DeleteMultisigRequest;
  static Serializer<DeleteMultisigRequest> get serializer =>
      _$deleteMultisigRequestSerializer;
}
