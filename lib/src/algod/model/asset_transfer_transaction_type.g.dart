// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_transfer_transaction_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetTransferTransactionType>
    _$assetTransferTransactionTypeSerializer =
    _$AssetTransferTransactionTypeSerializer();

class _$AssetTransferTransactionTypeSerializer
    implements StructuredSerializer<AssetTransferTransactionType> {
  @override
  final Iterable<Type> types = const [
    AssetTransferTransactionType,
    _$AssetTransferTransactionType
  ];
  @override
  final String wireName = 'AssetTransferTransactionType';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AssetTransferTransactionType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.amt;
    if (value != null) {
      result
        ..add('amt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.closeto;
    if (value != null) {
      result
        ..add('closeto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rcv;
    if (value != null) {
      result
        ..add('rcv')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.snd;
    if (value != null) {
      result
        ..add('snd')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AssetTransferTransactionType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetTransferTransactionTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'amt':
          result.amt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'closeto':
          result.closeto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rcv':
          result.rcv = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'snd':
          result.snd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetTransferTransactionType extends AssetTransferTransactionType {
  @override
  final int amt;
  @override
  final String closeto;
  @override
  final int id;
  @override
  final String rcv;
  @override
  final String snd;

  factory _$AssetTransferTransactionType(
          [void Function(AssetTransferTransactionTypeBuilder) updates]) =>
      (AssetTransferTransactionTypeBuilder()..update(updates)).build();

  _$AssetTransferTransactionType._(
      {this.amt, this.closeto, this.id, this.rcv, this.snd})
      : super._();

  @override
  AssetTransferTransactionType rebuild(
          void Function(AssetTransferTransactionTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetTransferTransactionTypeBuilder toBuilder() =>
      AssetTransferTransactionTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetTransferTransactionType &&
        amt == other.amt &&
        closeto == other.closeto &&
        id == other.id &&
        rcv == other.rcv &&
        snd == other.snd;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, amt.hashCode), closeto.hashCode), id.hashCode),
            rcv.hashCode),
        snd.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetTransferTransactionType')
          ..add('amt', amt)
          ..add('closeto', closeto)
          ..add('id', id)
          ..add('rcv', rcv)
          ..add('snd', snd))
        .toString();
  }
}

class AssetTransferTransactionTypeBuilder
    implements
        Builder<AssetTransferTransactionType,
            AssetTransferTransactionTypeBuilder> {
  _$AssetTransferTransactionType _$v;

  int _amt;
  int get amt => _$this._amt;
  set amt(int amt) => _$this._amt = amt;

  String _closeto;
  String get closeto => _$this._closeto;
  set closeto(String closeto) => _$this._closeto = closeto;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _rcv;
  String get rcv => _$this._rcv;
  set rcv(String rcv) => _$this._rcv = rcv;

  String _snd;
  String get snd => _$this._snd;
  set snd(String snd) => _$this._snd = snd;

  AssetTransferTransactionTypeBuilder();

  AssetTransferTransactionTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amt = $v.amt;
      _closeto = $v.closeto;
      _id = $v.id;
      _rcv = $v.rcv;
      _snd = $v.snd;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetTransferTransactionType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetTransferTransactionType;
  }

  @override
  void update(void Function(AssetTransferTransactionTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetTransferTransactionType build() {
    final _$result = _$v ??
        _$AssetTransferTransactionType._(
            amt: amt, closeto: closeto, id: id, rcv: rcv, snd: snd);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
