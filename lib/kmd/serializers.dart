library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'model/apiv1_delete_key_response.dart';
import 'model/apiv1_delete_multisig_response.dart';
import 'model/apiv1_get_wallets_response.dart';
import 'model/apiv1_post_key_export_response.dart';
import 'model/apiv1_post_key_import_response.dart';
import 'model/apiv1_post_key_list_response.dart';
import 'model/apiv1_post_key_response.dart';
import 'model/apiv1_post_master_key_export_response.dart';
import 'model/apiv1_post_multisig_export_response.dart';
import 'model/apiv1_post_multisig_import_response.dart';
import 'model/apiv1_post_multisig_list_response.dart';
import 'model/apiv1_post_multisig_program_sign_response.dart';
import 'model/apiv1_post_multisig_transaction_sign_response.dart';
import 'model/apiv1_post_program_sign_response.dart';
import 'model/apiv1_post_transaction_sign_response.dart';
import 'model/apiv1_post_wallet_info_response.dart';
import 'model/apiv1_post_wallet_init_response.dart';
import 'model/apiv1_post_wallet_release_response.dart';
import 'model/apiv1_post_wallet_rename_response.dart';
import 'model/apiv1_post_wallet_renew_response.dart';
import 'model/apiv1_post_wallet_response.dart';
import 'model/apiv1_wallet.dart';
import 'model/apiv1_wallet_handle.dart';
import 'model/create_wallet_request.dart';
import 'model/delete_key_request.dart';
import 'model/delete_multisig_request.dart';
import 'model/export_key_request.dart';
import 'model/export_master_key_request.dart';
import 'model/export_multisig_request.dart';
import 'model/generate_key_request.dart';
import 'model/import_key_request.dart';
import 'model/import_multisig_request.dart';
import 'model/init_wallet_handle_token_request.dart';
import 'model/list_keys_request.dart';
import 'model/list_multisig_request.dart';
import 'model/multisig_sig.dart';
import 'model/multisig_subsig.dart';
import 'model/release_wallet_handle_token_request.dart';
import 'model/rename_wallet_request.dart';
import 'model/renew_wallet_handle_token_request.dart';
import 'model/sign_multisig_request.dart';
import 'model/sign_program_multisig_request.dart';
import 'model/sign_program_request.dart';
import 'model/sign_transaction_request.dart';
import 'model/versions_response.dart';
import 'model/wallet_info_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  APIV1DELETEKeyResponse,
  APIV1DELETEMultisigResponse,
  APIV1GETWalletsResponse,
  APIV1POSTKeyExportResponse,
  APIV1POSTKeyImportResponse,
  APIV1POSTKeyListResponse,
  APIV1POSTKeyResponse,
  APIV1POSTMasterKeyExportResponse,
  APIV1POSTMultisigExportResponse,
  APIV1POSTMultisigImportResponse,
  APIV1POSTMultisigListResponse,
  APIV1POSTMultisigProgramSignResponse,
  APIV1POSTMultisigTransactionSignResponse,
  APIV1POSTProgramSignResponse,
  APIV1POSTTransactionSignResponse,
  APIV1POSTWalletInfoResponse,
  APIV1POSTWalletInitResponse,
  APIV1POSTWalletReleaseResponse,
  APIV1POSTWalletRenameResponse,
  APIV1POSTWalletRenewResponse,
  APIV1POSTWalletResponse,
  APIV1Wallet,
  APIV1WalletHandle,
  CreateWalletRequest,
  DeleteKeyRequest,
  DeleteMultisigRequest,
  ExportKeyRequest,
  ExportMasterKeyRequest,
  ExportMultisigRequest,
  GenerateKeyRequest,
  ImportKeyRequest,
  ImportMultisigRequest,
  InitWalletHandleTokenRequest,
  ListKeysRequest,
  ListMultisigRequest,
  MultisigSig,
  MultisigSubsig,
  ReleaseWalletHandleTokenRequest,
  RenameWalletRequest,
  RenewWalletHandleTokenRequest,
  SignMultisigRequest,
  SignProgramMultisigRequest,
  SignProgramRequest,
  SignTransactionRequest,
  VersionsResponse,
  WalletInfoRequest,
])

