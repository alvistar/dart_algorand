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
const FullType(BuiltList, const [const FullType(APIV1DELETEKeyResponse)]),
() => new ListBuilder<APIV1DELETEKeyResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1DELETEMultisigResponse)]),
() => new ListBuilder<APIV1DELETEMultisigResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1GETWalletsResponse)]),
() => new ListBuilder<APIV1GETWalletsResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTKeyExportResponse)]),
() => new ListBuilder<APIV1POSTKeyExportResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTKeyImportResponse)]),
() => new ListBuilder<APIV1POSTKeyImportResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTKeyListResponse)]),
() => new ListBuilder<APIV1POSTKeyListResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTKeyResponse)]),
() => new ListBuilder<APIV1POSTKeyResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTMasterKeyExportResponse)]),
() => new ListBuilder<APIV1POSTMasterKeyExportResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTMultisigExportResponse)]),
() => new ListBuilder<APIV1POSTMultisigExportResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTMultisigImportResponse)]),
() => new ListBuilder<APIV1POSTMultisigImportResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTMultisigListResponse)]),
() => new ListBuilder<APIV1POSTMultisigListResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTMultisigProgramSignResponse)]),
() => new ListBuilder<APIV1POSTMultisigProgramSignResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTMultisigTransactionSignResponse)]),
() => new ListBuilder<APIV1POSTMultisigTransactionSignResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTProgramSignResponse)]),
() => new ListBuilder<APIV1POSTProgramSignResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTTransactionSignResponse)]),
() => new ListBuilder<APIV1POSTTransactionSignResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTWalletInfoResponse)]),
() => new ListBuilder<APIV1POSTWalletInfoResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTWalletInitResponse)]),
() => new ListBuilder<APIV1POSTWalletInitResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTWalletReleaseResponse)]),
() => new ListBuilder<APIV1POSTWalletReleaseResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTWalletRenameResponse)]),
() => new ListBuilder<APIV1POSTWalletRenameResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTWalletRenewResponse)]),
() => new ListBuilder<APIV1POSTWalletRenewResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1POSTWalletResponse)]),
() => new ListBuilder<APIV1POSTWalletResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1Wallet)]),
() => new ListBuilder<APIV1Wallet>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(APIV1WalletHandle)]),
() => new ListBuilder<APIV1WalletHandle>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(CreateWalletRequest)]),
() => new ListBuilder<CreateWalletRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(DeleteKeyRequest)]),
() => new ListBuilder<DeleteKeyRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(DeleteMultisigRequest)]),
() => new ListBuilder<DeleteMultisigRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ExportKeyRequest)]),
() => new ListBuilder<ExportKeyRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ExportMasterKeyRequest)]),
() => new ListBuilder<ExportMasterKeyRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ExportMultisigRequest)]),
() => new ListBuilder<ExportMultisigRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(GenerateKeyRequest)]),
() => new ListBuilder<GenerateKeyRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ImportKeyRequest)]),
() => new ListBuilder<ImportKeyRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ImportMultisigRequest)]),
() => new ListBuilder<ImportMultisigRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(InitWalletHandleTokenRequest)]),
() => new ListBuilder<InitWalletHandleTokenRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ListKeysRequest)]),
() => new ListBuilder<ListKeysRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ListMultisigRequest)]),
() => new ListBuilder<ListMultisigRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(MultisigSig)]),
() => new ListBuilder<MultisigSig>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(MultisigSubsig)]),
() => new ListBuilder<MultisigSubsig>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(ReleaseWalletHandleTokenRequest)]),
() => new ListBuilder<ReleaseWalletHandleTokenRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(RenameWalletRequest)]),
() => new ListBuilder<RenameWalletRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(RenewWalletHandleTokenRequest)]),
() => new ListBuilder<RenewWalletHandleTokenRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(SignMultisigRequest)]),
() => new ListBuilder<SignMultisigRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(SignProgramMultisigRequest)]),
() => new ListBuilder<SignProgramMultisigRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(SignProgramRequest)]),
() => new ListBuilder<SignProgramRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(SignTransactionRequest)]),
() => new ListBuilder<SignTransactionRequest>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(VersionsResponse)]),
() => new ListBuilder<VersionsResponse>())
..addBuilderFactory(
const FullType(BuiltList, const [const FullType(WalletInfoRequest)]),
() => new ListBuilder<WalletInfoRequest>())

).build();

Serializers standardSerializers =
(serializers.toBuilder()
..addPlugin(StandardJsonPlugin())).build();
