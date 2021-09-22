// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetList> _$assetListSerializer = _$AssetListSerializer();

class _$AssetListSerializer implements StructuredSerializer<AssetList> {
  @override
  final Iterable<Type> types = const [AssetList, _$AssetList];
  @override
  final String wireName = 'AssetList';

  @override
  Iterable<Object> serialize(Serializers serializers, AssetList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.assets;
    if (value != null) {
      result
        ..add('assets')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(Asset)])));
    }
    return result;
  }

  @override
  AssetList deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'assets':
          result.assets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BuiltList, [FullType(Asset)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$AssetList extends AssetList {
  @override
  final BuiltList<Asset> assets;

  factory _$AssetList([void Function(AssetListBuilder) updates]) =>
      (AssetListBuilder()..update(updates)).build();

  _$AssetList._({this.assets}) : super._();

  @override
  AssetList rebuild(void Function(AssetListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetListBuilder toBuilder() => AssetListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetList && assets == other.assets;
  }

  @override
  int get hashCode {
    return $jf($jc(0, assets.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetList')..add('assets', assets))
        .toString();
  }
}

class AssetListBuilder implements Builder<AssetList, AssetListBuilder> {
  _$AssetList _$v;

  ListBuilder<Asset> _assets;
  ListBuilder<Asset> get assets => _$this._assets ??= ListBuilder<Asset>();
  set assets(ListBuilder<Asset> assets) => _$this._assets = assets;

  AssetListBuilder();

  AssetListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assets = $v.assets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssetList;
  }

  @override
  void update(void Function(AssetListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetList build() {
    _$AssetList _$result;
    try {
      _$result = _$v ?? _$AssetList._(assets: _assets?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'assets';
        _assets?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'AssetList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
