// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Transaction> _$transactionSerializer = _$TransactionSerializer();

class _$TransactionSerializer implements StructuredSerializer<Transaction> {
  @override
  final Iterable<Type> types = const [Transaction, _$Transaction];
  @override
  final String wireName = 'Transaction';

  @override
  Iterable<Object> serialize(Serializers serializers, Transaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.curcfg;
    if (value != null) {
      result
        ..add('curcfg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AssetConfigTransactionType)));
    }
    value = object.curfrz;
    if (value != null) {
      result
        ..add('curfrz')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AssetFreezeTransactionType)));
    }
    value = object.curxfer;
    if (value != null) {
      result
        ..add('curxfer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AssetTransferTransactionType)));
    }
    value = object.fee;
    if (value != null) {
      result
        ..add('fee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.firstRound;
    if (value != null) {
      result
        ..add('first-round')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fromrewards;
    if (value != null) {
      result
        ..add('fromrewards')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.genesisID;
    if (value != null) {
      result
        ..add('genesisID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genesishashb64;
    if (value != null) {
      result
        ..add('genesishashb64')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.group;
    if (value != null) {
      result
        ..add('group')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.keyreg;
    if (value != null) {
      result
        ..add('keyreg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(KeyregTransactionType)));
    }
    value = object.lastRound;
    if (value != null) {
      result
        ..add('last-round')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lease;
    if (value != null) {
      result
        ..add('lease')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.noteb64;
    if (value != null) {
      result
        ..add('noteb64')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.payment;
    if (value != null) {
      result
        ..add('payment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PaymentTransactionType)));
    }
    value = object.poolerror;
    if (value != null) {
      result
        ..add('poolerror')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.round;
    if (value != null) {
      result
        ..add('round')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tx;
    if (value != null) {
      result
        ..add('tx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.txresults;
    if (value != null) {
      result
        ..add('txresults')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(TransactionResults)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Transaction deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'curcfg':
          result.curcfg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AssetConfigTransactionType))
              as AssetConfigTransactionType);
          break;
        case 'curfrz':
          result.curfrz.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AssetFreezeTransactionType))
              as AssetFreezeTransactionType);
          break;
        case 'curxfer':
          result.curxfer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AssetTransferTransactionType))
              as AssetTransferTransactionType);
          break;
        case 'fee':
          result.fee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'first-round':
          result.firstRound = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fromrewards':
          result.fromrewards = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'genesisID':
          result.genesisID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genesishashb64':
          result.genesishashb64 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'group':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'keyreg':
          result.keyreg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(KeyregTransactionType))
              as KeyregTransactionType);
          break;
        case 'last-round':
          result.lastRound = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lease':
          result.lease = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'noteb64':
          result.noteb64 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'payment':
          result.payment.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PaymentTransactionType))
              as PaymentTransactionType);
          break;
        case 'poolerror':
          result.poolerror = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'round':
          result.round = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'tx':
          result.tx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'txresults':
          result.txresults.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TransactionResults))
              as TransactionResults);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Transaction extends Transaction {
  @override
  final AssetConfigTransactionType curcfg;
  @override
  final AssetFreezeTransactionType curfrz;
  @override
  final AssetTransferTransactionType curxfer;
  @override
  final int fee;
  @override
  final int firstRound;
  @override
  final String from;
  @override
  final int fromrewards;
  @override
  final String genesisID;
  @override
  final String genesishashb64;
  @override
  final String group;
  @override
  final KeyregTransactionType keyreg;
  @override
  final int lastRound;
  @override
  final String lease;
  @override
  final String noteb64;
  @override
  final PaymentTransactionType payment;
  @override
  final String poolerror;
  @override
  final int round;
  @override
  final String tx;
  @override
  final TransactionResults txresults;
  @override
  final String type;

  factory _$Transaction([void Function(TransactionBuilder) updates]) =>
      (TransactionBuilder()..update(updates)).build();

  _$Transaction._(
      {this.curcfg,
      this.curfrz,
      this.curxfer,
      this.fee,
      this.firstRound,
      this.from,
      this.fromrewards,
      this.genesisID,
      this.genesishashb64,
      this.group,
      this.keyreg,
      this.lastRound,
      this.lease,
      this.noteb64,
      this.payment,
      this.poolerror,
      this.round,
      this.tx,
      this.txresults,
      this.type})
      : super._();

  @override
  Transaction rebuild(void Function(TransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionBuilder toBuilder() => TransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transaction &&
        curcfg == other.curcfg &&
        curfrz == other.curfrz &&
        curxfer == other.curxfer &&
        fee == other.fee &&
        firstRound == other.firstRound &&
        from == other.from &&
        fromrewards == other.fromrewards &&
        genesisID == other.genesisID &&
        genesishashb64 == other.genesishashb64 &&
        group == other.group &&
        keyreg == other.keyreg &&
        lastRound == other.lastRound &&
        lease == other.lease &&
        noteb64 == other.noteb64 &&
        payment == other.payment &&
        poolerror == other.poolerror &&
        round == other.round &&
        tx == other.tx &&
        txresults == other.txresults &&
        type == other.type;
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc(0, curcfg.hashCode),
                                                                                curfrz.hashCode),
                                                                            curxfer.hashCode),
                                                                        fee.hashCode),
                                                                    firstRound.hashCode),
                                                                from.hashCode),
                                                            fromrewards.hashCode),
                                                        genesisID.hashCode),
                                                    genesishashb64.hashCode),
                                                group.hashCode),
                                            keyreg.hashCode),
                                        lastRound.hashCode),
                                    lease.hashCode),
                                noteb64.hashCode),
                            payment.hashCode),
                        poolerror.hashCode),
                    round.hashCode),
                tx.hashCode),
            txresults.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Transaction')
          ..add('curcfg', curcfg)
          ..add('curfrz', curfrz)
          ..add('curxfer', curxfer)
          ..add('fee', fee)
          ..add('firstRound', firstRound)
          ..add('from', from)
          ..add('fromrewards', fromrewards)
          ..add('genesisID', genesisID)
          ..add('genesishashb64', genesishashb64)
          ..add('group', group)
          ..add('keyreg', keyreg)
          ..add('lastRound', lastRound)
          ..add('lease', lease)
          ..add('noteb64', noteb64)
          ..add('payment', payment)
          ..add('poolerror', poolerror)
          ..add('round', round)
          ..add('tx', tx)
          ..add('txresults', txresults)
          ..add('type', type))
        .toString();
  }
}

