// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_delete_multisig_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1DELETEMultisigResponse>
    _$aPIV1DELETEMultisigResponseSerializer =
    _$APIV1DELETEMultisigResponseSerializer();

class _$APIV1DELETEMultisigResponseSerializer
    implements StructuredSerializer<APIV1DELETEMultisigResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1DELETEMultisigResponse,
    _$APIV1DELETEMultisigResponse
  ];
  @override
  final String wireName = 'APIV1DELETEMultisigResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1DELETEMultisigResponse object,
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
    return result;
  }

  @override
  APIV1DELETEMultisigResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1DELETEMultisigResponseBuilder();

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
      }
    }

    return result.build();
  }
}

class _$APIV1DELETEMultisigResponse extends APIV1DELETEMultisigResponse {
  @override
  final bool error;
  @override
  final String message;

  factory _$APIV1DELETEMultisigResponse(
          [void Function(APIV1DELETEMultisigResponseBuilder) updates]) =>
      (APIV1DELETEMultisigResponseBuilder()..update(updates)).build();

  _$APIV1DELETEMultisigResponse._({this.error, this.message}) : super._();

  @override
  APIV1DELETEMultisigResponse rebuild(
          void Function(APIV1DELETEMultisigResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1DELETEMultisigResponseBuilder toBuilder() =>
      APIV1DELETEMultisigResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1DELETEMultisigResponse &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1DELETEMultisigResponse')
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class APIV1DELETEMultisigResponseBuilder
    implements
        Builder<APIV1DELETEMultisigResponse,
            APIV1DELETEMultisigResponseBuilder> {
  _$APIV1DELETEMultisigResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  APIV1DELETEMultisigResponseBuilder();

  APIV1DELETEMultisigResponseBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1DELETEMultisigResponse other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$APIV1DELETEMultisigResponse;
  }

  @override
  void update(void Function(APIV1DELETEMultisigResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1DELETEMultisigResponse build() {
    final _$result =
        _$v ?? _$APIV1DELETEMultisigResponse._(error: error, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
