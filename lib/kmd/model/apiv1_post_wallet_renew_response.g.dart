// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_wallet_renew_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTWalletRenewResponse>
    _$aPIV1POSTWalletRenewResponseSerializer =
    _$APIV1POSTWalletRenewResponseSerializer();

class _$APIV1POSTWalletRenewResponseSerializer
    implements StructuredSerializer<APIV1POSTWalletRenewResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTWalletRenewResponse,
    _$APIV1POSTWalletRenewResponse
  ];
  @override
  final String wireName = 'APIV1POSTWalletRenewResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTWalletRenewResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(bool)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.walletHandle != null) {
      result
        ..add('wallet_handle')
        ..add(serializers.serialize(object.walletHandle,
            specifiedType: const FullType(APIV1WalletHandle)));
    }
    return result;
  }

  @override
  APIV1POSTWalletRenewResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1POSTWalletRenewResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_handle':
          result.walletHandle.replace(serializers.deserialize(value,
                  specifiedType: const FullType(APIV1WalletHandle))
              as APIV1WalletHandle);
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1POSTWalletRenewResponse extends APIV1POSTWalletRenewResponse {
  @override
  final bool error;
  @override
  final String message;
  @override
  final APIV1WalletHandle walletHandle;

  factory _$APIV1POSTWalletRenewResponse(
          [void Function(APIV1POSTWalletRenewResponseBuilder) updates]) =>
      (APIV1POSTWalletRenewResponseBuilder()..update(updates)).build();

  _$APIV1POSTWalletRenewResponse._(
      {this.error, this.message, this.walletHandle})
      : super._();

  @override
  APIV1POSTWalletRenewResponse rebuild(
          void Function(APIV1POSTWalletRenewResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTWalletRenewResponseBuilder toBuilder() =>
      APIV1POSTWalletRenewResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTWalletRenewResponse &&
        error == other.error &&
        message == other.message &&
        walletHandle == other.walletHandle;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, error.hashCode), message.hashCode), walletHandle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTWalletRenewResponse')
          ..add('error', error)
          ..add('message', message)
          ..add('walletHandle', walletHandle))
        .toString();
  }
}

class APIV1POSTWalletRenewResponseBuilder
    implements
        Builder<APIV1POSTWalletRenewResponse,
            APIV1POSTWalletRenewResponseBuilder> {
  _$APIV1POSTWalletRenewResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  APIV1WalletHandleBuilder _walletHandle;
  APIV1WalletHandleBuilder get walletHandle =>
      _$this._walletHandle ??= APIV1WalletHandleBuilder();
  set walletHandle(APIV1WalletHandleBuilder walletHandle) =>
      _$this._walletHandle = walletHandle;

  APIV1POSTWalletRenewResponseBuilder();

  APIV1POSTWalletRenewResponseBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _message = _$v.message;
      _walletHandle = _$v.walletHandle?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTWalletRenewResponse other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$APIV1POSTWalletRenewResponse;
  }

  @override
  void update(void Function(APIV1POSTWalletRenewResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTWalletRenewResponse build() {
    _$APIV1POSTWalletRenewResponse _$result;
    try {
      _$result = _$v ??
          _$APIV1POSTWalletRenewResponse._(
              error: error,
              message: message,
              walletHandle: _walletHandle?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'walletHandle';
        _walletHandle?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'APIV1POSTWalletRenewResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
