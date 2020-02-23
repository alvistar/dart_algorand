// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Block> _$blockSerializer = new _$BlockSerializer();

class _$BlockSerializer implements StructuredSerializer<Block> {
  @override
  final Iterable<Type> types = const [Block, _$Block];
  @override
  final String wireName = 'Block';

  @override
  Iterable<Object> serialize(Serializers serializers, Block object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.currentProtocol != null) {
      result
        ..add('currentProtocol')
        ..add(serializers.serialize(object.currentProtocol,
            specifiedType: const FullType(String)));
    }
    if (object.frac != null) {
      result
        ..add('frac')
        ..add(serializers.serialize(object.frac,
            specifiedType: const FullType(int)));
    }
    if (object.hash != null) {
      result
        ..add('hash')
        ..add(serializers.serialize(object.hash,
            specifiedType: const FullType(String)));
    }
    if (object.nextProtocol != null) {
      result
        ..add('nextProtocol')
        ..add(serializers.serialize(object.nextProtocol,
            specifiedType: const FullType(String)));
    }
    if (object.nextProtocolApprovals != null) {
      result
        ..add('nextProtocolApprovals')
        ..add(serializers.serialize(object.nextProtocolApprovals,
            specifiedType: const FullType(int)));
    }
    if (object.nextProtocolSwitchOn != null) {
      result
        ..add('nextProtocolSwitchOn')
        ..add(serializers.serialize(object.nextProtocolSwitchOn,
            specifiedType: const FullType(int)));
    }
    if (object.nextProtocolVoteBefore != null) {
      result
        ..add('nextProtocolVoteBefore')
        ..add(serializers.serialize(object.nextProtocolVoteBefore,
            specifiedType: const FullType(int)));
    }
    if (object.period != null) {
      result
        ..add('period')
        ..add(serializers.serialize(object.period,
            specifiedType: const FullType(int)));
    }
    if (object.previousBlockHash != null) {
      result
        ..add('previousBlockHash')
        ..add(serializers.serialize(object.previousBlockHash,
            specifiedType: const FullType(String)));
    }
    if (object.proposer != null) {
      result
        ..add('proposer')
        ..add(serializers.serialize(object.proposer,
            specifiedType: const FullType(String)));
    }
    if (object.rate != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(object.rate,
            specifiedType: const FullType(int)));
    }
    if (object.reward != null) {
      result
        ..add('reward')
        ..add(serializers.serialize(object.reward,
            specifiedType: const FullType(int)));
    }
    if (object.round != null) {
      result
        ..add('round')
        ..add(serializers.serialize(object.round,
            specifiedType: const FullType(int)));
    }
    if (object.seed != null) {
      result
        ..add('seed')
        ..add(serializers.serialize(object.seed,
            specifiedType: const FullType(String)));
    }
    if (object.timestamp != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(object.timestamp,
            specifiedType: const FullType(int)));
    }
    if (object.txnRoot != null) {
      result
        ..add('txnRoot')
        ..add(serializers.serialize(object.txnRoot,
            specifiedType: const FullType(String)));
    }
    if (object.txns != null) {
      result
        ..add('txns')
        ..add(serializers.serialize(object.txns,
            specifiedType: const FullType(TransactionList)));
    }
    if (object.upgradeApprove != null) {
      result
        ..add('upgradeApprove')
        ..add(serializers.serialize(object.upgradeApprove,
            specifiedType: const FullType(bool)));
    }
    if (object.upgradePropose != null) {
      result
        ..add('upgradePropose')
        ..add(serializers.serialize(object.upgradePropose,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Block deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BlockBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentProtocol':
          result.currentProtocol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'frac':
          result.frac = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nextProtocol':
          result.nextProtocol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nextProtocolApprovals':
          result.nextProtocolApprovals = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nextProtocolSwitchOn':
          result.nextProtocolSwitchOn = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nextProtocolVoteBefore':
          result.nextProtocolVoteBefore = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'period':
          result.period = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'previousBlockHash':
          result.previousBlockHash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'proposer':
          result.proposer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'reward':
          result.reward = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'round':
          result.round = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'seed':
          result.seed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'txnRoot':
          result.txnRoot = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'txns':
          result.txns.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TransactionList))
              as TransactionList);
          break;
        case 'upgradeApprove':
          result.upgradeApprove = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'upgradePropose':
          result.upgradePropose = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Block extends Block {
  @override
  final String currentProtocol;
  @override
  final int frac;
  @override
  final String hash;
  @override
  final String nextProtocol;
  @override
  final int nextProtocolApprovals;
  @override
  final int nextProtocolSwitchOn;
  @override
  final int nextProtocolVoteBefore;
  @override
  final int period;
  @override
  final String previousBlockHash;
  @override
  final String proposer;
  @override
  final int rate;
  @override
  final int reward;
  @override
  final int round;
  @override
  final String seed;
  @override
  final int timestamp;
  @override
  final String txnRoot;
  @override
  final TransactionList txns;
  @override
  final bool upgradeApprove;
  @override
  final String upgradePropose;

  factory _$Block([void Function(BlockBuilder) updates]) =>
      (new BlockBuilder()..update(updates)).build();

  _$Block._(
      {this.currentProtocol,
      this.frac,
      this.hash,
      this.nextProtocol,
      this.nextProtocolApprovals,
      this.nextProtocolSwitchOn,
      this.nextProtocolVoteBefore,
      this.period,
      this.previousBlockHash,
      this.proposer,
      this.rate,
      this.reward,
      this.round,
      this.seed,
      this.timestamp,
      this.txnRoot,
      this.txns,
      this.upgradeApprove,
      this.upgradePropose})
      : super._();

  @override
  Block rebuild(void Function(BlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlockBuilder toBuilder() => new BlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Block &&
        currentProtocol == other.currentProtocol &&
        frac == other.frac &&
        hash == other.hash &&
        nextProtocol == other.nextProtocol &&
        nextProtocolApprovals == other.nextProtocolApprovals &&
        nextProtocolSwitchOn == other.nextProtocolSwitchOn &&
        nextProtocolVoteBefore == other.nextProtocolVoteBefore &&
        period == other.period &&
        previousBlockHash == other.previousBlockHash &&
        proposer == other.proposer &&
        rate == other.rate &&
        reward == other.reward &&
        round == other.round &&
        seed == other.seed &&
        timestamp == other.timestamp &&
        txnRoot == other.txnRoot &&
        txns == other.txns &&
        upgradeApprove == other.upgradeApprove &&
        upgradePropose == other.upgradePropose;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                currentProtocol
                                                                                    .hashCode),
                                                                            frac
                                                                                .hashCode),
                                                                        hash
                                                                            .hashCode),
                                                                    nextProtocol
                                                                        .hashCode),
                                                                nextProtocolApprovals
                                                                    .hashCode),
                                                            nextProtocolSwitchOn
                                                                .hashCode),
                                                        nextProtocolVoteBefore
                                                            .hashCode),
                                                    period.hashCode),
                                                previousBlockHash.hashCode),
                                            proposer.hashCode),
                                        rate.hashCode),
                                    reward.hashCode),
                                round.hashCode),
                            seed.hashCode),
                        timestamp.hashCode),
                    txnRoot.hashCode),
                txns.hashCode),
            upgradeApprove.hashCode),
        upgradePropose.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Block')
          ..add('currentProtocol', currentProtocol)
          ..add('frac', frac)
          ..add('hash', hash)
          ..add('nextProtocol', nextProtocol)
          ..add('nextProtocolApprovals', nextProtocolApprovals)
          ..add('nextProtocolSwitchOn', nextProtocolSwitchOn)
          ..add('nextProtocolVoteBefore', nextProtocolVoteBefore)
          ..add('period', period)
          ..add('previousBlockHash', previousBlockHash)
          ..add('proposer', proposer)
          ..add('rate', rate)
          ..add('reward', reward)
          ..add('round', round)
          ..add('seed', seed)
          ..add('timestamp', timestamp)
          ..add('txnRoot', txnRoot)
          ..add('txns', txns)
          ..add('upgradeApprove', upgradeApprove)
          ..add('upgradePropose', upgradePropose))
        .toString();
  }
}

