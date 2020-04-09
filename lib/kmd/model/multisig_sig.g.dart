// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multisig_sig.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MultisigSig> _$multisigSigSerializer = new _$MultisigSigSerializer();

class _$MultisigSigSerializer implements StructuredSerializer<MultisigSig> {
  @override
  final Iterable<Type> types = const [MultisigSig, _$MultisigSig];
  @override
  final String wireName = 'MultisigSig';

  @override
  Iterable<Object> serialize(Serializers serializers, MultisigSig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.subsigs != null) {
      result
        ..add('subsig')
        ..add(serializers.serialize(object.subsigs,
            specifiedType: const FullType(
                BuiltList, const [const FullType(MultisigSubsig)])));
    }
    if (object.threshold != null) {
      result
        ..add('thr')
        ..add(serializers.serialize(object.threshold,
            specifiedType: const FullType(int)));
    }
    if (object.version != null) {
      result
        ..add('v')
        ..add(serializers.serialize(object.version,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MultisigSig deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MultisigSigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'subsig':
          result.subsigs.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MultisigSubsig)]))
              as BuiltList<Object>);
          break;
        case 'thr':
          result.threshold = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'v':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MultisigSig extends MultisigSig {
  @override
  final BuiltList<MultisigSubsig> subsigs;
  @override
  final int threshold;
  @override
  final int version;

  factory _$MultisigSig([void Function(MultisigSigBuilder) updates]) =>
      (new MultisigSigBuilder()..update(updates)).build();

  _$MultisigSig._({this.subsigs, this.threshold, this.version}) : super._();

  @override
  MultisigSig rebuild(void Function(MultisigSigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MultisigSigBuilder toBuilder() => new MultisigSigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MultisigSig &&
        subsigs == other.subsigs &&
        threshold == other.threshold &&
        version == other.version;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, subsigs.hashCode), threshold.hashCode), version.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MultisigSig')
          ..add('subsigs', subsigs)
          ..add('threshold', threshold)
          ..add('version', version))
        .toString();
  }
}

class MultisigSigBuilder implements Builder<MultisigSig, MultisigSigBuilder> {
  _$MultisigSig _$v;

  ListBuilder<MultisigSubsig> _subsigs;
  ListBuilder<MultisigSubsig> get subsigs =>
      _$this._subsigs ??= new ListBuilder<MultisigSubsig>();
  set subsigs(ListBuilder<MultisigSubsig> subsigs) => _$this._subsigs = subsigs;

  int _threshold;
  int get threshold => _$this._threshold;
  set threshold(int threshold) => _$this._threshold = threshold;

  int _version;
  int get version => _$this._version;
  set version(int version) => _$this._version = version;

  MultisigSigBuilder();

  MultisigSigBuilder get _$this {
    if (_$v != null) {
      _subsigs = _$v.subsigs?.toBuilder();
      _threshold = _$v.threshold;
      _version = _$v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MultisigSig other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MultisigSig;
  }

  @override
  void update(void Function(MultisigSigBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MultisigSig build() {
    _$MultisigSig _$result;
    try {
      _$result = _$v ??
          new _$MultisigSig._(
              subsigs: _subsigs?.build(),
              threshold: threshold,
              version: version);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subsigs';
        _subsigs?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MultisigSig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
