// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_transaction_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignTransactionRequest> _$signTransactionRequestSerializer =
    _$SignTransactionRequestSerializer();

class _$SignTransactionRequestSerializer
    implements StructuredSerializer<SignTransactionRequest> {
  @override
  final Iterable<Type> types = const [
    SignTransactionRequest,
    _$SignTransactionRequest
  ];
  @override
  final String wireName = 'SignTransactionRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SignTransactionRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.transaction;
    if (value != null) {
      result
        ..add('transaction')
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
  SignTransactionRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SignTransactionRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'transaction':
          result.transaction = serializers.deserialize(value,
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

class _$SignTransactionRequest extends SignTransactionRequest {
  @override
  final String transaction;
  @override
  final String walletHandleToken;
  @override
  final String walletPassword;

  factory _$SignTransactionRequest(
          [void Function(SignTransactionRequestBuilder) updates]) =>
      (SignTransactionRequestBuilder()..update(updates)).build();

  _$SignTransactionRequest._(
      {this.transaction, this.walletHandleToken, this.walletPassword})
      : super._();

  @override
  SignTransactionRequest rebuild(
          void Function(SignTransactionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignTransactionRequestBuilder toBuilder() =>
      SignTransactionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignTransactionRequest &&
        transaction == other.transaction &&
        walletHandleToken == other.walletHandleToken &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, transaction.hashCode), walletHandleToken.hashCode),
        walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignTransactionRequest')
          ..add('transaction', transaction)
          ..add('walletHandleToken', walletHandleToken)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class SignTransactionRequestBuilder
    implements Builder<SignTransactionRequest, SignTransactionRequestBuilder> {
  _$SignTransactionRequest _$v;

  String _transaction;
  String get transaction => _$this._transaction;
  set transaction(String transaction) => _$this._transaction = transaction;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  SignTransactionRequestBuilder();

  SignTransactionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transaction = $v.transaction;
      _walletHandleToken = $v.walletHandleToken;
      _walletPassword = $v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignTransactionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignTransactionRequest;
  }

  @override
  void update(void Function(SignTransactionRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignTransactionRequest build() {
    final _$result = _$v ??
        _$SignTransactionRequest._(
            transaction: transaction,
            walletHandleToken: walletHandleToken,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
