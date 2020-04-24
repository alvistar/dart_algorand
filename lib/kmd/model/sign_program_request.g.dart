// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_program_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignProgramRequest> _$signProgramRequestSerializer =
    _$SignProgramRequestSerializer();

class _$SignProgramRequestSerializer
    implements StructuredSerializer<SignProgramRequest> {
  @override
  final Iterable<Type> types = const [SignProgramRequest, _$SignProgramRequest];
  @override
  final String wireName = 'SignProgramRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, SignProgramRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.data != null) {
      result
        ..add('data')
        ..add(serializers.serialize(object.data,
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
  SignProgramRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SignProgramRequestBuilder();

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
        case 'data':
          result.data = serializers.deserialize(value,
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

class _$SignProgramRequest extends SignProgramRequest {
  @override
  final String address;
  @override
  final String data;
  @override
  final String walletHandleToken;
  @override
  final String walletPassword;

  factory _$SignProgramRequest(
          [void Function(SignProgramRequestBuilder) updates]) =>
      (SignProgramRequestBuilder()..update(updates)).build();

  _$SignProgramRequest._(
      {this.address, this.data, this.walletHandleToken, this.walletPassword})
      : super._();

  @override
  SignProgramRequest rebuild(
          void Function(SignProgramRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignProgramRequestBuilder toBuilder() =>
      SignProgramRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignProgramRequest &&
        address == other.address &&
        data == other.data &&
        walletHandleToken == other.walletHandleToken &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, address.hashCode), data.hashCode),
            walletHandleToken.hashCode),
        walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignProgramRequest')
          ..add('address', address)
          ..add('data', data)
          ..add('walletHandleToken', walletHandleToken)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class SignProgramRequestBuilder
    implements Builder<SignProgramRequest, SignProgramRequestBuilder> {
  _$SignProgramRequest _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _data;
  String get data => _$this._data;
  set data(String data) => _$this._data = data;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  SignProgramRequestBuilder();

  SignProgramRequestBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address;
      _data = _$v.data;
      _walletHandleToken = _$v.walletHandleToken;
      _walletPassword = _$v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignProgramRequest other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$SignProgramRequest;
  }

  @override
  void update(void Function(SignProgramRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignProgramRequest build() {
    final _$result = _$v ??
        _$SignProgramRequest._(
            address: address,
            data: data,
            walletHandleToken: walletHandleToken,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