class TransactionBuilder implements Builder<Transaction, TransactionBuilder> {
  _$Transaction _$v;

  AssetConfigTransactionTypeBuilder _curcfg;
  AssetConfigTransactionTypeBuilder get curcfg =>
      _$this._curcfg ??= AssetConfigTransactionTypeBuilder();
  set curcfg(AssetConfigTransactionTypeBuilder curcfg) =>
      _$this._curcfg = curcfg;

  AssetFreezeTransactionTypeBuilder _curfrz;
  AssetFreezeTransactionTypeBuilder get curfrz =>
      _$this._curfrz ??= AssetFreezeTransactionTypeBuilder();
  set curfrz(AssetFreezeTransactionTypeBuilder curfrz) =>
      _$this._curfrz = curfrz;

  AssetTransferTransactionTypeBuilder _curxfer;
  AssetTransferTransactionTypeBuilder get curxfer =>
      _$this._curxfer ??= AssetTransferTransactionTypeBuilder();
  set curxfer(AssetTransferTransactionTypeBuilder curxfer) =>
      _$this._curxfer = curxfer;

  int _fee;
  int get fee => _$this._fee;
  set fee(int fee) => _$this._fee = fee;

  int _firstRound;
  int get firstRound => _$this._firstRound;
  set firstRound(int firstRound) => _$this._firstRound = firstRound;

  String _from;
  String get from => _$this._from;
  set from(String from) => _$this._from = from;

