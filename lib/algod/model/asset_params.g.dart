// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AssetParams> _$assetParamsSerializer = _$AssetParamsSerializer();

class _$AssetParamsSerializer implements StructuredSerializer<AssetParams> {
  @override
  final Iterable<Type> types = const [AssetParams, _$AssetParams];
  @override
  final String wireName = 'AssetParams';

  @override
  Iterable<Object> serialize(Serializers serializers, AssetParams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.assetname != null) {
      result
        ..add('assetname')
        ..add(serializers.serialize(object.assetname,
            specifiedType: const FullType(String)));
    }
    if (object.clawbackaddr != null) {
      result
        ..add('clawbackaddr')
        ..add(serializers.serialize(object.clawbackaddr,
            specifiedType: const FullType(String)));
    }
    if (object.creator != null) {
      result
        ..add('creator')
        ..add(serializers.serialize(object.creator,
            specifiedType: const FullType(String)));
    }
    if (object.decimals != null) {
      result
        ..add('decimals')
        ..add(serializers.serialize(object.decimals,
            specifiedType: const FullType(int)));
    }
    if (object.defaultfrozen != null) {
      result
        ..add('defaultfrozen')
        ..add(serializers.serialize(object.defaultfrozen,
            specifiedType: const FullType(bool)));
    }
    if (object.freezeaddr != null) {
      result
        ..add('freezeaddr')
        ..add(serializers.serialize(object.freezeaddr,
            specifiedType: const FullType(String)));
    }
    if (object.managerkey != null) {
      result
        ..add('managerkey')
        ..add(serializers.serialize(object.managerkey,
            specifiedType: const FullType(String)));
    }
    if (object.metadatahash != null) {
      result
        ..add('metadatahash')
        ..add(serializers.serialize(object.metadatahash,
            specifiedType: const FullType(String)));
    }
    if (object.reserveaddr != null) {
      result
        ..add('reserveaddr')
        ..add(serializers.serialize(object.reserveaddr,
            specifiedType: const FullType(String)));
    }
    if (object.total != null) {
      result
        ..add('total')
        ..add(serializers.serialize(object.total,
            specifiedType: const FullType(int)));
    }
    if (object.unitname != null) {
      result
        ..add('unitname')
        ..add(serializers.serialize(object.unitname,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AssetParams deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AssetParamsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'assetname':
          result.assetname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clawbackaddr':
          result.clawbackaddr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'creator':
          result.creator = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'decimals':
          result.decimals = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'defaultfrozen':
          result.defaultfrozen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'freezeaddr':
          result.freezeaddr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'managerkey':
          result.managerkey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'metadatahash':
          result.metadatahash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reserveaddr':
          result.reserveaddr = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'unitname':
          result.unitname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetParams extends AssetParams {
  @override
  final String assetname;
  @override
  final String clawbackaddr;
  @override
  final String creator;
  @override
  final int decimals;
  @override
  final bool defaultfrozen;
  @override
  final String freezeaddr;
  @override
  final String managerkey;
  @override
  final String metadatahash;
  @override
  final String reserveaddr;
  @override
  final int total;
  @override
  final String unitname;
  @override
  final String url;

  factory _$AssetParams([void Function(AssetParamsBuilder) updates]) =>
      (AssetParamsBuilder()..update(updates)).build();

  _$AssetParams._(
      {this.assetname,
      this.clawbackaddr,
      this.creator,
      this.decimals,
      this.defaultfrozen,
      this.freezeaddr,
      this.managerkey,
      this.metadatahash,
      this.reserveaddr,
      this.total,
      this.unitname,
      this.url})
      : super._();

  @override
  AssetParams rebuild(void Function(AssetParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetParamsBuilder toBuilder() => AssetParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetParams &&
        assetname == other.assetname &&
        clawbackaddr == other.clawbackaddr &&
        creator == other.creator &&
        decimals == other.decimals &&
        defaultfrozen == other.defaultfrozen &&
        freezeaddr == other.freezeaddr &&
        managerkey == other.managerkey &&
        metadatahash == other.metadatahash &&
        reserveaddr == other.reserveaddr &&
        total == other.total &&
        unitname == other.unitname &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, assetname.hashCode),
                                                clawbackaddr.hashCode),
                                            creator.hashCode),
                                        decimals.hashCode),
                                    defaultfrozen.hashCode),
                                freezeaddr.hashCode),
                            managerkey.hashCode),
                        metadatahash.hashCode),
                    reserveaddr.hashCode),
                total.hashCode),
            unitname.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetParams')
          ..add('assetname', assetname)
          ..add('clawbackaddr', clawbackaddr)
          ..add('creator', creator)
          ..add('decimals', decimals)
          ..add('defaultfrozen', defaultfrozen)
          ..add('freezeaddr', freezeaddr)
          ..add('managerkey', managerkey)
          ..add('metadatahash', metadatahash)
          ..add('reserveaddr', reserveaddr)
          ..add('total', total)
          ..add('unitname', unitname)
          ..add('url', url))
        .toString();
  }
}

