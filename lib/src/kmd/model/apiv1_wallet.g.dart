// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiv1_wallet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<APIV1Wallet> _$aPIV1WalletSerializer = _$APIV1WalletSerializer();

class _$APIV1WalletSerializer implements StructuredSerializer<APIV1Wallet> {
  @override
  final Iterable<Type> types = const [APIV1Wallet, _$APIV1Wallet];
  @override
  final String wireName = 'APIV1Wallet';

  @override
  Iterable<Object> serialize(Serializers serializers, APIV1Wallet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.driverName;
    if (value != null) {
      result
        ..add('driver_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.driverVersion;
    if (value != null) {
      result
        ..add('driver_version')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mnemonicUx;
    if (value != null) {
      result
        ..add('mnemonic_ux')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.supportedTxs;
    if (value != null) {
      result
        ..add('supported_txs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, [FullType(String)])));
    }
    return result;
  }

  @override
  APIV1Wallet deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = APIV1WalletBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
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
                  specifiedType: const FullType(BuiltList, [FullType(String)]))
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
      (APIV1WalletBuilder()..update(updates)).build();

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
  APIV1WalletBuilder toBuilder() => APIV1WalletBuilder()..replace(this);

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
      _$this._supportedTxs ??= ListBuilder<String>();
  set supportedTxs(ListBuilder<String> supportedTxs) =>
      _$this._supportedTxs = supportedTxs;

  APIV1WalletBuilder();

  APIV1WalletBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _driverName = $v.driverName;
      _driverVersion = $v.driverVersion;
      _id = $v.id;
      _mnemonicUx = $v.mnemonicUx;
      _name = $v.name;
      _supportedTxs = $v.supportedTxs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(APIV1Wallet other) {
    ArgumentError.checkNotNull(other, 'other');
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
          _$APIV1Wallet._(
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
        throw BuiltValueNestedFieldError(
            'APIV1Wallet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
