// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_version.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuildVersion> _$buildVersionSerializer = _$BuildVersionSerializer();

class _$BuildVersionSerializer implements StructuredSerializer<BuildVersion> {
  @override
  final Iterable<Type> types = const [BuildVersion, _$BuildVersion];
  @override
  final String wireName = 'BuildVersion';

  @override
  Iterable<Object> serialize(Serializers serializers, BuildVersion object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.branch;
    if (value != null) {
      result
        ..add('branch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.buildNumber;
    if (value != null) {
      result
        ..add('build_number')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.channel;
    if (value != null) {
      result
        ..add('channel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commitHash;
    if (value != null) {
      result
        ..add('commit_hash')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.major;
    if (value != null) {
      result
        ..add('major')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minor;
    if (value != null) {
      result
        ..add('minor')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BuildVersion deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BuildVersionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'branch':
          result.branch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'build_number':
          result.buildNumber = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'channel':
          result.channel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'commit_hash':
          result.commitHash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'major':
          result.major = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'minor':
          result.minor = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BuildVersion extends BuildVersion {
  @override
  final String branch;
  @override
  final int buildNumber;
  @override
  final String channel;
  @override
  final String commitHash;
  @override
  final int major;
  @override
  final int minor;

  factory _$BuildVersion([void Function(BuildVersionBuilder) updates]) =>
      (BuildVersionBuilder()..update(updates)).build();

  _$BuildVersion._(
      {this.branch,
      this.buildNumber,
      this.channel,
      this.commitHash,
      this.major,
      this.minor})
      : super._();

  @override
  BuildVersion rebuild(void Function(BuildVersionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuildVersionBuilder toBuilder() => BuildVersionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuildVersion &&
        branch == other.branch &&
        buildNumber == other.buildNumber &&
        channel == other.channel &&
        commitHash == other.commitHash &&
        major == other.major &&
        minor == other.minor;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, branch.hashCode), buildNumber.hashCode),
                    channel.hashCode),
                commitHash.hashCode),
            major.hashCode),
        minor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuildVersion')
          ..add('branch', branch)
          ..add('buildNumber', buildNumber)
          ..add('channel', channel)
          ..add('commitHash', commitHash)
          ..add('major', major)
          ..add('minor', minor))
        .toString();
  }
}

class BuildVersionBuilder
    implements Builder<BuildVersion, BuildVersionBuilder> {
  _$BuildVersion _$v;

  String _branch;
  String get branch => _$this._branch;
  set branch(String branch) => _$this._branch = branch;

  int _buildNumber;
  int get buildNumber => _$this._buildNumber;
  set buildNumber(int buildNumber) => _$this._buildNumber = buildNumber;

  String _channel;
  String get channel => _$this._channel;
  set channel(String channel) => _$this._channel = channel;

  String _commitHash;
  String get commitHash => _$this._commitHash;
  set commitHash(String commitHash) => _$this._commitHash = commitHash;

  int _major;
  int get major => _$this._major;
  set major(int major) => _$this._major = major;

  int _minor;
  int get minor => _$this._minor;
  set minor(int minor) => _$this._minor = minor;

  BuildVersionBuilder();

  BuildVersionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _branch = $v.branch;
      _buildNumber = $v.buildNumber;
      _channel = $v.channel;
      _commitHash = $v.commitHash;
      _major = $v.major;
      _minor = $v.minor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuildVersion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuildVersion;
  }

  @override
  void update(void Function(BuildVersionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuildVersion build() {
    final _$result = _$v ??
        _$BuildVersion._(
            branch: branch,
            buildNumber: buildNumber,
            channel: channel,
            commitHash: commitHash,
            major: major,
            minor: minor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
