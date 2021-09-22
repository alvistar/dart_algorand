// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rename_wallet_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RenameWalletRequest> _$renameWalletRequestSerializer =
    _$RenameWalletRequestSerializer();

class _$RenameWalletRequestSerializer
    implements StructuredSerializer<RenameWalletRequest> {
  @override
  final Iterable<Type> types = const [
    RenameWalletRequest,
    _$RenameWalletRequest
  ];
  @override
  final String wireName = 'RenameWalletRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RenameWalletRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.walletId;
    if (value != null) {
      result
        ..add('wallet_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.walletName;
    if (value != null) {
      result
        ..add('wallet_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.walletPassword;
    if (value != null) {
      result
        ..add('wallet_password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RenameWalletRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RenameWalletRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'wallet_id':
          result.walletId = serializers.deserialize(value,
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

class _$RenameWalletRequest extends RenameWalletRequest {
  @override
  final String walletId;
  @override
  final String walletName;
  @override
  final String walletPassword;

  factory _$RenameWalletRequest(
          [void Function(RenameWalletRequestBuilder) updates]) =>
      (RenameWalletRequestBuilder()..update(updates)).build();

  _$RenameWalletRequest._({this.walletId, this.walletName, this.walletPassword})
      : super._();

  @override
  RenameWalletRequest rebuild(
          void Function(RenameWalletRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RenameWalletRequestBuilder toBuilder() =>
      RenameWalletRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RenameWalletRequest &&
        walletId == other.walletId &&
        walletName == other.walletName &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, walletId.hashCode), walletName.hashCode),
        walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RenameWalletRequest')
          ..add('walletId', walletId)
          ..add('walletName', walletName)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class RenameWalletRequestBuilder
    implements Builder<RenameWalletRequest, RenameWalletRequestBuilder> {
  _$RenameWalletRequest _$v;

  String _walletId;
  String get walletId => _$this._walletId;
  set walletId(String walletId) => _$this._walletId = walletId;

  String _walletName;
  String get walletName => _$this._walletName;
  set walletName(String walletName) => _$this._walletName = walletName;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  RenameWalletRequestBuilder();

  RenameWalletRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _walletId = $v.walletId;
      _walletName = $v.walletName;
      _walletPassword = $v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RenameWalletRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RenameWalletRequest;
  }

  @override
  void update(void Function(RenameWalletRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RenameWalletRequest build() {
    final _$result = _$v ??
        _$RenameWalletRequest._(
            walletId: walletId,
            walletName: walletName,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
