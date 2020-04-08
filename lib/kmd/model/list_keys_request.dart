import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'list_keys_request.g.dart';

abstract class ListKeysRequest
    implements Built<ListKeysRequest, ListKeysRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  // Boilerplate code needed to wire-up generated code
  ListKeysRequest._();

  factory ListKeysRequest([Function(ListKeysRequestBuilder) updates]) =
      _$ListKeysRequest;

  static Serializer<ListKeysRequest> get serializer =>
      _$listKeysRequestSerializer;
}
