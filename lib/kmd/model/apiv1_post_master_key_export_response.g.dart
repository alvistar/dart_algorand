// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_master_key_export_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTMasterKeyExportResponse>
    _$aPIV1POSTMasterKeyExportResponseSerializer =
    new _$APIV1POSTMasterKeyExportResponseSerializer();

class _$APIV1POSTMasterKeyExportResponseSerializer
    implements StructuredSerializer<APIV1POSTMasterKeyExportResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTMasterKeyExportResponse,
    _$APIV1POSTMasterKeyExportResponse
  ];
  @override
  final String wireName = 'APIV1POSTMasterKeyExportResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTMasterKeyExportResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(bool)));
    }
    if (object.masterDerivationKey != null) {
      result
        ..add('master_derivation_key')
        ..add(serializers.serialize(object.masterDerivationKey,
            specifiedType: const FullType(String)));
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
  APIV1POSTMasterKeyExportResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new APIV1POSTMasterKeyExportResponseBuilder();

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
        case 'master_derivation_key':
          result.masterDerivationKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$APIV1POSTMasterKeyExportResponse
    extends APIV1POSTMasterKeyExportResponse {
  @override
  final bool error;
  @override
  final String masterDerivationKey;
  @override
  final String message;

  factory _$APIV1POSTMasterKeyExportResponse(
          [void Function(APIV1POSTMasterKeyExportResponseBuilder) updates]) =>
      (new APIV1POSTMasterKeyExportResponseBuilder()..update(updates)).build();

  _$APIV1POSTMasterKeyExportResponse._(
      {this.error, this.masterDerivationKey, this.message})
      : super._();

  @override
  APIV1POSTMasterKeyExportResponse rebuild(
          void Function(APIV1POSTMasterKeyExportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTMasterKeyExportResponseBuilder toBuilder() =>
      new APIV1POSTMasterKeyExportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTMasterKeyExportResponse &&
        error == other.error &&
        masterDerivationKey == other.masterDerivationKey &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, error.hashCode), masterDerivationKey.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTMasterKeyExportResponse')
          ..add('error', error)
          ..add('masterDerivationKey', masterDerivationKey)
          ..add('message', message))
        .toString();
  }
}

class APIV1POSTMasterKeyExportResponseBuilder
    implements
        Builder<APIV1POSTMasterKeyExportResponse,
            APIV1POSTMasterKeyExportResponseBuilder> {
  _$APIV1POSTMasterKeyExportResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _masterDerivationKey;
  String get masterDerivationKey => _$this._masterDerivationKey;
  set masterDerivationKey(String masterDerivationKey) =>
      _$this._masterDerivationKey = masterDerivationKey;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  APIV1POSTMasterKeyExportResponseBuilder();

  APIV1POSTMasterKeyExportResponseBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _masterDerivationKey = _$v.masterDerivationKey;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTMasterKeyExportResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$APIV1POSTMasterKeyExportResponse;
  }

  @override
  void update(void Function(APIV1POSTMasterKeyExportResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTMasterKeyExportResponse build() {
    final _$result = _$v ??
        new _$APIV1POSTMasterKeyExportResponse._(
            error: error,
            masterDerivationKey: masterDerivationKey,
            message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
