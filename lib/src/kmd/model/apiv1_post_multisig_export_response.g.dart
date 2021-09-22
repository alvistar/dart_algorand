// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_post_multisig_export_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1POSTMultisigExportResponse>
    _$aPIV1POSTMultisigExportResponseSerializer =
    _$APIV1POSTMultisigExportResponseSerializer();

class _$APIV1POSTMultisigExportResponseSerializer
    implements StructuredSerializer<APIV1POSTMultisigExportResponse> {
  @override
  final Iterable<Type> types = const [
    APIV1POSTMultisigExportResponse,
    _$APIV1POSTMultisigExportResponse
  ];
  @override
  final String wireName = 'APIV1POSTMultisigExportResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, APIV1POSTMultisigExportResponse object,
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
    value = object.multisigVersion;
    if (value != null) {
      result
        ..add('multisig_version')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pks;
    if (value != null) {
      result
        ..add('pks')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    value = object.threshold;
    if (value != null) {
      result
        ..add('threshold')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  APIV1POSTMultisigExportResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1POSTMultisigExportResponseBuilder();

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
        case 'multisig_version':
          result.multisigVersion = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pks':
          result.pks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'threshold':
          result.threshold = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1POSTMultisigExportResponse
    extends APIV1POSTMultisigExportResponse {
  @override
  final bool error;
  @override
  final String message;
  @override
  final int multisigVersion;
  @override
  final BuiltList<String> pks;
  @override
  final int threshold;

  factory _$APIV1POSTMultisigExportResponse(
          [void Function(APIV1POSTMultisigExportResponseBuilder) updates]) =>
      (APIV1POSTMultisigExportResponseBuilder()..update(updates)).build();

  _$APIV1POSTMultisigExportResponse._(
      {this.error,
      this.message,
      this.multisigVersion,
      this.pks,
      this.threshold})
      : super._();

  @override
  APIV1POSTMultisigExportResponse rebuild(
          void Function(APIV1POSTMultisigExportResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1POSTMultisigExportResponseBuilder toBuilder() =>
      APIV1POSTMultisigExportResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1POSTMultisigExportResponse &&
        error == other.error &&
        message == other.message &&
        multisigVersion == other.multisigVersion &&
        pks == other.pks &&
        threshold == other.threshold;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, error.hashCode), message.hashCode),
                multisigVersion.hashCode),
            pks.hashCode),
        threshold.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1POSTMultisigExportResponse')
          ..add('error', error)
          ..add('message', message)
          ..add('multisigVersion', multisigVersion)
          ..add('pks', pks)
          ..add('threshold', threshold))
        .toString();
  }
}

class APIV1POSTMultisigExportResponseBuilder
    implements
        Builder<APIV1POSTMultisigExportResponse,
            APIV1POSTMultisigExportResponseBuilder> {
  _$APIV1POSTMultisigExportResponse _$v;

  bool _error;
  bool get error => _$this._error;
  set error(bool error) => _$this._error = error;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  int _multisigVersion;
  int get multisigVersion => _$this._multisigVersion;
  set multisigVersion(int multisigVersion) =>
      _$this._multisigVersion = multisigVersion;

  ListBuilder<String> _pks;
  ListBuilder<String> get pks => _$this._pks ??= ListBuilder<String>();
  set pks(ListBuilder<String> pks) => _$this._pks = pks;

  int _threshold;
  int get threshold => _$this._threshold;
  set threshold(int threshold) => _$this._threshold = threshold;

  APIV1POSTMultisigExportResponseBuilder();

  APIV1POSTMultisigExportResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _message = $v.message;
      _multisigVersion = $v.multisigVersion;
      _pks = $v.pks?.toBuilder();
      _threshold = $v.threshold;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1POSTMultisigExportResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$APIV1POSTMultisigExportResponse;
  }

  @override
  void update(void Function(APIV1POSTMultisigExportResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1POSTMultisigExportResponse build() {
    _$APIV1POSTMultisigExportResponse _$result;
    try {
      _$result = _$v ??
          _$APIV1POSTMultisigExportResponse._(
              error: error,
              message: message,
              multisigVersion: multisigVersion,
              pks: _pks?.build(),
              threshold: threshold);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pks';
        _pks?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'APIV1POSTMultisigExportResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
