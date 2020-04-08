// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multisig_subsig.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MultisigSubsig> _$multisigSubsigSerializer =
    new _$MultisigSubsigSerializer();

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
    if (object.key != null) {
      result
        ..add('Key')
        ..add(serializers.serialize(object.key,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.sig != null) {
      result
        ..add('Sig')
        ..add(serializers.serialize(object.sig,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    return result;
  }

  @override
  MultisigSubsig deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MultisigSubsigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Key':
          result.key.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'Sig':
          result.sig.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MultisigSubsig extends MultisigSubsig {
  @override
  final BuiltList<int> key;
  @override
  final BuiltList<int> sig;

  factory _$MultisigSubsig([void Function(MultisigSubsigBuilder) updates]) =>
      (new MultisigSubsigBuilder()..update(updates)).build();

  _$MultisigSubsig._({this.key, this.sig}) : super._();

  @override
  MultisigSubsig rebuild(void Function(MultisigSubsigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MultisigSubsigBuilder toBuilder() =>
      new MultisigSubsigBuilder()..replace(this);

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

  ListBuilder<int> _key;
  ListBuilder<int> get key => _$this._key ??= new ListBuilder<int>();
  set key(ListBuilder<int> key) => _$this._key = key;

  ListBuilder<int> _sig;
  ListBuilder<int> get sig => _$this._sig ??= new ListBuilder<int>();
  set sig(ListBuilder<int> sig) => _$this._sig = sig;

  MultisigSubsigBuilder();

  MultisigSubsigBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key?.toBuilder();
      _sig = _$v.sig?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MultisigSubsig other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MultisigSubsig;
  }

  @override
  void update(void Function(MultisigSubsigBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MultisigSubsig build() {
    _$MultisigSubsig _$result;
    try {
      _$result =
          _$v ?? new _$MultisigSubsig._(key: _key?.build(), sig: _sig?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'key';
        _key?.build();
        _$failedField = 'sig';
        _sig?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MultisigSubsig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
