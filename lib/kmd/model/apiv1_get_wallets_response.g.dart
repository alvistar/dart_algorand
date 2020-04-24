// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_get_wallets_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1GETWalletsResponse> _$aPIV1GETWalletsResponseSerializer =
    _$APIV1GETWalletsResponseSerializer();

class _$APIV1GETWalletsResponseSerializer
    implements StructuredSerializer<APIV1GETWalletsResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1GETWalletsResponse,
    _$APIV1GETWalletsResponse
  ];
  @override
  final String wireName = 'APIV1GETWalletsResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1GETWalletsResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(bool)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.wallets != null) {
      result
        ..add('wallets')
        ..add(serializers.serialize(object.wallets,
            specifiedType: const FullType(BuiltList, [FullType(APIV1Wallet)])));
    }
    return result;
  }

  @override
  APIV1GETWalletsResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1GETWalletsResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallets':
          result.wallets.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, [FullType(APIV1Wallet)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1GETWalletsResponse extends APIV1GETWalletsResponse {
  @override
  final bool error;
  @override
  final String message;
  @override
  final BuiltList<APIV1Wallet> wallets;

  factory _$APIV1GETWalletsResponse(
          [void Function(APIV1GETWalletsResponseBuilder) updates]) =>
      (APIV1GETWalletsResponseBuilder()..update(updates)).build();

  _$APIV1GETWalletsResponse._({this.error, this.message, this.wallets})
      : super._();

  @override
  APIV1GETWalletsResponse rebuild(
          void Function(APIV1GETWalletsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1GETWalletsResponseBuilder toBuilder() =>
      APIV1GETWalletsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1GETWalletsResponse &&
        error == other.error &&
        message == other.message &&
        wallets == other.wallets;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, error.hashCode), message.hashCode), wallets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1GETWalletsResponse')
          ..add('error', error)
          ..add('message', message)
          ..add('wallets', wallets))
        .toString();
  }
}

class APIV1GETWalletsResponseBuilder
    implements
        Builder<APIV1GETWalletsResponse, APIV1GETWalletsResponseBuilder> {
  _$APIV1GETWalletsResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<APIV1Wallet> _wallets;
  ListBuilder<APIV1Wallet> get wallets =>
      _$this._wallets ??= ListBuilder<APIV1Wallet>();
  set wallets(ListBuilder<APIV1Wallet> wallets) => _$this._wallets = wallets;

  APIV1GETWalletsResponseBuilder();

  APIV1GETWalletsResponseBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _message = _$v.message;
      _wallets = _$v.wallets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1GETWalletsResponse other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$APIV1GETWalletsResponse;
  }

  @override
  void update(void Function(APIV1GETWalletsResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1GETWalletsResponse build() {
    _$APIV1GETWalletsResponse _$result;
    try {
      _$result = _$v ??
          _$APIV1GETWalletsResponse._(
              error: error, message: message, wallets: _wallets?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'wallets';
        _wallets?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'APIV1GETWalletsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
