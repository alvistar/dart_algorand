// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionParams> _$transactionParamsSerializer =
    _$TransactionParamsSerializer();

class _$TransactionParamsSerializer
    implements StructuredSerializer<TransactionParams> {
  @override
  final Iterable<Type> types = const [TransactionParams, _$TransactionParams];
  @override
  final String wireName = 'TransactionParams';

  @override
  Iterable<Object> serialize(Serializers serializers, TransactionParams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.consensusVersion;
    if (value != null) {
      result
        ..add('consensusVersion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fee;
    if (value != null) {
      result
        ..add('fee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.genesisID;
    if (value != null) {
      result
        ..add('genesisID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genesishashb64;
    if (value != null) {
      result
        ..add('genesishashb64')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastRound;
    if (value != null) {
      result
        ..add('lastRound')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minFee;
    if (value != null) {
      result
        ..add('minFee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  TransactionParams deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TransactionParamsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'consensusVersion':
          result.consensusVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fee':
          result.fee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'genesisID':
          result.genesisID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genesishashb64':
          result.genesishashb64 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastRound':
          result.lastRound = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'minFee':
          result.minFee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionParams extends TransactionParams {
  @override
  final String consensusVersion;
  @override
  final int fee;
  @override
  final String genesisID;
  @override
  final String genesishashb64;
  @override
  final int lastRound;
  @override
  final int minFee;

  factory _$TransactionParams(
          [void Function(TransactionParamsBuilder) updates]) =>
      (TransactionParamsBuilder()..update(updates)).build();

  _$TransactionParams._(
      {this.consensusVersion,
      this.fee,
      this.genesisID,
      this.genesishashb64,
      this.lastRound,
      this.minFee})
      : super._();

  @override
  TransactionParams rebuild(void Function(TransactionParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionParamsBuilder toBuilder() =>
      TransactionParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionParams &&
        consensusVersion == other.consensusVersion &&
        fee == other.fee &&
        genesisID == other.genesisID &&
        genesishashb64 == other.genesishashb64 &&
        lastRound == other.lastRound &&
        minFee == other.minFee;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, consensusVersion.hashCode), fee.hashCode),
                    genesisID.hashCode),
                genesishashb64.hashCode),
            lastRound.hashCode),
        minFee.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionParams')
          ..add('consensusVersion', consensusVersion)
          ..add('fee', fee)
          ..add('genesisID', genesisID)
          ..add('genesishashb64', genesishashb64)
          ..add('lastRound', lastRound)
          ..add('minFee', minFee))
        .toString();
  }
}

class TransactionParamsBuilder
    implements Builder<TransactionParams, TransactionParamsBuilder> {
  _$TransactionParams _$v;

  String _consensusVersion;
  String get consensusVersion => _$this._consensusVersion;
  set consensusVersion(String consensusVersion) =>
      _$this._consensusVersion = consensusVersion;

  int _fee;
  int get fee => _$this._fee;
  set fee(int fee) => _$this._fee = fee;

  String _genesisID;
  String get genesisID => _$this._genesisID;
  set genesisID(String genesisID) => _$this._genesisID = genesisID;

  String _genesishashb64;
  String get genesishashb64 => _$this._genesishashb64;
  set genesishashb64(String genesishashb64) =>
      _$this._genesishashb64 = genesishashb64;

  int _lastRound;
  int get lastRound => _$this._lastRound;
  set lastRound(int lastRound) => _$this._lastRound = lastRound;

  int _minFee;
  int get minFee => _$this._minFee;
  set minFee(int minFee) => _$this._minFee = minFee;

  TransactionParamsBuilder();

  TransactionParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _consensusVersion = $v.consensusVersion;
      _fee = $v.fee;
      _genesisID = $v.genesisID;
      _genesishashb64 = $v.genesishashb64;
      _lastRound = $v.lastRound;
      _minFee = $v.minFee;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionParams;
  }

  @override
  void update(void Function(TransactionParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionParams build() {
    final _$result = _$v ??
        _$TransactionParams._(
            consensusVersion: consensusVersion,
            fee: fee,
            genesisID: genesisID,
            genesishashb64: genesishashb64,
            lastRound: lastRound,
            minFee: minFee);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
