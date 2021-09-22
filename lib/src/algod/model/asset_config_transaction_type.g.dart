// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_config_transaction_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetConfigTransactionType> _$assetConfigTransactionTypeSerializer =
    _$AssetConfigTransactionTypeSerializer();

class _$AssetConfigTransactionTypeSerializer
    implements StructuredSerializer<AssetConfigTransactionType> {
  @override
  final Iterable<Type> types = const [
    AssetConfigTransactionType,
    _$AssetConfigTransactionType
  ];
  @override
  final String wireName = 'AssetConfigTransactionType';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AssetConfigTransactionType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.params;
    if (value != null) {
      result
        ..add('params')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AssetParams)));
    }
    return result;
  }

  @override
  AssetConfigTransactionType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetConfigTransactionTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'params':
          result.params.replace(serializers.deserialize(value,
              specifiedType: const FullType(AssetParams)) as AssetParams);
          break;
      }
    }

    return result.build();
  }
}

class _$AssetConfigTransactionType extends AssetConfigTransactionType {
  @override
  final int id;
  @override
  final AssetParams params;

  factory _$AssetConfigTransactionType(
          [void Function(AssetConfigTransactionTypeBuilder) updates]) =>
      (AssetConfigTransactionTypeBuilder()..update(updates)).build();

  _$AssetConfigTransactionType._({this.id, this.params}) : super._();

  @override
  AssetConfigTransactionType rebuild(
          void Function(AssetConfigTransactionTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetConfigTransactionTypeBuilder toBuilder() =>
      AssetConfigTransactionTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetConfigTransactionType &&
        id == other.id &&
        params == other.params;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), params.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetConfigTransactionType')
          ..add('id', id)
          ..add('params', params))
        .toString();
  }
}

class AssetConfigTransactionTypeBuilder
    implements
        Builder<AssetConfigTransactionType, AssetConfigTransactionTypeBuilder> {
  _$AssetConfigTransactionType _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  AssetParamsBuilder _params;
  AssetParamsBuilder get params => _$this._params ??= AssetParamsBuilder();
  set params(AssetParamsBuilder params) => _$this._params = params;

  AssetConfigTransactionTypeBuilder();

  AssetConfigTransactionTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _params = $v.params?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetConfigTransactionType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetConfigTransactionType;
  }

  @override
  void update(void Function(AssetConfigTransactionTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetConfigTransactionType build() {
    _$AssetConfigTransactionType _$result;
    try {
      _$result = _$v ??
          _$AssetConfigTransactionType._(id: id, params: _params?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'params';
        _params?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'AssetConfigTransactionType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
