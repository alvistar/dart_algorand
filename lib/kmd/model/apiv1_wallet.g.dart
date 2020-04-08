// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_wallet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1Wallet> _$aPIV1WalletSerializer = new _$APIV1WalletSerializer();

class _$APIV1WalletSerializer implements StructuredSerializer<APIV1Wallet> {
  @override
  final Iterable<Type> types = const [APIV1Wallet, _$APIV1Wallet];
  @override
  final String wireName = 'APIV1Wallet';

  @override
  Iterable<Object> serialize(Serializers serializers, APIV1Wallet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.driverName != null) {
      result
        ..add('driver_name')
        ..add(serializers.serialize(object.driverName,
            specifiedType: const FullType(String)));
    }
    if (object.driverVersion != null) {
      result
        ..add('driver_version')
        ..add(serializers.serialize(object.driverVersion,
            specifiedType: const FullType(int)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.mnemonicUx != null) {
      result
        ..add('mnemonic_ux')
        ..add(serializers.serialize(object.mnemonicUx,
            specifiedType: const FullType(bool)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.supportedTxs != null) {
      result
        ..add('supported_txs')
        ..add(serializers.serialize(object.supportedTxs,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  APIV1Wallet deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new APIV1WalletBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'driver_name':
          result.driverName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'driver_version':
          result.driverVersion = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mnemonic_ux':
          result.mnemonicUx = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'supported_txs':
          result.supportedTxs.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$APIV1Wallet extends APIV1Wallet {
  @override
  final String driverName;
  @override
  final int driverVersion;
  @override
  final String id;
  @override
  final bool mnemonicUx;
  @override
  final String name;
  @override
  final BuiltList<String> supportedTxs;

  factory _$APIV1Wallet([void Function(APIV1WalletBuilder) updates]) =>
      (new APIV1WalletBuilder()..update(updates)).build();

  _$APIV1Wallet._(
      {this.driverName,
      this.driverVersion,
      this.id,
      this.mnemonicUx,
      this.name,
      this.supportedTxs})
      : super._();

  @override
  APIV1Wallet rebuild(void Function(APIV1WalletBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  APIV1WalletBuilder toBuilder() => new APIV1WalletBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is APIV1Wallet &&
        driverName == other.driverName &&
        driverVersion == other.driverVersion &&
        id == other.id &&
        mnemonicUx == other.mnemonicUx &&
        name == other.name &&
        supportedTxs == other.supportedTxs;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, driverName.hashCode), driverVersion.hashCode),
                    id.hashCode),
                mnemonicUx.hashCode),
            name.hashCode),
        supportedTxs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('APIV1Wallet')
          ..add('driverName', driverName)
          ..add('driverVersion', driverVersion)
          ..add('id', id)
          ..add('mnemonicUx', mnemonicUx)
          ..add('name', name)
          ..add('supportedTxs', supportedTxs))
        .toString();
  }
}

class APIV1WalletBuilder implements Builder<APIV1Wallet, APIV1WalletBuilder> {
  _$APIV1Wallet _$v;

  String _driverName;
  String get driverName => _$this._driverName;
  set driverName(String driverName) => _$this._driverName = driverName;

  int _driverVersion;
  int get driverVersion => _$this._driverVersion;
  set driverVersion(int driverVersion) => _$this._driverVersion = driverVersion;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  bool _mnemonicUx;
  bool get mnemonicUx => _$this._mnemonicUx;
  set mnemonicUx(bool mnemonicUx) => _$this._mnemonicUx = mnemonicUx;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<String> _supportedTxs;
  ListBuilder<String> get supportedTxs =>
      _$this._supportedTxs ??= new ListBuilder<String>();
  set supportedTxs(ListBuilder<String> supportedTxs) =>
      _$this._supportedTxs = supportedTxs;

  APIV1WalletBuilder();

  APIV1WalletBuilder get _$this {
    if (_$v != null) {
      _driverName = _$v.driverName;
      _driverVersion = _$v.driverVersion;
      _id = _$v.id;
      _mnemonicUx = _$v.mnemonicUx;
      _name = _$v.name;
      _supportedTxs = _$v.supportedTxs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1Wallet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$APIV1Wallet;
  }

  @override
  void update(void Function(APIV1WalletBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$APIV1Wallet build() {
    _$APIV1Wallet _$result;
    try {
      _$result = _$v ??
          new _$APIV1Wallet._(
              driverName: driverName,
              driverVersion: driverVersion,
              id: id,
              mnemonicUx: mnemonicUx,
              name: name,
              supportedTxs: _supportedTxs?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'supportedTxs';
        _supportedTxs?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'APIV1Wallet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
