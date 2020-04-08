// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_wallet_handle_token_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InitWalletHandleTokenRequest>
    _$initWalletHandleTokenRequestSerializer =
    new _$InitWalletHandleTokenRequestSerializer();

class _$InitWalletHandleTokenRequestSerializer
    implements StructuredSerializer<InitWalletHandleTokenRequest> {
  @override
  final Iterable<Type> types = const [
    InitWalletHandleTokenRequest,
    _$InitWalletHandleTokenRequest
  ];
  @override
  final String wireName = 'InitWalletHandleTokenRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, InitWalletHandleTokenRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.walletId != null) {
      result
        ..add('wallet_id')
        ..add(serializers.serialize(object.walletId,
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
  InitWalletHandleTokenRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InitWalletHandleTokenRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'wallet_id':
          result.walletId = serializers.deserialize(value,
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

class _$InitWalletHandleTokenRequest extends InitWalletHandleTokenRequest {
  @override
  final String walletId;
  @override
  final String walletPassword;

  factory _$InitWalletHandleTokenRequest(
          [void Function(InitWalletHandleTokenRequestBuilder) updates]) =>
      (new InitWalletHandleTokenRequestBuilder()..update(updates)).build();

  _$InitWalletHandleTokenRequest._({this.walletId, this.walletPassword})
      : super._();

  @override
  InitWalletHandleTokenRequest rebuild(
          void Function(InitWalletHandleTokenRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitWalletHandleTokenRequestBuilder toBuilder() =>
      new InitWalletHandleTokenRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitWalletHandleTokenRequest &&
        walletId == other.walletId &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, walletId.hashCode), walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InitWalletHandleTokenRequest')
          ..add('walletId', walletId)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class InitWalletHandleTokenRequestBuilder
    implements
        Builder<InitWalletHandleTokenRequest,
            InitWalletHandleTokenRequestBuilder> {
  _$InitWalletHandleTokenRequest _$v;

  String _walletId;
  String get walletId => _$this._walletId;
  set walletId(String walletId) => _$this._walletId = walletId;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  InitWalletHandleTokenRequestBuilder();

  InitWalletHandleTokenRequestBuilder get _$this {
    if (_$v != null) {
      _walletId = _$v.walletId;
      _walletPassword = _$v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitWalletHandleTokenRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InitWalletHandleTokenRequest;
  }

  @override
  void update(void Function(InitWalletHandleTokenRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InitWalletHandleTokenRequest build() {
    final _$result = _$v ??
        new _$InitWalletHandleTokenRequest._(
            walletId: walletId, walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
