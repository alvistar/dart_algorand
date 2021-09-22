// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_key_export_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTKeyExportResponse> _$aPIV1POSTKeyExportResponseSerializer =
    _$APIV1POSTKeyExportResponseSerializer();

class _$APIV1POSTKeyExportResponseSerializer
    implements StructuredSerializer<APIV1POSTKeyExportResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTKeyExportResponse,
    _$APIV1POSTKeyExportResponse
  ];
  @override
  final String wireName = 'APIV1POSTKeyExportResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTKeyExportResponse object,
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
    value = object.privateKey;
    if (value != null) {
      result
        ..add('private_key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  APIV1POSTKeyExportResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1POSTKeyExportResponseBuilder();

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
        case 'private_key':
          result.privateKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1POSTKeyExportResponse extends APIV1POSTKeyExportResponse {
  @override
  final bool error;
  @override
  final String message;
  @override
  final String privateKey;

  factory _$APIV1POSTKeyExportResponse(
          [void Function(APIV1POSTKeyExportResponseBuilder) updates]) =>
      (APIV1POSTKeyExportResponseBuilder()..update(updates)).build();

  _$APIV1POSTKeyExportResponse._({this.error, this.message, this.privateKey})
      : super._();

  @override
  APIV1POSTKeyExportResponse rebuild(
          void Function(APIV1POSTKeyExportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTKeyExportResponseBuilder toBuilder() =>
      APIV1POSTKeyExportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTKeyExportResponse &&
        error == other.error &&
        message == other.message &&
        privateKey == other.privateKey;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, error.hashCode), message.hashCode), privateKey.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTKeyExportResponse')
          ..add('error', error)
          ..add('message', message)
          ..add('privateKey', privateKey))
        .toString();
  }
}

class APIV1POSTKeyExportResponseBuilder
    implements
        Builder<APIV1POSTKeyExportResponse, APIV1POSTKeyExportResponseBuilder> {
  _$APIV1POSTKeyExportResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _privateKey;
  String get privateKey => _$this._privateKey;
  set privateKey(String privateKey) => _$this._privateKey = privateKey;

  APIV1POSTKeyExportResponseBuilder();

  APIV1POSTKeyExportResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _privateKey = $v.privateKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTKeyExportResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIV1POSTKeyExportResponse;
  }

  @override
  void update(void Function(APIV1POSTKeyExportResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTKeyExportResponse build() {
    final _$result = _$v ??
        _$APIV1POSTKeyExportResponse._(
            error: error, message: message, privateKey: privateKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
