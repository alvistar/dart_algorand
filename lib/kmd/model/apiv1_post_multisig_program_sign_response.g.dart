// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_multisig_program_sign_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTMultisigProgramSignResponse>
    _$aPIV1POSTMultisigProgramSignResponseSerializer =
    new _$APIV1POSTMultisigProgramSignResponseSerializer();

class _$APIV1POSTMultisigProgramSignResponseSerializer
    implements StructuredSerializer<APIV1POSTMultisigProgramSignResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTMultisigProgramSignResponse,
    _$APIV1POSTMultisigProgramSignResponse
  ];
  @override
  final String wireName = 'APIV1POSTMultisigProgramSignResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTMultisigProgramSignResponse object,
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
    if (object.multisig != null) {
      result
        ..add('multisig')
        ..add(serializers.serialize(object.multisig,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  APIV1POSTMultisigProgramSignResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new APIV1POSTMultisigProgramSignResponseBuilder();

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
        case 'multisig':
          result.multisig = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1POSTMultisigProgramSignResponse
    extends APIV1POSTMultisigProgramSignResponse {
  @override
  final bool error;
  @override
  final String message;
  @override
  final String multisig;

  factory _$APIV1POSTMultisigProgramSignResponse(
          [void Function(APIV1POSTMultisigProgramSignResponseBuilder)
              updates]) =>
      (new APIV1POSTMultisigProgramSignResponseBuilder()..update(updates))
          .build();

  _$APIV1POSTMultisigProgramSignResponse._(
      {this.error, this.message, this.multisig})
      : super._();

  @override
  APIV1POSTMultisigProgramSignResponse rebuild(
          void Function(APIV1POSTMultisigProgramSignResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTMultisigProgramSignResponseBuilder toBuilder() =>
      new APIV1POSTMultisigProgramSignResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTMultisigProgramSignResponse &&
        error == other.error &&
        message == other.message &&
        multisig == other.multisig;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, error.hashCode), message.hashCode), multisig.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTMultisigProgramSignResponse')
          ..add('error', error)
          ..add('message', message)
          ..add('multisig', multisig))
        .toString();
  }
}

class APIV1POSTMultisigProgramSignResponseBuilder
    implements
        Builder<APIV1POSTMultisigProgramSignResponse,
            APIV1POSTMultisigProgramSignResponseBuilder> {
  _$APIV1POSTMultisigProgramSignResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _multisig;
  String get multisig => _$this._multisig;
  set multisig(String multisig) => _$this._multisig = multisig;

  APIV1POSTMultisigProgramSignResponseBuilder();

  APIV1POSTMultisigProgramSignResponseBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _message = _$v.message;
      _multisig = _$v.multisig;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTMultisigProgramSignResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$APIV1POSTMultisigProgramSignResponse;
  }

  @override
  void update(
      void Function(APIV1POSTMultisigProgramSignResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTMultisigProgramSignResponse build() {
    final _$result = _$v ??
        new _$APIV1POSTMultisigProgramSignResponse._(
            error: error, message: message, multisig: multisig);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
