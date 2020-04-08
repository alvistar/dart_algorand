// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_transaction_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignTransactionRequest> _$signTransactionRequestSerializer =
    new _$SignTransactionRequestSerializer();

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
    if (object.transaction != null) {
      result
        ..add('transaction')
        ..add(serializers.serialize(object.transaction,
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
  SignTransactionRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignTransactionRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
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
      (new SignTransactionRequestBuilder()..update(updates)).build();

  _$SignTransactionRequest._(
      {this.transaction, this.walletHandleToken, this.walletPassword})
      : super._();

  @override
  SignTransactionRequest rebuild(
          void Function(SignTransactionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignTransactionRequestBuilder toBuilder() =>
      new SignTransactionRequestBuilder()..replace(this);

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
    if (_$v != null) {
      _transaction = _$v.transaction;
      _walletHandleToken = _$v.walletHandleToken;
      _walletPassword = _$v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignTransactionRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignTransactionRequest;
  }

  @override
  void update(void Function(SignTransactionRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignTransactionRequest build() {
    final _$result = _$v ??
        new _$SignTransactionRequest._(
            transaction: transaction,
            walletHandleToken: walletHandleToken,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