//allow all models to be serialized within a list
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1DELETEKeyResponse)]),
          () => ListBuilder<APIV1DELETEKeyResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1DELETEMultisigResponse)]),
          () => ListBuilder<APIV1DELETEMultisigResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1GETWalletsResponse)]),
          () => ListBuilder<APIV1GETWalletsResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTKeyExportResponse)]),
          () => ListBuilder<APIV1POSTKeyExportResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTKeyImportResponse)]),
          () => ListBuilder<APIV1POSTKeyImportResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTKeyListResponse)]),
          () => ListBuilder<APIV1POSTKeyListResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTKeyResponse)]),
          () => ListBuilder<APIV1POSTKeyResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, [FullType(APIV1POSTMasterKeyExportResponse)]),
          () => ListBuilder<APIV1POSTMasterKeyExportResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, [FullType(APIV1POSTMultisigExportResponse)]),
          () => ListBuilder<APIV1POSTMultisigExportResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, [FullType(APIV1POSTMultisigImportResponse)]),
          () => ListBuilder<APIV1POSTMultisigImportResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTMultisigListResponse)]),
          () => ListBuilder<APIV1POSTMultisigListResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, [FullType(APIV1POSTMultisigProgramSignResponse)]),
          () => ListBuilder<APIV1POSTMultisigProgramSignResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, [FullType(APIV1POSTMultisigTransactionSignResponse)]),
          () => ListBuilder<APIV1POSTMultisigTransactionSignResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTProgramSignResponse)]),
          () => ListBuilder<APIV1POSTProgramSignResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, [FullType(APIV1POSTTransactionSignResponse)]),
          () => ListBuilder<APIV1POSTTransactionSignResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTWalletInfoResponse)]),
          () => ListBuilder<APIV1POSTWalletInfoResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTWalletInitResponse)]),
          () => ListBuilder<APIV1POSTWalletInitResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTWalletReleaseResponse)]),
          () => ListBuilder<APIV1POSTWalletReleaseResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTWalletRenameResponse)]),
          () => ListBuilder<APIV1POSTWalletRenameResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTWalletRenewResponse)]),
          () => ListBuilder<APIV1POSTWalletRenewResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1POSTWalletResponse)]),
          () => ListBuilder<APIV1POSTWalletResponse>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(APIV1Wallet)]),
          () => ListBuilder<APIV1Wallet>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(APIV1WalletHandle)]),
          () => ListBuilder<APIV1WalletHandle>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(CreateWalletRequest)]),
          () => ListBuilder<CreateWalletRequest>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(DeleteKeyRequest)]),
          () => ListBuilder<DeleteKeyRequest>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(DeleteMultisigRequest)]), () => ListBuilder<DeleteMultisigRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ExportKeyRequest)]), () => ListBuilder<ExportKeyRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ExportMasterKeyRequest)]), () => ListBuilder<ExportMasterKeyRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ExportMultisigRequest)]), () => ListBuilder<ExportMultisigRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(GenerateKeyRequest)]), () => ListBuilder<GenerateKeyRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ImportKeyRequest)]), () => ListBuilder<ImportKeyRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ImportMultisigRequest)]), () => ListBuilder<ImportMultisigRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(InitWalletHandleTokenRequest)]), () => ListBuilder<InitWalletHandleTokenRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ListKeysRequest)]), () => ListBuilder<ListKeysRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ListMultisigRequest)]), () => ListBuilder<ListMultisigRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(MultisigSig)]), () => ListBuilder<MultisigSig>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(MultisigSubsig)]), () => ListBuilder<MultisigSubsig>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ReleaseWalletHandleTokenRequest)]), () => ListBuilder<ReleaseWalletHandleTokenRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(RenameWalletRequest)]), () => ListBuilder<RenameWalletRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(RenewWalletHandleTokenRequest)]), () => ListBuilder<RenewWalletHandleTokenRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(SignMultisigRequest)]), () => ListBuilder<SignMultisigRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(SignProgramMultisigRequest)]), () => ListBuilder<SignProgramMultisigRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(SignProgramRequest)]), () => ListBuilder<SignProgramRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(SignTransactionRequest)]), () => ListBuilder<SignTransactionRequest>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(VersionsResponse)]), () => ListBuilder<VersionsResponse>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(WalletInfoRequest)]), () => ListBuilder<WalletInfoRequest>()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