class BlockBuilder implements Builder<Block, BlockBuilder> {
  _$Block _$v;

  String _currentProtocol;
  String get currentProtocol => _$this._currentProtocol;
  set currentProtocol(String currentProtocol) =>
      _$this._currentProtocol = currentProtocol;

  int _frac;
  int get frac => _$this._frac;
  set frac(int frac) => _$this._frac = frac;

  String _hash;
  String get hash => _$this._hash;
  set hash(String hash) => _$this._hash = hash;

  String _nextProtocol;
  String get nextProtocol => _$this._nextProtocol;
  set nextProtocol(String nextProtocol) => _$this._nextProtocol = nextProtocol;

  int _nextProtocolApprovals;
  int get nextProtocolApprovals => _$this._nextProtocolApprovals;
  set nextProtocolApprovals(int nextProtocolApprovals) =>
      _$this._nextProtocolApprovals = nextProtocolApprovals;

  int _nextProtocolSwitchOn;
  int get nextProtocolSwitchOn => _$this._nextProtocolSwitchOn;
  set nextProtocolSwitchOn(int nextProtocolSwitchOn) =>
      _$this._nextProtocolSwitchOn = nextProtocolSwitchOn;

  int _nextProtocolVoteBefore;
  int get nextProtocolVoteBefore => _$this._nextProtocolVoteBefore;
  set nextProtocolVoteBefore(int nextProtocolVoteBefore) =>
      _$this._nextProtocolVoteBefore = nextProtocolVoteBefore;

