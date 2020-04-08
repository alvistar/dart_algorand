import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_post_master_key_export_response.g.dart';

abstract class APIV1POSTMasterKeyExportResponse
    implements
        Built<APIV1POSTMasterKeyExportResponse,
            APIV1POSTMasterKeyExportResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  /* MasterDerivationKey is used to derive ed25519 keys for use in wallets */
  @nullable
  @BuiltValueField(wireName: r'master_derivation_key')
  String get masterDerivationKey;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  // Boilerplate code needed to wire-up generated code
  APIV1POSTMasterKeyExportResponse._();

  factory APIV1POSTMasterKeyExportResponse(
          [updates(APIV1POSTMasterKeyExportResponseBuilder b)]) =
      _$APIV1POSTMasterKeyExportResponse;

  static Serializer<APIV1POSTMasterKeyExportResponse> get serializer =>
      _$aPIV1POSTMasterKeyExportResponseSerializer;
}
