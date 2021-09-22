// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_multisig_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTMultisigListResponse>
    _$aPIV1POSTMultisigListResponseSerializer =
    _$APIV1POSTMultisigListResponseSerializer();

class _$APIV1POSTMultisigListResponseSerializer
    implements StructuredSerializer<APIV1POSTMultisigListResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTMultisigListResponse,
    _$APIV1POSTMultisigListResponse
  ];
  @override
  final String wireName = 'APIV1POSTMultisigListResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTMultisigListResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.addresses;
    if (value != null) {
      result
        ..add('addresses')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
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
  APIV1POSTMultisigListResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1POSTMultisigListResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'addresses':
          result.addresses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(String)]))
              as BuiltList<Object>);
          break;
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

class _$APIV1POSTMultisigListResponse extends APIV1POSTMultisigListResponse {
  @override
  final BuiltList<String> addresses;
  @override
  final bool error;
  @override
  final String message;

  factory _$APIV1POSTMultisigListResponse(
          [void Function(APIV1POSTMultisigListResponseBuilder) updates]) =>
      (APIV1POSTMultisigListResponseBuilder()..update(updates)).build();

  _$APIV1POSTMultisigListResponse._({this.addresses, this.error, this.message})
      : super._();

  @override
  APIV1POSTMultisigListResponse rebuild(
          void Function(APIV1POSTMultisigListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTMultisigListResponseBuilder toBuilder() =>
      APIV1POSTMultisigListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTMultisigListResponse &&
        addresses == other.addresses &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, addresses.hashCode), error.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTMultisigListResponse')
          ..add('addresses', addresses)
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class APIV1POSTMultisigListResponseBuilder
    implements
        Builder<APIV1POSTMultisigListResponse,
            APIV1POSTMultisigListResponseBuilder> {
  _$APIV1POSTMultisigListResponse _$v;

  ListBuilder<String> _addresses;
  ListBuilder<String> get addresses =>
      _$this._addresses ??= ListBuilder<String>();
  set addresses(ListBuilder<String> addresses) => _$this._addresses = addresses;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  APIV1POSTMultisigListResponseBuilder();

  APIV1POSTMultisigListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _addresses = $v.addresses?.toBuilder();
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTMultisigListResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIV1POSTMultisigListResponse;
  }

  @override
  void update(void Function(APIV1POSTMultisigListResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTMultisigListResponse build() {
    _$APIV1POSTMultisigListResponse _$result;
    try {
      _$result = _$v ??
          _$APIV1POSTMultisigListResponse._(
              addresses: _addresses?.build(), error: error, message: message);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'addresses';
        _addresses?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'APIV1POSTMultisigListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
