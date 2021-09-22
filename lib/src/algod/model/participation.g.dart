// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Participation> _$participationSerializer =
    _$ParticipationSerializer();

class _$ParticipationSerializer implements StructuredSerializer<Participation> {
  @override
  final Iterable<Type> types = const [Participation, _$Participation];
  @override
  final String wireName = 'Participation';

  @override
  Iterable<Object> serialize(Serializers serializers, Participation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.partpkb64;
    if (value != null) {
      result
        ..add('partpkb64')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.votefst;
    if (value != null) {
      result
        ..add('votefst')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.votekd;
    if (value != null) {
      result
        ..add('votekd')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.votelst;
    if (value != null) {
      result
        ..add('votelst')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.vrfpkb64;
    if (value != null) {
      result
        ..add('vrfpkb64')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Participation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ParticipationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'partpkb64':
          result.partpkb64 = serializers.deserialize(value,
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
        case 'votelst':
          result.votelst = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'vrfpkb64':
          result.vrfpkb64 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Participation extends Participation {
  @override
  final String partpkb64;
  @override
  final int votefst;
  @override
  final int votekd;
  @override
  final int votelst;
  @override
  final String vrfpkb64;

  factory _$Participation([void Function(ParticipationBuilder) updates]) =>
      (ParticipationBuilder()..update(updates)).build();

  _$Participation._(
      {this.partpkb64, this.votefst, this.votekd, this.votelst, this.vrfpkb64})
      : super._();

  @override
  Participation rebuild(void Function(ParticipationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParticipationBuilder toBuilder() => ParticipationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Participation &&
        partpkb64 == other.partpkb64 &&
        votefst == other.votefst &&
        votekd == other.votekd &&
        votelst == other.votelst &&
        vrfpkb64 == other.vrfpkb64;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, partpkb64.hashCode), votefst.hashCode),
                votekd.hashCode),
            votelst.hashCode),
        vrfpkb64.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Participation')
          ..add('partpkb64', partpkb64)
          ..add('votefst', votefst)
          ..add('votekd', votekd)
          ..add('votelst', votelst)
          ..add('vrfpkb64', vrfpkb64))
        .toString();
  }
}

class ParticipationBuilder
    implements Builder<Participation, ParticipationBuilder> {
  _$Participation _$v;

  String _partpkb64;
  String get partpkb64 => _$this._partpkb64;
  set partpkb64(String partpkb64) => _$this._partpkb64 = partpkb64;

  int _votefst;
  int get votefst => _$this._votefst;
  set votefst(int votefst) => _$this._votefst = votefst;

  int _votekd;
  int get votekd => _$this._votekd;
  set votekd(int votekd) => _$this._votekd = votekd;

  int _votelst;
  int get votelst => _$this._votelst;
  set votelst(int votelst) => _$this._votelst = votelst;

  String _vrfpkb64;
  String get vrfpkb64 => _$this._vrfpkb64;
  set vrfpkb64(String vrfpkb64) => _$this._vrfpkb64 = vrfpkb64;

  ParticipationBuilder();

  ParticipationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _partpkb64 = $v.partpkb64;
      _votefst = $v.votefst;
      _votekd = $v.votekd;
      _votelst = $v.votelst;
      _vrfpkb64 = $v.vrfpkb64;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Participation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Participation;
  }

  @override
  void update(void Function(ParticipationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Participation build() {
    final _$result = _$v ??
        _$Participation._(
            partpkb64: partpkb64,
            votefst: votefst,
            votekd: votekd,
            votelst: votelst,
            vrfpkb64: vrfpkb64);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
