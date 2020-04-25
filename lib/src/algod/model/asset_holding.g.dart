// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_holding.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetHolding> _$assetHoldingSerializer = _$AssetHoldingSerializer();

class _$AssetHoldingSerializer implements StructuredSerializer<AssetHolding> {
  @override
  final Iterable<Type> types = const [AssetHolding, _$AssetHolding];
  @override
  final String wireName = 'AssetHolding';

  @override
  Iterable<Object> serialize(Serializers serializers, AssetHolding object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'creator',
      serializers.serialize(object.creator,
          specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount, specifiedType: const FullType(int)),
      'frozen',
      serializers.serialize(object.frozen, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AssetHolding deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetHoldingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'creator':
          result.creator = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'frozen':
          result.frozen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetHolding extends AssetHolding {
  @override
  final String creator;
  @override
  final int amount;
  @override
  final bool frozen;

  factory _$AssetHolding([void Function(AssetHoldingBuilder) updates]) =>
      (AssetHoldingBuilder()..update(updates)).build();

  _$AssetHolding._({this.creator, this.amount, this.frozen}) : super._() {
    if (creator == null) {
      throw BuiltValueNullFieldError('AssetHolding', 'creator');
    }
    if (amount == null) {
      throw BuiltValueNullFieldError('AssetHolding', 'amount');
    }
    if (frozen == null) {
      throw BuiltValueNullFieldError('AssetHolding', 'frozen');
    }
  }

  @override
  AssetHolding rebuild(void Function(AssetHoldingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetHoldingBuilder toBuilder() => AssetHoldingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetHolding &&
        creator == other.creator &&
        amount == other.amount &&
        frozen == other.frozen;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, creator.hashCode), amount.hashCode), frozen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetHolding')
          ..add('creator', creator)
          ..add('amount', amount)
          ..add('frozen', frozen))
        .toString();
  }
}

class AssetHoldingBuilder
    implements Builder<AssetHolding, AssetHoldingBuilder> {
  _$AssetHolding _$v;

  String _creator;
  String get creator => _$this._creator;
  set creator(String creator) => _$this._creator = creator;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  bool _frozen;
  bool get frozen => _$this._frozen;
  set frozen(bool frozen) => _$this._frozen = frozen;

  AssetHoldingBuilder();

  AssetHoldingBuilder get _$this {
    if (_$v != null) {
      _creator = _$v.creator;
      _amount = _$v.amount;
      _frozen = _$v.frozen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetHolding other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$AssetHolding;
  }

  @override
  void update(void Function(AssetHoldingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetHolding build() {
    final _$result = _$v ??
        _$AssetHolding._(creator: creator, amount: amount, frozen: frozen);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
