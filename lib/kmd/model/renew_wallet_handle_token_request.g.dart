// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_wallet_handle_token_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RenewWalletHandleTokenRequest>
    _$renewWalletHandleTokenRequestSerializer =
    _$RenewWalletHandleTokenRequestSerializer();

class _$RenewWalletHandleTokenRequestSerializer
    implements StructuredSerializer<RenewWalletHandleTokenRequest> {
  @override
  final Iterable<Type> types = const [
    RenewWalletHandleTokenRequest,
    _$RenewWalletHandleTokenRequest
  ];
  @override
  final String wireName = 'RenewWalletHandleTokenRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RenewWalletHandleTokenRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.walletHandleToken != null) {
      result
        ..add('wallet_handle_token')
        ..add(serializers.serialize(object.walletHandleToken,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RenewWalletHandleTokenRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RenewWalletHandleTokenRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'wallet_handle_token':
          result.walletHandleToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RenewWalletHandleTokenRequest extends RenewWalletHandleTokenRequest {
  @override
  final String walletHandleToken;

  factory _$RenewWalletHandleTokenRequest(
          [void Function(RenewWalletHandleTokenRequestBuilder) updates]) =>
      (RenewWalletHandleTokenRequestBuilder()..update(updates)).build();

  _$RenewWalletHandleTokenRequest._({this.walletHandleToken}) : super._();

  @override
  RenewWalletHandleTokenRequest rebuild(
          void Function(RenewWalletHandleTokenRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RenewWalletHandleTokenRequestBuilder toBuilder() =>
      RenewWalletHandleTokenRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RenewWalletHandleTokenRequest &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf($jc(0, walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RenewWalletHandleTokenRequest')
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class RenewWalletHandleTokenRequestBuilder
    implements
        Builder<RenewWalletHandleTokenRequest,
            RenewWalletHandleTokenRequestBuilder> {
  _$RenewWalletHandleTokenRequest _$v;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  RenewWalletHandleTokenRequestBuilder();

  RenewWalletHandleTokenRequestBuilder get _$this {
    if (_$v != null) {
      _walletHandleToken = _$v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RenewWalletHandleTokenRequest other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$RenewWalletHandleTokenRequest;
  }

  @override
  void update(void Function(RenewWalletHandleTokenRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RenewWalletHandleTokenRequest build() {
    final _$result = _$v ??
        _$RenewWalletHandleTokenRequest._(walletHandleToken: walletHandleToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
