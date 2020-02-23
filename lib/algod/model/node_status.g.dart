// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NodeStatus> _$nodeStatusSerializer = new _$NodeStatusSerializer();

class _$NodeStatusSerializer implements StructuredSerializer<NodeStatus> {
  @override
  final Iterable<Type> types = const [NodeStatus, _$NodeStatus];
  @override
  final String wireName = 'NodeStatus';

  @override
  Iterable<Object> serialize(Serializers serializers, NodeStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.catchupTime != null) {
      result
        ..add('catchupTime')
        ..add(serializers.serialize(object.catchupTime,
            specifiedType: const FullType(int)));
    }
    if (object.hasSyncedSinceStartup != null) {
      result
        ..add('hasSyncedSinceStartup')
        ..add(serializers.serialize(object.hasSyncedSinceStartup,
            specifiedType: const FullType(bool)));
    }
    if (object.lastConsensusVersion != null) {
      result
        ..add('lastConsensusVersion')
        ..add(serializers.serialize(object.lastConsensusVersion,
            specifiedType: const FullType(String)));
    }
    if (object.lastRound != null) {
      result
        ..add('lastRound')
        ..add(serializers.serialize(object.lastRound,
            specifiedType: const FullType(int)));
    }
    if (object.nextConsensusVersion != null) {
      result
        ..add('nextConsensusVersion')
        ..add(serializers.serialize(object.nextConsensusVersion,
            specifiedType: const FullType(String)));
    }
    if (object.nextConsensusVersionRound != null) {
      result
        ..add('nextConsensusVersionRound')
        ..add(serializers.serialize(object.nextConsensusVersionRound,
            specifiedType: const FullType(int)));
    }
    if (object.nextConsensusVersionSupported != null) {
      result
        ..add('nextConsensusVersionSupported')
        ..add(serializers.serialize(object.nextConsensusVersionSupported,
            specifiedType: const FullType(bool)));
    }
    if (object.timeSinceLastRound != null) {
      result
        ..add('timeSinceLastRound')
        ..add(serializers.serialize(object.timeSinceLastRound,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NodeStatus deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NodeStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'catchupTime':
          result.catchupTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hasSyncedSinceStartup':
          result.hasSyncedSinceStartup = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lastConsensusVersion':
          result.lastConsensusVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastRound':
          result.lastRound = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nextConsensusVersion':
          result.nextConsensusVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nextConsensusVersionRound':
          result.nextConsensusVersionRound = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nextConsensusVersionSupported':
          result.nextConsensusVersionSupported = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'timeSinceLastRound':
          result.timeSinceLastRound = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$NodeStatus extends NodeStatus {
  @override
  final int catchupTime;
  @override
  final bool hasSyncedSinceStartup;
  @override
  final String lastConsensusVersion;
  @override
  final int lastRound;
  @override
  final String nextConsensusVersion;
  @override
  final int nextConsensusVersionRound;
  @override
  final bool nextConsensusVersionSupported;
  @override
  final int timeSinceLastRound;

  factory _$NodeStatus([void Function(NodeStatusBuilder) updates]) =>
      (new NodeStatusBuilder()..update(updates)).build();

  _$NodeStatus._(
      {this.catchupTime,
      this.hasSyncedSinceStartup,
      this.lastConsensusVersion,
      this.lastRound,
      this.nextConsensusVersion,
      this.nextConsensusVersionRound,
      this.nextConsensusVersionSupported,
      this.timeSinceLastRound})
      : super._();

  @override
  NodeStatus rebuild(void Function(NodeStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NodeStatusBuilder toBuilder() => new NodeStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NodeStatus &&
        catchupTime == other.catchupTime &&
        hasSyncedSinceStartup == other.hasSyncedSinceStartup &&
        lastConsensusVersion == other.lastConsensusVersion &&
        lastRound == other.lastRound &&
        nextConsensusVersion == other.nextConsensusVersion &&
        nextConsensusVersionRound == other.nextConsensusVersionRound &&
        nextConsensusVersionSupported == other.nextConsensusVersionSupported &&
        timeSinceLastRound == other.timeSinceLastRound;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, catchupTime.hashCode),
                                hasSyncedSinceStartup.hashCode),
                            lastConsensusVersion.hashCode),
                        lastRound.hashCode),
                    nextConsensusVersion.hashCode),
                nextConsensusVersionRound.hashCode),
            nextConsensusVersionSupported.hashCode),
        timeSinceLastRound.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NodeStatus')
          ..add('catchupTime', catchupTime)
          ..add('hasSyncedSinceStartup', hasSyncedSinceStartup)
          ..add('lastConsensusVersion', lastConsensusVersion)
          ..add('lastRound', lastRound)
          ..add('nextConsensusVersion', nextConsensusVersion)
          ..add('nextConsensusVersionRound', nextConsensusVersionRound)
          ..add('nextConsensusVersionSupported', nextConsensusVersionSupported)
          ..add('timeSinceLastRound', timeSinceLastRound))
        .toString();
  }
}

