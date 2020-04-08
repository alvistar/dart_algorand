import '../model/multisig_sig.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_program_multisig_request.g.dart';

abstract class SignProgramMultisigRequest
    implements
        Built<SignProgramMultisigRequest, SignProgramMultisigRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'address')
  String get address;

  @nullable
  @BuiltValueField(wireName: r'data')
  String get data;

  @nullable
  @BuiltValueField(wireName: r'partial_multisig')
  MultisigSig get partialMultisig;

  @nullable
  @BuiltValueField(wireName: r'public_key')
  BuiltList<int> get publicKey;

  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  @nullable
  @BuiltValueField(wireName: r'wallet_password')
  String get walletPassword;

  // Boilerplate code needed to wire-up generated code
  SignProgramMultisigRequest._();

  factory SignProgramMultisigRequest(
          [updates(SignProgramMultisigRequestBuilder b)]) =
      _$SignProgramMultisigRequest;

  static Serializer<SignProgramMultisigRequest> get serializer =>
      _$signProgramMultisigRequestSerializer;
}
