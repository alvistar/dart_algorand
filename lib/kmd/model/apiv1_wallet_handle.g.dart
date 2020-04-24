// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_wallet_handle.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1WalletHandle> _$aPIV1WalletHandleSerializer =
    _$APIV1WalletHandleSerializer();

class _$APIV1WalletHandleSerializer
    implements StructuredSerializer<APIV1WalletHandle> {
  @override
  final Iterable<Type> types = const [APIV1WalletHandle, _$APIV1WalletHandle];
  @override
  final String wireName = 'APIV1WalletHandle';

  @override
  Iterable<Object> serialize(Serializers serializers, APIV1WalletHandle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.expiresSeconds != null) {
      result
        ..add('expires_seconds')
        ..add(serializers.serialize(object.expiresSeconds,
            specifiedType: const FullType(int)));
    }
    if (object.wallet != null) {
      result
        ..add('wallet')
        ..add(serializers.serialize(object.wallet,
            specifiedType: const FullType(APIV1Wallet)));
    }
    return result;
  }

  @override
  APIV1WalletHandle deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1WalletHandleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'expires_seconds':
          result.expiresSeconds = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'wallet':
          result.wallet.replace(serializers.deserialize(value,
              specifiedType: const FullType(APIV1Wallet)) as APIV1Wallet);
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1WalletHandle extends APIV1WalletHandle {
  @override
  final int expiresSeconds;
  @override
  final APIV1Wallet wallet;

  factory _$APIV1WalletHandle(
          [void Function(APIV1WalletHandleBuilder) updates]) =>
      (APIV1WalletHandleBuilder()..update(updates)).build();

  _$APIV1WalletHandle._({this.expiresSeconds, this.wallet}) : super._();

  @override
  APIV1WalletHandle rebuild(void Function(APIV1WalletHandleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1WalletHandleBuilder toBuilder() =>
      APIV1WalletHandleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1WalletHandle &&
        expiresSeconds == other.expiresSeconds &&
        wallet == other.wallet;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, expiresSeconds.hashCode), wallet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1WalletHandle')
          ..add('expiresSeconds', expiresSeconds)
          ..add('wallet', wallet))
        .toString();
  }
}

class APIV1WalletHandleBuilder
    implements Builder<APIV1WalletHandle, APIV1WalletHandleBuilder> {
  _$APIV1WalletHandle _$v;

  int _expiresSeconds;
  int get expiresSeconds => _$this._expiresSeconds;
  set expiresSeconds(int expiresSeconds) =>
      _$this._expiresSeconds = expiresSeconds;

  APIV1WalletBuilder _wallet;
  APIV1WalletBuilder get wallet => _$this._wallet ??= APIV1WalletBuilder();
  set wallet(APIV1WalletBuilder wallet) => _$this._wallet = wallet;

  APIV1WalletHandleBuilder();

  APIV1WalletHandleBuilder get _$this {
    if (_$v != null) {
      _expiresSeconds = _$v.expiresSeconds;
      _wallet = _$v.wallet?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1WalletHandle other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$APIV1WalletHandle;
  }

  @override
  void update(void Function(APIV1WalletHandleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1WalletHandle build() {
    _$APIV1WalletHandle _$result;
    try {
      _$result = _$v ??
          _$APIV1WalletHandle._(
              expiresSeconds: expiresSeconds, wallet: _wallet?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'wallet';
        _wallet?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'APIV1WalletHandle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
