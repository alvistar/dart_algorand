// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Version> _$versionSerializer = _$VersionSerializer();

class _$VersionSerializer implements StructuredSerializer<Version> {
  @override
  final Iterable<Type> types = const [Version, _$Version];
  @override
  final String wireName = 'Version';

  @override
  Iterable<Object> serialize(Serializers serializers, Version object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.vbuild;
    if (value != null) {
      result
        ..add('build')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuildVersion)));
    }
    value = object.genesisHashB64;
    if (value != null) {
      result
        ..add('genesis_hash_b64')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genesisId;
    if (value != null) {
      result
        ..add('genesis_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.versions;
    if (value != null) {
      result
        ..add('versions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  Version deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VersionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'build':
          result.vbuild.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuildVersion)) as BuildVersion);
          break;
        case 'genesis_hash_b64':
          result.genesisHashB64 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genesis_id':
          result.genesisId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'versions':
          result.versions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Version extends Version {
  @override
  final BuildVersion vbuild;
  @override
  final String genesisHashB64;
  @override
  final String genesisId;
  @override
  final BuiltList<String> versions;

  factory _$Version([void Function(VersionBuilder) updates]) =>
      (VersionBuilder()..update(updates)).build();

  _$Version._({this.vbuild, this.genesisHashB64, this.genesisId, this.versions})
      : super._();

  @override
  Version rebuild(void Function(VersionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VersionBuilder toBuilder() => VersionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Version &&
        vbuild == other.vbuild &&
        genesisHashB64 == other.genesisHashB64 &&
        genesisId == other.genesisId &&
        versions == other.versions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, vbuild.hashCode), genesisHashB64.hashCode),
            genesisId.hashCode),
        versions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Version')
          ..add('vbuild', vbuild)
          ..add('genesisHashB64', genesisHashB64)
          ..add('genesisId', genesisId)
          ..add('versions', versions))
        .toString();
  }
}

class VersionBuilder implements Builder<Version, VersionBuilder> {
  _$Version _$v;

  BuildVersionBuilder _vbuild;
  BuildVersionBuilder get vbuild => _$this._vbuild ??= BuildVersionBuilder();
  set vbuild(BuildVersionBuilder vbuild) => _$this._vbuild = vbuild;

  String _genesisHashB64;
  String get genesisHashB64 => _$this._genesisHashB64;
  set genesisHashB64(String genesisHashB64) =>
      _$this._genesisHashB64 = genesisHashB64;

  String _genesisId;
  String get genesisId => _$this._genesisId;
  set genesisId(String genesisId) => _$this._genesisId = genesisId;

  ListBuilder<String> _versions;
  ListBuilder<String> get versions =>
      _$this._versions ??= ListBuilder<String>();
  set versions(ListBuilder<String> versions) => _$this._versions = versions;

  VersionBuilder();

  VersionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vbuild = $v.vbuild?.toBuilder();
      _genesisHashB64 = $v.genesisHashB64;
      _genesisId = $v.genesisId;
      _versions = $v.versions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Version other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Version;
  }

  @override
  void update(void Function(VersionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Version build() {
    _$Version _$result;
    try {
      _$result = _$v ??
          _$Version._(
              vbuild: _vbuild?.build(),
              genesisHashB64: genesisHashB64,
              genesisId: genesisId,
              versions: _versions?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'vbuild';
        _vbuild?.build();

        _$failedField = 'versions';
        _versions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'Version', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
