import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rename_wallet_request.g.dart';

abstract class RenameWalletRequest
    implements Built<RenameWalletRequest, RenameWalletRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'wallet_id')
  String get walletId;

  @nullable
  @BuiltValueField(wireName: r'wallet_name')
  String get walletName;

  @nullable
  @BuiltValueField(wireName: r'wallet_password')
  String get walletPassword;

  // Boilerplate code needed to wire-up generated code
  RenameWalletRequest._();

  factory RenameWalletRequest([updates(RenameWalletRequestBuilder b)]) =
      _$RenameWalletRequest;
  static Serializer<RenameWalletRequest> get serializer =>
      _$renameWalletRequestSerializer;
}
