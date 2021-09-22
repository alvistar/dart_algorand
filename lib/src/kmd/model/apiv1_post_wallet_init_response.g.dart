// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_wallet_init_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTWalletInitResponse>
    _$aPIV1POSTWalletInitResponseSerializer =
    _$APIV1POSTWalletInitResponseSerializer();

class _$APIV1POSTWalletInitResponseSerializer
    implements StructuredSerializer<APIV1POSTWalletInitResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTWalletInitResponse,
    _$APIV1POSTWalletInitResponse
  ];
  @override
  final String wireName = 'APIV1POSTWalletInitResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTWalletInitResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.walletHandleToken;
    if (value != null) {
      result
        ..add('wallet_handle_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  APIV1POSTWalletInitResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1POSTWalletInitResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_handle_token':
          result.walletHandleToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1POSTWalletInitResponse extends APIV1POSTWalletInitResponse {
  @override
  final bool error;
  @override
  final String message;
  @override
  final String walletHandleToken;

  factory _$APIV1POSTWalletInitResponse(
          [void Function(APIV1POSTWalletInitResponseBuilder) updates]) =>
      (APIV1POSTWalletInitResponseBuilder()..update(updates)).build();

  _$APIV1POSTWalletInitResponse._(
      {this.error, this.message, this.walletHandleToken})
      : super._();

  @override
  APIV1POSTWalletInitResponse rebuild(
          void Function(APIV1POSTWalletInitResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTWalletInitResponseBuilder toBuilder() =>
      APIV1POSTWalletInitResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTWalletInitResponse &&
        error == other.error &&
        message == other.message &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, error.hashCode), message.hashCode),
        walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTWalletInitResponse')
          ..add('error', error)
          ..add('message', message)
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class APIV1POSTWalletInitResponseBuilder
    implements
        Builder<APIV1POSTWalletInitResponse,
            APIV1POSTWalletInitResponseBuilder> {
  _$APIV1POSTWalletInitResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  APIV1POSTWalletInitResponseBuilder();

  APIV1POSTWalletInitResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _walletHandleToken = $v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTWalletInitResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIV1POSTWalletInitResponse;
  }

  @override
  void update(void Function(APIV1POSTWalletInitResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTWalletInitResponse build() {
    final _$result = _$v ??
        _$APIV1POSTWalletInitResponse._(
            error: error,
            message: message,
            walletHandleToken: walletHandleToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
