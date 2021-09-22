// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WalletInfoRequest> _$walletInfoRequestSerializer =
    _$WalletInfoRequestSerializer();

class _$WalletInfoRequestSerializer
    implements StructuredSerializer<WalletInfoRequest> {
  @override
  final Iterable<Type> types = const [WalletInfoRequest, _$WalletInfoRequest];
  @override
  final String wireName = 'WalletInfoRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, WalletInfoRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.walletHandleToken;
    if (value != null) {
      result
        ..add('wallet_handle_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  WalletInfoRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WalletInfoRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
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

class _$WalletInfoRequest extends WalletInfoRequest {
  @override
  final String walletHandleToken;

  factory _$WalletInfoRequest(
          [void Function(WalletInfoRequestBuilder) updates]) =>
      (WalletInfoRequestBuilder()..update(updates)).build();

  _$WalletInfoRequest._({this.walletHandleToken}) : super._();

  @override
  WalletInfoRequest rebuild(void Function(WalletInfoRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletInfoRequestBuilder toBuilder() =>
      WalletInfoRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletInfoRequest &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf($jc(0, walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WalletInfoRequest')
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class WalletInfoRequestBuilder
    implements Builder<WalletInfoRequest, WalletInfoRequestBuilder> {
  _$WalletInfoRequest _$v;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  WalletInfoRequestBuilder();

  WalletInfoRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _walletHandleToken = $v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletInfoRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletInfoRequest;
  }

  @override
  void update(void Function(WalletInfoRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WalletInfoRequest build() {
    final _$result =
        _$v ?? _$WalletInfoRequest._(walletHandleToken: walletHandleToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