  int _period;
  int get period => _$this._period;
  set period(int period) => _$this._period = period;

  String _previousBlockHash;
  String get previousBlockHash => _$this._previousBlockHash;
  set previousBlockHash(String previousBlockHash) =>
      _$this._previousBlockHash = previousBlockHash;

  String _proposer;
  String get proposer => _$this._proposer;
  set proposer(String proposer) => _$this._proposer = proposer;

  int _rate;
  int get rate => _$this._rate;
  set rate(int rate) => _$this._rate = rate;

  int _reward;
  int get reward => _$this._reward;
  set reward(int reward) => _$this._reward = reward;

  int _round;
  int get round => _$this._round;
  set round(int round) => _$this._round = round;

  String _seed;
  String get seed => _$this._seed;
  set seed(String seed) => _$this._seed = seed;

  int _timestamp;
  int get timestamp => _$this._timestamp;
  set timestamp(int timestamp) => _$this._timestamp = timestamp;

  String _txnRoot;
  String get txnRoot => _$this._txnRoot;
  set txnRoot(String txnRoot) => _$this._txnRoot = txnRoot;

  TransactionListBuilder _txns;
  TransactionListBuilder get txns =>
      _$this._txns ??= new TransactionListBuilder();
  set txns(TransactionListBuilder txns) => _$this._txns = txns;

  bool _upgradeApprove;
  bool get upgradeApprove => _$this._upgradeApprove;
  set upgradeApprove(bool upgradeApprove) =>
      _$this._upgradeApprove = upgradeApprove;

  String _upgradePropose;
  String get upgradePropose => _$this._upgradePropose;
  set upgradePropose(String upgradePropose) =>
      _$this._upgradePropose = upgradePropose;

  BlockBuilder();

  BlockBuilder get _$this {
    if (_$v != null) {
      _currentProtocol = _$v.currentProtocol;
      _frac = _$v.frac;
      _hash = _$v.hash;
      _nextProtocol = _$v.nextProtocol;
      _nextProtocolApprovals = _$v.nextProtocolApprovals;
      _nextProtocolSwitchOn = _$v.nextProtocolSwitchOn;
      _nextProtocolVoteBefore = _$v.nextProtocolVoteBefore;
      _period = _$v.period;
      _previousBlockHash = _$v.previousBlockHash;
      _proposer = _$v.proposer;
      _rate = _$v.rate;
      _reward = _$v.reward;
      _round = _$v.round;
      _seed = _$v.seed;
      _timestamp = _$v.timestamp;
      _txnRoot = _$v.txnRoot;
      _txns = _$v.txns?.toBuilder();
      _upgradeApprove = _$v.upgradeApprove;
      _upgradePropose = _$v.upgradePropose;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Block other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Block;
  }

  @override
  void update(void Function(BlockBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Block build() {
    _$Block _$result;
    try {
      _$result = _$v ??
          new _$Block._(
              currentProtocol: currentProtocol,
              frac: frac,
              hash: hash,
              nextProtocol: nextProtocol,
              nextProtocolApprovals: nextProtocolApprovals,
              nextProtocolSwitchOn: nextProtocolSwitchOn,
              nextProtocolVoteBefore: nextProtocolVoteBefore,
              period: period,
              previousBlockHash: previousBlockHash,
              proposer: proposer,
              rate: rate,
              reward: reward,
              round: round,
              seed: seed,
              timestamp: timestamp,
              txnRoot: txnRoot,
              txns: _txns?.build(),
              upgradeApprove: upgradeApprove,
              upgradePropose: upgradePropose);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'txns';
        _txns?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Block', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
