// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Asset> _$assetSerializer = _$AssetSerializer();

class _$AssetSerializer implements StructuredSerializer<Asset> {
  @override
  final Iterable<Type> types = const [Asset, _$Asset];
  @override
  final String wireName = 'Asset';

  @override
  Iterable<Object> serialize(Serializers serializers, Asset object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.assetIndex != null) {
      result
        ..add('AssetIndex')
        ..add(serializers.serialize(object.assetIndex,
            specifiedType: const FullType(int)));
    }
    if (object.assetParams != null) {
      result
        ..add('AssetParams')
        ..add(serializers.serialize(object.assetParams,
            specifiedType: const FullType(AssetParams)));
    }
    return result;
  }

  @override
  Asset deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'AssetIndex':
          result.assetIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'AssetParams':
          result.assetParams.replace(serializers.deserialize(value,
              specifiedType: const FullType(AssetParams)) as AssetParams);
          break;
      }
    }

    return result.build();
  }
}

class _$Asset extends Asset {
  @override
  final int assetIndex;
  @override
  final AssetParams assetParams;

  factory _$Asset([void Function(AssetBuilder) updates]) =>
      (AssetBuilder()..update(updates)).build();

  _$Asset._({this.assetIndex, this.assetParams}) : super._();

  @override
  Asset rebuild(void Function(AssetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetBuilder toBuilder() => AssetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Asset &&
        assetIndex == other.assetIndex &&
        assetParams == other.assetParams;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, assetIndex.hashCode), assetParams.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Asset')
          ..add('assetIndex', assetIndex)
          ..add('assetParams', assetParams))
        .toString();
  }
}

class AssetBuilder implements Builder<Asset, AssetBuilder> {
  _$Asset _$v;

  int _assetIndex;
  int get assetIndex => _$this._assetIndex;
  set assetIndex(int assetIndex) => _$this._assetIndex = assetIndex;

  AssetParamsBuilder _assetParams;
  AssetParamsBuilder get assetParams =>
      _$this._assetParams ??= AssetParamsBuilder();
  set assetParams(AssetParamsBuilder assetParams) =>
      _$this._assetParams = assetParams;

  AssetBuilder();

  AssetBuilder get _$this {
    if (_$v != null) {
      _assetIndex = _$v.assetIndex;
      _assetParams = _$v.assetParams?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Asset other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$Asset;
  }

  @override
  void update(void Function(AssetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Asset build() {
    _$Asset _$result;
    try {
      _$result = _$v ??
          _$Asset._(assetIndex: assetIndex, assetParams: _assetParams?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'assetParams';
        _assetParams?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError('Asset', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
