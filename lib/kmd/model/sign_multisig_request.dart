import '../model/multisig_sig.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_multisig_request.g.dart';

abstract class SignMultisigRequest
    implements Built<SignMultisigRequest, SignMultisigRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'partial_multisig')
  MultisigSig get partialMultisig;

  @nullable
  @BuiltValueField(wireName: r'public_key')
  BuiltList<int> get publicKey;

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
  SignMultisigRequest._();

  factory SignMultisigRequest([updates(SignMultisigRequestBuilder b)]) =
      _$SignMultisigRequest;

  static Serializer<SignMultisigRequest> get serializer =>
      _$signMultisigRequestSerializer;
}
