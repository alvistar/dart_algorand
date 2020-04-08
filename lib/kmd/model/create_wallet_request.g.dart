// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wallet_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CreateWalletRequest> _$createWalletRequestSerializer =
    new _$CreateWalletRequestSerializer();

class _$CreateWalletRequestSerializer
    implements StructuredSerializer<CreateWalletRequest> {
  @override
  final Iterable<Type> types = const [
    CreateWalletRequest,
    _$CreateWalletRequest
  ];
  @override
  final String wireName = 'CreateWalletRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, CreateWalletRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.masterDerivationKey != null) {
      result
        ..add('master_derivation_key')
        ..add(serializers.serialize(object.masterDerivationKey,
            specifiedType: const FullType(String)));
    }
    if (object.walletDriverName != null) {
      result
        ..add('wallet_driver_name')
        ..add(serializers.serialize(object.walletDriverName,
            specifiedType: const FullType(String)));
    }
    if (object.walletName != null) {
      result
        ..add('wallet_name')
        ..add(serializers.serialize(object.walletName,
            specifiedType: const FullType(String)));
    }
    if (object.walletPassword != null) {
      result
        ..add('wallet_password')
        ..add(serializers.serialize(object.walletPassword,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CreateWalletRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateWalletRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'master_derivation_key':
          result.masterDerivationKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_driver_name':
          result.walletDriverName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_name':
          result.walletName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_password':
          result.walletPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CreateWalletRequest extends CreateWalletRequest {
  @override
  final String masterDerivationKey;
  @override
  final String walletDriverName;
  @override
  final String walletName;
  @override
  final String walletPassword;

  factory _$CreateWalletRequest(
          [void Function(CreateWalletRequestBuilder) updates]) =>
      (new CreateWalletRequestBuilder()..update(updates)).build();

  _$CreateWalletRequest._(
      {this.masterDerivationKey,
      this.walletDriverName,
      this.walletName,
      this.walletPassword})
      : super._();

  @override
  CreateWalletRequest rebuild(
          void Function(CreateWalletRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateWalletRequestBuilder toBuilder() =>
      new CreateWalletRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateWalletRequest &&
        masterDerivationKey == other.masterDerivationKey &&
        walletDriverName == other.walletDriverName &&
        walletName == other.walletName &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc(0, masterDerivationKey.hashCode),
                walletDriverName.hashCode),
            walletName.hashCode),
        walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateWalletRequest')
          ..add('masterDerivationKey', masterDerivationKey)
          ..add('walletDriverName', walletDriverName)
          ..add('walletName', walletName)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class CreateWalletRequestBuilder
    implements Builder<CreateWalletRequest, CreateWalletRequestBuilder> {
  _$CreateWalletRequest _$v;

  String _masterDerivationKey;
  String get masterDerivationKey => _$this._masterDerivationKey;
  set masterDerivationKey(String masterDerivationKey) =>
      _$this._masterDerivationKey = masterDerivationKey;

  String _walletDriverName;
  String get walletDriverName => _$this._walletDriverName;
  set walletDriverName(String walletDriverName) =>
      _$this._walletDriverName = walletDriverName;

  String _walletName;
  String get walletName => _$this._walletName;
  set walletName(String walletName) => _$this._walletName = walletName;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  CreateWalletRequestBuilder();

  CreateWalletRequestBuilder get _$this {
    if (_$v != null) {
      _masterDerivationKey = _$v.masterDerivationKey;
      _walletDriverName = _$v.walletDriverName;
      _walletName = _$v.walletName;
      _walletPassword = _$v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateWalletRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CreateWalletRequest;
  }

  @override
  void update(void Function(CreateWalletRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreateWalletRequest build() {
    final _$result = _$v ??
        new _$CreateWalletRequest._(
            masterDerivationKey: masterDerivationKey,
            walletDriverName: walletDriverName,
            walletName: walletName,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
