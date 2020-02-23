// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Supply> _$supplySerializer = new _$SupplySerializer();

class _$SupplySerializer implements StructuredSerializer<Supply> {
  @override
  final Iterable<Type> types = const [Supply, _$Supply];
  @override
  final String wireName = 'Supply';

  @override
  Iterable<Object> serialize(Serializers serializers, Supply object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.onlineMoney != null) {
      result
        ..add('onlineMoney')
        ..add(serializers.serialize(object.onlineMoney,
            specifiedType: const FullType(int)));
    }
    if (object.round != null) {
      result
        ..add('round')
        ..add(serializers.serialize(object.round,
            specifiedType: const FullType(int)));
    }
    if (object.totalMoney != null) {
      result
        ..add('totalMoney')
        ..add(serializers.serialize(object.totalMoney,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Supply deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupplyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'onlineMoney':
          result.onlineMoney = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'round':
          result.round = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'totalMoney':
          result.totalMoney = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Supply extends Supply {
  @override
  final int onlineMoney;
  @override
  final int round;
  @override
  final int totalMoney;

  factory _$Supply([void Function(SupplyBuilder) updates]) =>
      (new SupplyBuilder()..update(updates)).build();

  _$Supply._({this.onlineMoney, this.round, this.totalMoney}) : super._();

  @override
  Supply rebuild(void Function(SupplyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupplyBuilder toBuilder() => new SupplyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Supply &&
        onlineMoney == other.onlineMoney &&
        round == other.round &&
        totalMoney == other.totalMoney;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, onlineMoney.hashCode), round.hashCode),
        totalMoney.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Supply')
          ..add('onlineMoney', onlineMoney)
          ..add('round', round)
          ..add('totalMoney', totalMoney))
        .toString();
  }
}

class SupplyBuilder implements Builder<Supply, SupplyBuilder> {
  _$Supply _$v;

  int _onlineMoney;
  int get onlineMoney => _$this._onlineMoney;
  set onlineMoney(int onlineMoney) => _$this._onlineMoney = onlineMoney;

  int _round;
  int get round => _$this._round;
  set round(int round) => _$this._round = round;

  int _totalMoney;
  int get totalMoney => _$this._totalMoney;
  set totalMoney(int totalMoney) => _$this._totalMoney = totalMoney;

  SupplyBuilder();

  SupplyBuilder get _$this {
    if (_$v != null) {
      _onlineMoney = _$v.onlineMoney;
      _round = _$v.round;
      _totalMoney = _$v.totalMoney;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Supply other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Supply;
  }

  @override
  void update(void Function(SupplyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Supply build() {
    final _$result = _$v ??
        new _$Supply._(
            onlineMoney: onlineMoney, round: round, totalMoney: totalMoney);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
