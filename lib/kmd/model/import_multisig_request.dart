import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'import_multisig_request.g.dart';

abstract class ImportMultisigRequest
    implements Built<ImportMultisigRequest, ImportMultisigRequestBuilder> {
  @nullable
  @BuiltValueField(wireName: r'multisig_version')
  int get multisigVersion;

  @nullable
  @BuiltValueField(wireName: r'pks')
  BuiltList<String> get pks;

  @nullable
  @BuiltValueField(wireName: r'threshold')
  int get threshold;

  @nullable
  @BuiltValueField(wireName: r'wallet_handle_token')
  String get walletHandleToken;

  // Boilerplate code needed to wire-up generated code
  ImportMultisigRequest._();

  factory ImportMultisigRequest(
          [Function(ImportMultisigRequestBuilder) updates]) =
      _$ImportMultisigRequest;

  static Serializer<ImportMultisigRequest> get serializer =>
      _$importMultisigRequestSerializer;
}
