// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multisig_subsig.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MultisigSubsig> _$multisigSubsigSerializer =
    _$MultisigSubsigSerializer();

class _$MultisigSubsigSerializer
    implements StructuredSerializer<MultisigSubsig> {
  @override
  final Iterable<Type> types = const [MultisigSubsig, _$MultisigSubsig];
  @override
  final String wireName = 'MultisigSubsig';

  @override
  Iterable<Object> serialize(Serializers serializers, MultisigSubsig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.key;
    if (value != null) {
      result
        ..add('pk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sig;
    if (value != null) {
      result
        ..add('s')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MultisigSubsig deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MultisigSubsigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'pk':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 's':
          result.sig = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MultisigSubsig extends MultisigSubsig {
  @override
  final String key;
  @override
  final String sig;

  factory _$MultisigSubsig([void Function(MultisigSubsigBuilder) updates]) =>
      (MultisigSubsigBuilder()..update(updates)).build();

  _$MultisigSubsig._({this.key, this.sig}) : super._();

  @override
  MultisigSubsig rebuild(void Function(MultisigSubsigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MultisigSubsigBuilder toBuilder() => MultisigSubsigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MultisigSubsig && key == other.key && sig == other.sig;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), sig.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MultisigSubsig')
          ..add('key', key)
          ..add('sig', sig))
        .toString();
  }
}

class MultisigSubsigBuilder
    implements Builder<MultisigSubsig, MultisigSubsigBuilder> {
  _$MultisigSubsig _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  String _sig;
  String get sig => _$this._sig;
  set sig(String sig) => _$this._sig = sig;

  MultisigSubsigBuilder();

  MultisigSubsigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _sig = $v.sig;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MultisigSubsig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MultisigSubsig;
  }

  @override
  void update(void Function(MultisigSubsigBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MultisigSubsig build() {
    final _$result = _$v ?? _$MultisigSubsig._(key: key, sig: sig);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
