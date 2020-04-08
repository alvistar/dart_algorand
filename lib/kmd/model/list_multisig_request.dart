import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_multisig_request.g.dart';

abstract class ListMultisigRequest
    implements Built<ListMultisigRequest, ListMultisigRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  // Boilerplate code needed to wire-up generated code
  ListMultisigRequest._();

  factory ListMultisigRequest([Function(ListMultisigRequestBuilder) updates]) =
      _$ListMultisigRequest;

  static Serializer<ListMultisigRequest> get serializer =>
      _$listMultisigRequestSerializer;
}