class AssetParamsBuilder implements Builder<AssetParams, AssetParamsBuilder> {
  _$AssetParams _$v;

  String _assetname;
  String get assetname => _$this._assetname;
  set assetname(String assetname) => _$this._assetname = assetname;

  String _clawbackaddr;
  String get clawbackaddr => _$this._clawbackaddr;
  set clawbackaddr(String clawbackaddr) => _$this._clawbackaddr = clawbackaddr;

  String _creator;
  String get creator => _$this._creator;
  set creator(String creator) => _$this._creator = creator;

  int _decimals;
  int get decimals => _$this._decimals;
  set decimals(int decimals) => _$this._decimals = decimals;

  bool _defaultfrozen;
  bool get defaultfrozen => _$this._defaultfrozen;
  set defaultfrozen(bool defaultfrozen) =>
      _$this._defaultfrozen = defaultfrozen;

  String _freezeaddr;
  String get freezeaddr => _$this._freezeaddr;
  set freezeaddr(String freezeaddr) => _$this._freezeaddr = freezeaddr;

  String _managerkey;
  String get managerkey => _$this._managerkey;
  set managerkey(String managerkey) => _$this._managerkey = managerkey;

  String _metadatahash;
  String get metadatahash => _$this._metadatahash;
  set metadatahash(String metadatahash) => _$this._metadatahash = metadatahash;

  String _reserveaddr;
  String get reserveaddr => _$this._reserveaddr;
  set reserveaddr(String reserveaddr) => _$this._reserveaddr = reserveaddr;

  int _total;
  int get total => _$this._total;
  set total(int total) => _$this._total = total;

  String _unitname;
  String get unitname => _$this._unitname;
  set unitname(String unitname) => _$this._unitname = unitname;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  AssetParamsBuilder();

  AssetParamsBuilder get _$this {
    if (_$v != null) {
      _assetname = _$v.assetname;
      _clawbackaddr = _$v.clawbackaddr;
      _creator = _$v.creator;
      _decimals = _$v.decimals;
      _defaultfrozen = _$v.defaultfrozen;
      _freezeaddr = _$v.freezeaddr;
      _managerkey = _$v.managerkey;
      _metadatahash = _$v.metadatahash;
      _reserveaddr = _$v.reserveaddr;
      _total = _$v.total;
      _unitname = _$v.unitname;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetParams other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$AssetParams;
  }

  @override
  void update(void Function(AssetParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetParams build() {
    final _$result = _$v ??
        _$AssetParams._(
            assetname: assetname,
            clawbackaddr: clawbackaddr,
            creator: creator,
            decimals: decimals,
            defaultfrozen: defaultfrozen,
            freezeaddr: freezeaddr,
            managerkey: managerkey,
            metadatahash: metadatahash,
            reserveaddr: reserveaddr,
            total: total,
            unitname: unitname,
            url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