  int _fromrewards;
  int get fromrewards => _$this._fromrewards;
  set fromrewards(int fromrewards) => _$this._fromrewards = fromrewards;

  String _genesisID;
  String get genesisID => _$this._genesisID;
  set genesisID(String genesisID) => _$this._genesisID = genesisID;

  String _genesishashb64;
  String get genesishashb64 => _$this._genesishashb64;
  set genesishashb64(String genesishashb64) =>
      _$this._genesishashb64 = genesishashb64;

  String _group;
  String get group => _$this._group;
  set group(String group) => _$this._group = group;

  KeyregTransactionTypeBuilder _keyreg;
  KeyregTransactionTypeBuilder get keyreg =>
      _$this._keyreg ??= KeyregTransactionTypeBuilder();
  set keyreg(KeyregTransactionTypeBuilder keyreg) => _$this._keyreg = keyreg;

  int _lastRound;
  int get lastRound => _$this._lastRound;
  set lastRound(int lastRound) => _$this._lastRound = lastRound;

  String _lease;
  String get lease => _$this._lease;
  set lease(String lease) => _$this._lease = lease;

  String _noteb64;
  String get noteb64 => _$this._noteb64;
  set noteb64(String noteb64) => _$this._noteb64 = noteb64;

  PaymentTransactionTypeBuilder _payment;
  PaymentTransactionTypeBuilder get payment =>
      _$this._payment ??= PaymentTransactionTypeBuilder();
  set payment(PaymentTransactionTypeBuilder payment) =>
      _$this._payment = payment;

  String _poolerror;
  String get poolerror => _$this._poolerror;
  set poolerror(String poolerror) => _$this._poolerror = poolerror;

  int _round;
  int get round => _$this._round;
  set round(int round) => _$this._round = round;

  String _tx;
  String get tx => _$this._tx;
  set tx(String tx) => _$this._tx = tx;

  TransactionResultsBuilder _txresults;
  TransactionResultsBuilder get txresults =>
      _$this._txresults ??= TransactionResultsBuilder();
  set txresults(TransactionResultsBuilder txresults) =>
      _$this._txresults = txresults;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  TransactionBuilder();

  TransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _curcfg = $v.curcfg?.toBuilder();
      _curfrz = $v.curfrz?.toBuilder();
      _curxfer = $v.curxfer?.toBuilder();
      _fee = $v.fee;
      _firstRound = $v.firstRound;
      _from = $v.from;
      _fromrewards = $v.fromrewards;
      _genesisID = $v.genesisID;
      _genesishashb64 = $v.genesishashb64;
      _group = $v.group;
      _keyreg = $v.keyreg?.toBuilder();
      _lastRound = $v.lastRound;
      _lease = $v.lease;
      _noteb64 = $v.noteb64;
      _payment = $v.payment?.toBuilder();
      _poolerror = $v.poolerror;
      _round = $v.round;
      _tx = $v.tx;
      _txresults = $v.txresults?.toBuilder();
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transaction;
  }

  @override
  void update(void Function(TransactionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Transaction build() {
    _$Transaction _$result;
    try {
      _$result = _$v ??
          _$Transaction._(
              curcfg: _curcfg?.build(),
              curfrz: _curfrz?.build(),
              curxfer: _curxfer?.build(),
              fee: fee,
              firstRound: firstRound,
              from: from,
              fromrewards: fromrewards,
              genesisID: genesisID,
              genesishashb64: genesishashb64,
              group: group,
              keyreg: _keyreg?.build(),
              lastRound: lastRound,
              lease: lease,
              noteb64: noteb64,
              payment: _payment?.build(),
              poolerror: poolerror,
              round: round,
              tx: tx,
              txresults: _txresults?.build(),
              type: type);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'curcfg';
        _curcfg?.build();
        _$failedField = 'curfrz';
        _curfrz?.build();
        _$failedField = 'curxfer';
        _curxfer?.build();

        _$failedField = 'keyreg';
        _keyreg?.build();

        _$failedField = 'payment';
        _payment?.build();

        _$failedField = 'txresults';
        _txresults?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'Transaction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
