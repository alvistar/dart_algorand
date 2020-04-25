// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_program_multisig_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignProgramMultisigRequest> _$signProgramMultisigRequestSerializer =
    _$SignProgramMultisigRequestSerializer();

class _$SignProgramMultisigRequestSerializer
    implements StructuredSerializer<SignProgramMultisigRequest> {
  @override
  final Iterable<Type> types = const [
    SignProgramMultisigRequest,
    _$SignProgramMultisigRequest
  ];
  @override
  final String wireName = 'SignProgramMultisigRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SignProgramMultisigRequest object,
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
    if (object.partialMultisig != null) {
      result
        ..add('partial_multisig')
        ..add(serializers.serialize(object.partialMultisig,
            specifiedType: const FullType(MultisigSig)));
    }
    if (object.publicKey != null) {
      result
        ..add('public_key')
        ..add(serializers.serialize(object.publicKey,
            specifiedType: const FullType(BuiltList, [FullType(int)])));
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
  SignProgramMultisigRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SignProgramMultisigRequestBuilder();

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
        case 'partial_multisig':
          result.partialMultisig.replace(serializers.deserialize(value,
              specifiedType: const FullType(MultisigSig)) as MultisigSig);
          break;
        case 'public_key':
          result.publicKey.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(int)]))
              as BuiltList<Object>);
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

class _$SignProgramMultisigRequest extends SignProgramMultisigRequest {
  @override
  final String address;
  @override
  final String data;
  @override
  final MultisigSig partialMultisig;
  @override
  final BuiltList<int> publicKey;
  @override
  final String walletHandleToken;
  @override
  final String walletPassword;

  factory _$SignProgramMultisigRequest(
          [void Function(SignProgramMultisigRequestBuilder) updates]) =>
      (SignProgramMultisigRequestBuilder()..update(updates)).build();

  _$SignProgramMultisigRequest._(
      {this.address,
      this.data,
      this.partialMultisig,
      this.publicKey,
      this.walletHandleToken,
      this.walletPassword})
      : super._();

  @override
  SignProgramMultisigRequest rebuild(
          void Function(SignProgramMultisigRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignProgramMultisigRequestBuilder toBuilder() =>
      SignProgramMultisigRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignProgramMultisigRequest &&
        address == other.address &&
        data == other.data &&
        partialMultisig == other.partialMultisig &&
        publicKey == other.publicKey &&
        walletHandleToken == other.walletHandleToken &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, address.hashCode), data.hashCode),
                    partialMultisig.hashCode),
                publicKey.hashCode),
            walletHandleToken.hashCode),
        walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignProgramMultisigRequest')
          ..add('address', address)
          ..add('data', data)
          ..add('partialMultisig', partialMultisig)
          ..add('publicKey', publicKey)
          ..add('walletHandleToken', walletHandleToken)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class SignProgramMultisigRequestBuilder
    implements
        Builder<SignProgramMultisigRequest, SignProgramMultisigRequestBuilder> {
  _$SignProgramMultisigRequest _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _data;
  String get data => _$this._data;
  set data(String data) => _$this._data = data;

  MultisigSigBuilder _partialMultisig;
  MultisigSigBuilder get partialMultisig =>
      _$this._partialMultisig ??= MultisigSigBuilder();
  set partialMultisig(MultisigSigBuilder partialMultisig) =>
      _$this._partialMultisig = partialMultisig;

  ListBuilder<int> _publicKey;
  ListBuilder<int> get publicKey => _$this._publicKey ??= ListBuilder<int>();
  set publicKey(ListBuilder<int> publicKey) => _$this._publicKey = publicKey;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  SignProgramMultisigRequestBuilder();

  SignProgramMultisigRequestBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address;
      _data = _$v.data;
      _partialMultisig = _$v.partialMultisig?.toBuilder();
      _publicKey = _$v.publicKey?.toBuilder();
      _walletHandleToken = _$v.walletHandleToken;
      _walletPassword = _$v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignProgramMultisigRequest other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$SignProgramMultisigRequest;
  }

  @override
  void update(void Function(SignProgramMultisigRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignProgramMultisigRequest build() {
    _$SignProgramMultisigRequest _$result;
    try {
      _$result = _$v ??
          _$SignProgramMultisigRequest._(
              address: address,
              data: data,
              partialMultisig: _partialMultisig?.build(),
              publicKey: _publicKey?.build(),
              walletHandleToken: walletHandleToken,
              walletPassword: walletPassword);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'partialMultisig';
        _partialMultisig?.build();
        _$failedField = 'publicKey';
        _publicKey?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'SignProgramMultisigRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
