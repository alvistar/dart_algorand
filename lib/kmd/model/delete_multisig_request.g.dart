// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_multisig_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeleteMultisigRequest> _$deleteMultisigRequestSerializer =
    new _$DeleteMultisigRequestSerializer();

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
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.walletHandleToken != null) {
      result
        ..add('wallet_handle_token')
        ..add(serializers.serialize(object.walletHandleToken,
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
  DeleteMultisigRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeleteMultisigRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
      (new DeleteMultisigRequestBuilder()..update(updates)).build();

  _$DeleteMultisigRequest._(
      {this.address, this.walletHandleToken, this.walletPassword})
      : super._();

  @override
  DeleteMultisigRequest rebuild(
          void Function(DeleteMultisigRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteMultisigRequestBuilder toBuilder() =>
      new DeleteMultisigRequestBuilder()..replace(this);

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
    if (_$v != null) {
      _address = _$v.address;
      _walletHandleToken = _$v.walletHandleToken;
      _walletPassword = _$v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteMultisigRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DeleteMultisigRequest;
  }

  @override
  void update(void Function(DeleteMultisigRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeleteMultisigRequest build() {
    final _$result = _$v ??
        new _$DeleteMultisigRequest._(
            address: address,
            walletHandleToken: walletHandleToken,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
