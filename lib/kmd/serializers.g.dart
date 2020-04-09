// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(APIV1DELETEKeyResponse.serializer)
      ..add(APIV1DELETEMultisigResponse.serializer)
      ..add(APIV1GETWalletsResponse.serializer)
      ..add(APIV1POSTKeyExportResponse.serializer)
      ..add(APIV1POSTKeyImportResponse.serializer)
      ..add(APIV1POSTKeyListResponse.serializer)
      ..add(APIV1POSTKeyResponse.serializer)
      ..add(APIV1POSTMasterKeyExportResponse.serializer)
      ..add(APIV1POSTMultisigExportResponse.serializer)
      ..add(APIV1POSTMultisigImportResponse.serializer)
      ..add(APIV1POSTMultisigListResponse.serializer)
      ..add(APIV1POSTMultisigProgramSignResponse.serializer)
      ..add(APIV1POSTMultisigTransactionSignResponse.serializer)
      ..add(APIV1POSTProgramSignResponse.serializer)
      ..add(APIV1POSTTransactionSignResponse.serializer)
      ..add(APIV1POSTWalletInfoResponse.serializer)
      ..add(APIV1POSTWalletInitResponse.serializer)
      ..add(APIV1POSTWalletReleaseResponse.serializer)
      ..add(APIV1POSTWalletRenameResponse.serializer)
      ..add(APIV1POSTWalletRenewResponse.serializer)
      ..add(APIV1POSTWalletResponse.serializer)
      ..add(APIV1Wallet.serializer)
      ..add(APIV1WalletHandle.serializer)
      ..add(CreateWalletRequest.serializer)
      ..add(DeleteKeyRequest.serializer)
      ..add(DeleteMultisigRequest.serializer)
      ..add(ExportKeyRequest.serializer)
      ..add(ExportMasterKeyRequest.serializer)
      ..add(ExportMultisigRequest.serializer)
      ..add(GenerateKeyRequest.serializer)
      ..add(ImportKeyRequest.serializer)
      ..add(ImportMultisigRequest.serializer)
      ..add(InitWalletHandleTokenRequest.serializer)
      ..add(ListKeysRequest.serializer)
      ..add(ListMultisigRequest.serializer)
      ..add(MultisigSig.serializer)
      ..add(MultisigSubsig.serializer)
      ..add(ReleaseWalletHandleTokenRequest.serializer)
      ..add(RenameWalletRequest.serializer)
      ..add(RenewWalletHandleTokenRequest.serializer)
      ..add(SignMultisigRequest.serializer)
      ..add(SignProgramMultisigRequest.serializer)
      ..add(SignProgramRequest.serializer)
      ..add(SignTransactionRequest.serializer)
      ..add(VersionsResponse.serializer)
      ..add(WalletInfoRequest.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(APIV1Wallet)]),
          () => new ListBuilder<APIV1Wallet>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(MultisigSubsig)]),
          () => new ListBuilder<MultisigSubsig>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
