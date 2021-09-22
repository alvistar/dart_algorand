// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_multisig_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImportMultisigRequest> _$importMultisigRequestSerializer =
    _$ImportMultisigRequestSerializer();

class _$ImportMultisigRequestSerializer
    implements StructuredSerializer<ImportMultisigRequest> {
  @override
  final Iterable<Type> types = const [
    ImportMultisigRequest,
    _$ImportMultisigRequest
  ];
  @override
  final String wireName = 'ImportMultisigRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ImportMultisigRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
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
  ImportMultisigRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ImportMultisigRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
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
        case 'wallet_handle_token':
          result.walletHandleToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImportMultisigRequest extends ImportMultisigRequest {
  @override
  final int multisigVersion;
  @override
  final BuiltList<String> pks;
  @override
  final int threshold;
  @override
  final String walletHandleToken;

  factory _$ImportMultisigRequest(
          [void Function(ImportMultisigRequestBuilder) updates]) =>
      (ImportMultisigRequestBuilder()..update(updates)).build();

  _$ImportMultisigRequest._(
      {this.multisigVersion, this.pks, this.threshold, this.walletHandleToken})
      : super._();

  @override
  ImportMultisigRequest rebuild(
          void Function(ImportMultisigRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImportMultisigRequestBuilder toBuilder() =>
      ImportMultisigRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImportMultisigRequest &&
        multisigVersion == other.multisigVersion &&
        pks == other.pks &&
        threshold == other.threshold &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, multisigVersion.hashCode), pks.hashCode),
            threshold.hashCode),
        walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImportMultisigRequest')
          ..add('multisigVersion', multisigVersion)
          ..add('pks', pks)
          ..add('threshold', threshold)
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class ImportMultisigRequestBuilder
    implements Builder<ImportMultisigRequest, ImportMultisigRequestBuilder> {
  _$ImportMultisigRequest _$v;

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

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  ImportMultisigRequestBuilder();

  ImportMultisigRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _multisigVersion = $v.multisigVersion;
      _pks = $v.pks?.toBuilder();
      _threshold = $v.threshold;
      _walletHandleToken = $v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportMultisigRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImportMultisigRequest;
  }

  @override
  void update(void Function(ImportMultisigRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImportMultisigRequest build() {
    _$ImportMultisigRequest _$result;
    try {
      _$result = _$v ??
          _$ImportMultisigRequest._(
              multisigVersion: multisigVersion,
              pks: _pks?.build(),
              threshold: threshold,
              walletHandleToken: walletHandleToken);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pks';
        _pks?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'ImportMultisigRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