class NodeStatusBuilder implements Builder<NodeStatus, NodeStatusBuilder> {
  _$NodeStatus _$v;

  int _catchupTime;
  int get catchupTime => _$this._catchupTime;
  set catchupTime(int catchupTime) => _$this._catchupTime = catchupTime;

  bool _hasSyncedSinceStartup;
  bool get hasSyncedSinceStartup => _$this._hasSyncedSinceStartup;
  set hasSyncedSinceStartup(bool hasSyncedSinceStartup) =>
      _$this._hasSyncedSinceStartup = hasSyncedSinceStartup;

  String _lastConsensusVersion;
  String get lastConsensusVersion => _$this._lastConsensusVersion;
  set lastConsensusVersion(String lastConsensusVersion) =>
      _$this._lastConsensusVersion = lastConsensusVersion;

  int _lastRound;
  int get lastRound => _$this._lastRound;
  set lastRound(int lastRound) => _$this._lastRound = lastRound;

  String _nextConsensusVersion;
  String get nextConsensusVersion => _$this._nextConsensusVersion;
  set nextConsensusVersion(String nextConsensusVersion) =>
      _$this._nextConsensusVersion = nextConsensusVersion;

  int _nextConsensusVersionRound;
  int get nextConsensusVersionRound => _$this._nextConsensusVersionRound;
  set nextConsensusVersionRound(int nextConsensusVersionRound) =>
      _$this._nextConsensusVersionRound = nextConsensusVersionRound;

  bool _nextConsensusVersionSupported;
  bool get nextConsensusVersionSupported =>
      _$this._nextConsensusVersionSupported;
  set nextConsensusVersionSupported(bool nextConsensusVersionSupported) =>
      _$this._nextConsensusVersionSupported = nextConsensusVersionSupported;

  int _timeSinceLastRound;
  int get timeSinceLastRound => _$this._timeSinceLastRound;
  set timeSinceLastRound(int timeSinceLastRound) =>
      _$this._timeSinceLastRound = timeSinceLastRound;

  NodeStatusBuilder();

  NodeStatusBuilder get _$this {
    if (_$v != null) {
      _catchupTime = _$v.catchupTime;
      _hasSyncedSinceStartup = _$v.hasSyncedSinceStartup;
      _lastConsensusVersion = _$v.lastConsensusVersion;
      _lastRound = _$v.lastRound;
      _nextConsensusVersion = _$v.nextConsensusVersion;
      _nextConsensusVersionRound = _$v.nextConsensusVersionRound;
      _nextConsensusVersionSupported = _$v.nextConsensusVersionSupported;
      _timeSinceLastRound = _$v.timeSinceLastRound;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NodeStatus other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NodeStatus;
  }

  @override
  void update(void Function(NodeStatusBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NodeStatus build() {
    final _$result = _$v ??
        new _$NodeStatus._(
            catchupTime: catchupTime,
            hasSyncedSinceStartup: hasSyncedSinceStartup,
            lastConsensusVersion: lastConsensusVersion,
            lastRound: lastRound,
            nextConsensusVersion: nextConsensusVersion,
            nextConsensusVersionRound: nextConsensusVersionRound,
            nextConsensusVersionSupported: nextConsensusVersionSupported,
            timeSinceLastRound: timeSinceLastRound);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
