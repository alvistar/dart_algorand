// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_keys_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListKeysRequest> _$listKeysRequestSerializer =
    _$ListKeysRequestSerializer();

class _$ListKeysRequestSerializer
    implements StructuredSerializer<ListKeysRequest> {
  @override
  final Iterable<Type> types = const [ListKeysRequest, _$ListKeysRequest];
  @override
  final String wireName = 'ListKeysRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, ListKeysRequest object,
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
  ListKeysRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ListKeysRequestBuilder();

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

class _$ListKeysRequest extends ListKeysRequest {
  @override
  final String walletHandleToken;

  factory _$ListKeysRequest([void Function(ListKeysRequestBuilder) updates]) =>
      (ListKeysRequestBuilder()..update(updates)).build();

  _$ListKeysRequest._({this.walletHandleToken}) : super._();

  @override
  ListKeysRequest rebuild(void Function(ListKeysRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListKeysRequestBuilder toBuilder() => ListKeysRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListKeysRequest &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf($jc(0, walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ListKeysRequest')
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class ListKeysRequestBuilder
    implements Builder<ListKeysRequest, ListKeysRequestBuilder> {
  _$ListKeysRequest _$v;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  ListKeysRequestBuilder();

  ListKeysRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _walletHandleToken = $v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListKeysRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListKeysRequest;
  }

  @override
  void update(void Function(ListKeysRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListKeysRequest build() {
    final _$result =
        _$v ?? _$ListKeysRequest._(walletHandleToken: walletHandleToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
