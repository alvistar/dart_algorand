// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_delete_key_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1DELETEKeyResponse> _$aPIV1DELETEKeyResponseSerializer =
    _$APIV1DELETEKeyResponseSerializer();

class _$APIV1DELETEKeyResponseSerializer
    implements StructuredSerializer<APIV1DELETEKeyResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1DELETEKeyResponse,
    _$APIV1DELETEKeyResponse
  ];
  @override
  final String wireName = 'APIV1DELETEKeyResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1DELETEKeyResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  APIV1DELETEKeyResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1DELETEKeyResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1DELETEKeyResponse extends APIV1DELETEKeyResponse {
  @override
  final bool error;
  @override
  final String message;

  factory _$APIV1DELETEKeyResponse(
          [void Function(APIV1DELETEKeyResponseBuilder) updates]) =>
      (APIV1DELETEKeyResponseBuilder()..update(updates)).build();

  _$APIV1DELETEKeyResponse._({this.error, this.message}) : super._();

  @override
  APIV1DELETEKeyResponse rebuild(
          void Function(APIV1DELETEKeyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1DELETEKeyResponseBuilder toBuilder() =>
      APIV1DELETEKeyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1DELETEKeyResponse &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1DELETEKeyResponse')
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class APIV1DELETEKeyResponseBuilder
    implements Builder<APIV1DELETEKeyResponse, APIV1DELETEKeyResponseBuilder> {
  _$APIV1DELETEKeyResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  APIV1DELETEKeyResponseBuilder();

  APIV1DELETEKeyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1DELETEKeyResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIV1DELETEKeyResponse;
  }

  @override
  void update(void Function(APIV1DELETEKeyResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1DELETEKeyResponse build() {
    final _$result =
        _$v ?? _$APIV1DELETEKeyResponse._(error: error, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
