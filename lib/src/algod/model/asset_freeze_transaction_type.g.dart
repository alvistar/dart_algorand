// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_freeze_transaction_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetFreezeTransactionType> _$assetFreezeTransactionTypeSerializer =
    _$AssetFreezeTransactionTypeSerializer();

class _$AssetFreezeTransactionTypeSerializer
    implements StructuredSerializer<AssetFreezeTransactionType> {
  @override
  final Iterable<Type> types = const [
    AssetFreezeTransactionType,
    _$AssetFreezeTransactionType
  ];
  @override
  final String wireName = 'AssetFreezeTransactionType';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AssetFreezeTransactionType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.acct;
    if (value != null) {
      result
        ..add('acct')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.freeze;
    if (value != null) {
      result
        ..add('freeze')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AssetFreezeTransactionType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetFreezeTransactionTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'acct':
          result.acct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'freeze':
          result.freeze = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetFreezeTransactionType extends AssetFreezeTransactionType {
  @override
  final String acct;
  @override
  final bool freeze;
  @override
  final int id;

  factory _$AssetFreezeTransactionType(
          [void Function(AssetFreezeTransactionTypeBuilder) updates]) =>
      (AssetFreezeTransactionTypeBuilder()..update(updates)).build();

  _$AssetFreezeTransactionType._({this.acct, this.freeze, this.id}) : super._();

  @override
  AssetFreezeTransactionType rebuild(
          void Function(AssetFreezeTransactionTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetFreezeTransactionTypeBuilder toBuilder() =>
      AssetFreezeTransactionTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetFreezeTransactionType &&
        acct == other.acct &&
        freeze == other.freeze &&
        id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, acct.hashCode), freeze.hashCode), id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetFreezeTransactionType')
          ..add('acct', acct)
          ..add('freeze', freeze)
          ..add('id', id))
        .toString();
  }
}

class AssetFreezeTransactionTypeBuilder
    implements
        Builder<AssetFreezeTransactionType, AssetFreezeTransactionTypeBuilder> {
  _$AssetFreezeTransactionType _$v;

  String _acct;
  String get acct => _$this._acct;
  set acct(String acct) => _$this._acct = acct;

  bool _freeze;
  bool get freeze => _$this._freeze;
  set freeze(bool freeze) => _$this._freeze = freeze;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  AssetFreezeTransactionTypeBuilder();

  AssetFreezeTransactionTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _acct = $v.acct;
      _freeze = $v.freeze;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetFreezeTransactionType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetFreezeTransactionType;
  }

  @override
  void update(void Function(AssetFreezeTransactionTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetFreezeTransactionType build() {
    final _$result = _$v ??
        _$AssetFreezeTransactionType._(acct: acct, freeze: freeze, id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
