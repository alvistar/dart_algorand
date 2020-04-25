// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyreg_transaction_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<KeyregTransactionType> _$keyregTransactionTypeSerializer =
    _$KeyregTransactionTypeSerializer();

class _$KeyregTransactionTypeSerializer
    implements StructuredSerializer<KeyregTransactionType> {
  @override
  final Iterable<Type> types = const [
    KeyregTransactionType,
    _$KeyregTransactionType
  ];
  @override
  final String wireName = 'KeyregTransactionType';

  @override
  Iterable<Object> serialize(
      Serializers serializers, KeyregTransactionType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.selkey != null) {
      result
        ..add('selkey')
        ..add(serializers.serialize(object.selkey,
            specifiedType: const FullType(String)));
    }
    if (object.votefst != null) {
      result
        ..add('votefst')
        ..add(serializers.serialize(object.votefst,
            specifiedType: const FullType(int)));
    }
    if (object.votekd != null) {
      result
        ..add('votekd')
        ..add(serializers.serialize(object.votekd,
            specifiedType: const FullType(int)));
    }
    if (object.votekey != null) {
      result
        ..add('votekey')
        ..add(serializers.serialize(object.votekey,
            specifiedType: const FullType(String)));
    }
    if (object.votelst != null) {
      result
        ..add('votelst')
        ..add(serializers.serialize(object.votelst,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  KeyregTransactionType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = KeyregTransactionTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'selkey':
          result.selkey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'votefst':
          result.votefst = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'votekd':
          result.votekd = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'votekey':
          result.votekey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'votelst':
          result.votelst = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$KeyregTransactionType extends KeyregTransactionType {
  @override
  final String selkey;
  @override
  final int votefst;
  @override
  final int votekd;
  @override
  final String votekey;
  @override
  final int votelst;

  factory _$KeyregTransactionType(
          [void Function(KeyregTransactionTypeBuilder) updates]) =>
      (KeyregTransactionTypeBuilder()..update(updates)).build();

  _$KeyregTransactionType._(
      {this.selkey, this.votefst, this.votekd, this.votekey, this.votelst})
      : super._();

  @override
  KeyregTransactionType rebuild(
          void Function(KeyregTransactionTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  KeyregTransactionTypeBuilder toBuilder() =>
      KeyregTransactionTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is KeyregTransactionType &&
        selkey == other.selkey &&
        votefst == other.votefst &&
        votekd == other.votekd &&
        votekey == other.votekey &&
        votelst == other.votelst;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, selkey.hashCode), votefst.hashCode),
                votekd.hashCode),
            votekey.hashCode),
        votelst.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('KeyregTransactionType')
          ..add('selkey', selkey)
          ..add('votefst', votefst)
          ..add('votekd', votekd)
          ..add('votekey', votekey)
          ..add('votelst', votelst))
        .toString();
  }
}

class KeyregTransactionTypeBuilder
    implements Builder<KeyregTransactionType, KeyregTransactionTypeBuilder> {
  _$KeyregTransactionType _$v;

  String _selkey;
  String get selkey => _$this._selkey;
  set selkey(String selkey) => _$this._selkey = selkey;

  int _votefst;
  int get votefst => _$this._votefst;
  set votefst(int votefst) => _$this._votefst = votefst;

  int _votekd;
  int get votekd => _$this._votekd;
  set votekd(int votekd) => _$this._votekd = votekd;

  String _votekey;
  String get votekey => _$this._votekey;
  set votekey(String votekey) => _$this._votekey = votekey;

  int _votelst;
  int get votelst => _$this._votelst;
  set votelst(int votelst) => _$this._votelst = votelst;

  KeyregTransactionTypeBuilder();

  KeyregTransactionTypeBuilder get _$this {
    if (_$v != null) {
      _selkey = _$v.selkey;
      _votefst = _$v.votefst;
      _votekd = _$v.votekd;
      _votekey = _$v.votekey;
      _votelst = _$v.votelst;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(KeyregTransactionType other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$KeyregTransactionType;
  }

  @override
  void update(void Function(KeyregTransactionTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$KeyregTransactionType build() {
    final _$result = _$v ??
        _$KeyregTransactionType._(
            selkey: selkey,
            votefst: votefst,
            votekd: votekd,
            votekey: votekey,
            votelst: votelst);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
