// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_wallet_handle_token_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReleaseWalletHandleTokenRequest>
    _$releaseWalletHandleTokenRequestSerializer =
    new _$ReleaseWalletHandleTokenRequestSerializer();

class _$ReleaseWalletHandleTokenRequestSerializer
    implements StructuredSerializer<ReleaseWalletHandleTokenRequest> {
  @override
  final Iterable<Type> types = const [
    ReleaseWalletHandleTokenRequest,
    _$ReleaseWalletHandleTokenRequest
  ];
  @override
  final String wireName = 'ReleaseWalletHandleTokenRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ReleaseWalletHandleTokenRequest object,
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
  ReleaseWalletHandleTokenRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReleaseWalletHandleTokenRequestBuilder();

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

class _$ReleaseWalletHandleTokenRequest
    extends ReleaseWalletHandleTokenRequest {
  @override
  final String walletHandleToken;

  factory _$ReleaseWalletHandleTokenRequest(
          [void Function(ReleaseWalletHandleTokenRequestBuilder) updates]) =>
      (new ReleaseWalletHandleTokenRequestBuilder()..update(updates)).build();

  _$ReleaseWalletHandleTokenRequest._({this.walletHandleToken}) : super._();

  @override
  ReleaseWalletHandleTokenRequest rebuild(
          void Function(ReleaseWalletHandleTokenRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReleaseWalletHandleTokenRequestBuilder toBuilder() =>
      new ReleaseWalletHandleTokenRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReleaseWalletHandleTokenRequest &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf($jc(0, walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReleaseWalletHandleTokenRequest')
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class ReleaseWalletHandleTokenRequestBuilder
    implements
        Builder<ReleaseWalletHandleTokenRequest,
            ReleaseWalletHandleTokenRequestBuilder> {
  _$ReleaseWalletHandleTokenRequest _$v;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  ReleaseWalletHandleTokenRequestBuilder();

  ReleaseWalletHandleTokenRequestBuilder get _$this {
    if (_$v != null) {
      _walletHandleToken = _$v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReleaseWalletHandleTokenRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReleaseWalletHandleTokenRequest;
  }

  @override
  void update(void Function(ReleaseWalletHandleTokenRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReleaseWalletHandleTokenRequest build() {
    final _$result = _$v ??
        new _$ReleaseWalletHandleTokenRequest._(
            walletHandleToken: walletHandleToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
