import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_program_request.g.dart';

abstract class SignProgramRequest
    implements Built<SignProgramRequest, SignProgramRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'address')
  String get address;

  @nullable
  @BuiltValueField(wireName: r'data')
  String get data;

  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  @nullable
  @BuiltValueField(wireName: r'wallet_password')
  String get walletPassword;

  // Boilerplate code needed to wire-up generated code
  SignProgramRequest._();

  factory SignProgramRequest([updates(SignProgramRequestBuilder b)]) =
      _$SignProgramRequest;
  static Serializer<SignProgramRequest> get serializer =>
      _$signProgramRequestSerializer;
}
