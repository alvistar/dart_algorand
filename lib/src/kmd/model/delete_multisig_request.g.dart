// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_multisig_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeleteMultisigRequest> _$deleteMultisigRequestSerializer =
    _$DeleteMultisigRequestSerializer();

class _$DeleteMultisigRequestSerializer
    implements StructuredSerializer<DeleteMultisigRequest> {
  @override
  final Iterable<Type> types = const [
    DeleteMultisigRequest,
    _$DeleteMultisigRequest
  ];
  @override
  final String wireName = 'DeleteMultisigRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DeleteMultisigRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
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
  DeleteMultisigRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeleteMultisigRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_handle_token':
          result.walletHandleToken = serializers.deserialize(value,
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

class _$DeleteMultisigRequest extends DeleteMultisigRequest {
  @override
  final String address;
  @override
  final String walletHandleToken;
  @override
  final String walletPassword;

  factory _$DeleteMultisigRequest(
          [void Function(DeleteMultisigRequestBuilder) updates]) =>
      (DeleteMultisigRequestBuilder()..update(updates)).build();

  _$DeleteMultisigRequest._(
      {this.address, this.walletHandleToken, this.walletPassword})
      : super._();

  @override
  DeleteMultisigRequest rebuild(
          void Function(DeleteMultisigRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteMultisigRequestBuilder toBuilder() =>
      DeleteMultisigRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteMultisigRequest &&
        address == other.address &&
        walletHandleToken == other.walletHandleToken &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, address.hashCode), walletHandleToken.hashCode),
        walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeleteMultisigRequest')
          ..add('address', address)
          ..add('walletHandleToken', walletHandleToken)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class DeleteMultisigRequestBuilder
    implements Builder<DeleteMultisigRequest, DeleteMultisigRequestBuilder> {
  _$DeleteMultisigRequest _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  DeleteMultisigRequestBuilder();

  DeleteMultisigRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _walletHandleToken = $v.walletHandleToken;
      _walletPassword = $v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteMultisigRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteMultisigRequest;
  }

  @override
  void update(void Function(DeleteMultisigRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteMultisigRequest build() {
    final _$result = _$v ??
        _$DeleteMultisigRequest._(
            address: address,
            walletHandleToken: walletHandleToken,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
