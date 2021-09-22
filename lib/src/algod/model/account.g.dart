// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Account> _$accountSerializer = _$AccountSerializer();

class _$AccountSerializer implements StructuredSerializer<Account> {
  @override
  final Iterable<Type> types = const [Account, _$Account];
  @override
  final String wireName = 'Account';

  @override
  Iterable<Object> serialize(Serializers serializers, Account object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.amountwithoutpendingrewards;
    if (value != null) {
      result
        ..add('amountwithoutpendingrewards')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.assets;
    if (value != null) {
      result
        ..add('assets')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltMap, [FullType(String), FullType(AssetHolding)])));
    }
    value = object.participation;
    if (value != null) {
      result
        ..add('participation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Participation)));
    }
    value = object.pendingrewards;
    if (value != null) {
      result
        ..add('pendingrewards')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rewards;
    if (value != null) {
      result
        ..add('rewards')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.round;
    if (value != null) {
      result
        ..add('round')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thisassettotal;
    if (value != null) {
      result
        ..add('thisassettotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltMap, [FullType(String), FullType(AssetParams)])));
    }
    return result;
  }

  @override
  Account deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'amountwithoutpendingrewards':
          result.amountwithoutpendingrewards = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'assets':
          result.assets.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltMap, [FullType(String), FullType(AssetHolding)])));
          break;
        case 'participation':
          result.participation.replace(serializers.deserialize(value,
              specifiedType: const FullType(Participation)) as Participation);
          break;
        case 'pendingrewards':
          result.pendingrewards = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rewards':
          result.rewards = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'round':
          result.round = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thisassettotal':
          result.thisassettotal.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltMap, [FullType(String), FullType(AssetParams)])));
          break;
      }
    }

    return result.build();
  }
}

class _$Account extends Account {
  @override
  final String address;
  @override
  final int amount;
  @override
  final int amountwithoutpendingrewards;
  @override
  final BuiltMap<String, AssetHolding> assets;
  @override
  final Participation participation;
  @override
  final int pendingrewards;
  @override
  final int rewards;
  @override
  final int round;
  @override
  final String status;
  @override
  final BuiltMap<String, AssetParams> thisassettotal;

  factory _$Account([void Function(AccountBuilder) updates]) =>
      (AccountBuilder()..update(updates)).build();

  _$Account._(
      {this.address,
      this.amount,
      this.amountwithoutpendingrewards,
      this.assets,
      this.participation,
      this.pendingrewards,
      this.rewards,
      this.round,
      this.status,
      this.thisassettotal})
      : super._();

  @override
  Account rebuild(void Function(AccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountBuilder toBuilder() => AccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Account &&
        address == other.address &&
        amount == other.amount &&
        amountwithoutpendingrewards == other.amountwithoutpendingrewards &&
        assets == other.assets &&
        participation == other.participation &&
        pendingrewards == other.pendingrewards &&
        rewards == other.rewards &&
        round == other.round &&
        status == other.status &&
        thisassettotal == other.thisassettotal;
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
                                    $jc($jc(0, address.hashCode),
                                        amount.hashCode),
                                    amountwithoutpendingrewards.hashCode),
                                assets.hashCode),
                            participation.hashCode),
                        pendingrewards.hashCode),
                    rewards.hashCode),
                round.hashCode),
            status.hashCode),
        thisassettotal.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Account')
          ..add('address', address)
          ..add('amount', amount)
          ..add('amountwithoutpendingrewards', amountwithoutpendingrewards)
          ..add('assets', assets)
          ..add('participation', participation)
          ..add('pendingrewards', pendingrewards)
          ..add('rewards', rewards)
          ..add('round', round)
          ..add('status', status)
          ..add('thisassettotal', thisassettotal))
        .toString();
  }
}

class AccountBuilder implements Builder<Account, AccountBuilder> {
  _$Account _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  int _amountwithoutpendingrewards;
  int get amountwithoutpendingrewards => _$this._amountwithoutpendingrewards;
  set amountwithoutpendingrewards(int amountwithoutpendingrewards) =>
      _$this._amountwithoutpendingrewards = amountwithoutpendingrewards;

  MapBuilder<String, AssetHolding> _assets;
  MapBuilder<String, AssetHolding> get assets =>
      _$this._assets ??= MapBuilder<String, AssetHolding>();
  set assets(MapBuilder<String, AssetHolding> assets) =>
      _$this._assets = assets;

  ParticipationBuilder _participation;
  ParticipationBuilder get participation =>
      _$this._participation ??= ParticipationBuilder();
  set participation(ParticipationBuilder participation) =>
      _$this._participation = participation;

  int _pendingrewards;
  int get pendingrewards => _$this._pendingrewards;
  set pendingrewards(int pendingrewards) =>
      _$this._pendingrewards = pendingrewards;

  int _rewards;
  int get rewards => _$this._rewards;
  set rewards(int rewards) => _$this._rewards = rewards;

  int _round;
  int get round => _$this._round;
  set round(int round) => _$this._round = round;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  MapBuilder<String, AssetParams> _thisassettotal;
  MapBuilder<String, AssetParams> get thisassettotal =>
      _$this._thisassettotal ??= MapBuilder<String, AssetParams>();
  set thisassettotal(MapBuilder<String, AssetParams> thisassettotal) =>
      _$this._thisassettotal = thisassettotal;

  AccountBuilder();

  AccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _amount = $v.amount;
      _amountwithoutpendingrewards = $v.amountwithoutpendingrewards;
      _assets = $v.assets?.toBuilder();
      _participation = $v.participation?.toBuilder();
      _pendingrewards = $v.pendingrewards;
      _rewards = $v.rewards;
      _round = $v.round;
      _status = $v.status;
      _thisassettotal = $v.thisassettotal?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Account other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Account;
  }

  @override
  void update(void Function(AccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Account build() {
    _$Account _$result;
    try {
      _$result = _$v ??
          _$Account._(
              address: address,
              amount: amount,
              amountwithoutpendingrewards: amountwithoutpendingrewards,
              assets: _assets?.build(),
              participation: _participation?.build(),
              pendingrewards: pendingrewards,
              rewards: rewards,
              round: round,
              status: status,
              thisassettotal: _thisassettotal?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'assets';
        _assets?.build();
        _$failedField = 'participation';
        _participation?.build();

        _$failedField = 'thisassettotal';
        _thisassettotal?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'Account', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
