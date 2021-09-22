// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_program_sign_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTProgramSignResponse>
    _$aPIV1POSTProgramSignResponseSerializer =
    _$APIV1POSTProgramSignResponseSerializer();

class _$APIV1POSTProgramSignResponseSerializer
    implements StructuredSerializer<APIV1POSTProgramSignResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTProgramSignResponse,
    _$APIV1POSTProgramSignResponse
  ];
  @override
  final String wireName = 'APIV1POSTProgramSignResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTProgramSignResponse object,
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
    value = object.sig;
    if (value != null) {
      result
        ..add('sig')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  APIV1POSTProgramSignResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1POSTProgramSignResponseBuilder();

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
        case 'sig':
          result.sig = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1POSTProgramSignResponse extends APIV1POSTProgramSignResponse {
  @override
  final bool error;
  @override
  final String message;
  @override
  final String sig;

  factory _$APIV1POSTProgramSignResponse(
          [void Function(APIV1POSTProgramSignResponseBuilder) updates]) =>
      (APIV1POSTProgramSignResponseBuilder()..update(updates)).build();

  _$APIV1POSTProgramSignResponse._({this.error, this.message, this.sig})
      : super._();

  @override
  APIV1POSTProgramSignResponse rebuild(
          void Function(APIV1POSTProgramSignResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTProgramSignResponseBuilder toBuilder() =>
      APIV1POSTProgramSignResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTProgramSignResponse &&
        error == other.error &&
        message == other.message &&
        sig == other.sig;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, error.hashCode), message.hashCode), sig.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTProgramSignResponse')
          ..add('error', error)
          ..add('message', message)
          ..add('sig', sig))
        .toString();
  }
}

class APIV1POSTProgramSignResponseBuilder
    implements
        Builder<APIV1POSTProgramSignResponse,
            APIV1POSTProgramSignResponseBuilder> {
  _$APIV1POSTProgramSignResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _sig;
  String get sig => _$this._sig;
  set sig(String sig) => _$this._sig = sig;

  APIV1POSTProgramSignResponseBuilder();

  APIV1POSTProgramSignResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _sig = $v.sig;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTProgramSignResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIV1POSTProgramSignResponse;
  }

  @override
  void update(void Function(APIV1POSTProgramSignResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTProgramSignResponse build() {
    final _$result = _$v ??
        _$APIV1POSTProgramSignResponse._(
            error: error, message: message, sig: sig);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
