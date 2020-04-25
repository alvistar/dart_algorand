// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_transaction_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentTransactionType> _$paymentTransactionTypeSerializer =
    _$PaymentTransactionTypeSerializer();

class _$PaymentTransactionTypeSerializer
    implements StructuredSerializer<PaymentTransactionType> {
  @override
  final Iterable<Type> types = const [
    PaymentTransactionType,
    _$PaymentTransactionType
  ];
  @override
  final String wireName = 'PaymentTransactionType';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PaymentTransactionType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.amount != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(object.amount,
            specifiedType: const FullType(int)));
    }
    if (object.close != null) {
      result
        ..add('close')
        ..add(serializers.serialize(object.close,
            specifiedType: const FullType(String)));
    }
    if (object.closeamount != null) {
      result
        ..add('closeamount')
        ..add(serializers.serialize(object.closeamount,
            specifiedType: const FullType(int)));
    }
    if (object.closerewards != null) {
      result
        ..add('closerewards')
        ..add(serializers.serialize(object.closerewards,
            specifiedType: const FullType(int)));
    }
    if (object.to != null) {
      result
        ..add('to')
        ..add(serializers.serialize(object.to,
            specifiedType: const FullType(String)));
    }
    if (object.torewards != null) {
      result
        ..add('torewards')
        ..add(serializers.serialize(object.torewards,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PaymentTransactionType deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PaymentTransactionTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'close':
          result.close = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'closeamount':
          result.closeamount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'closerewards':
          result.closerewards = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'torewards':
          result.torewards = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PaymentTransactionType extends PaymentTransactionType {
  @override
  final int amount;
  @override
  final String close;
  @override
  final int closeamount;
  @override
  final int closerewards;
  @override
  final String to;
  @override
  final int torewards;

  factory _$PaymentTransactionType(
          [void Function(PaymentTransactionTypeBuilder) updates]) =>
      (PaymentTransactionTypeBuilder()..update(updates)).build();

  _$PaymentTransactionType._(
      {this.amount,
      this.close,
      this.closeamount,
      this.closerewards,
      this.to,
      this.torewards})
      : super._();

  @override
  PaymentTransactionType rebuild(
          void Function(PaymentTransactionTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentTransactionTypeBuilder toBuilder() =>
      PaymentTransactionTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentTransactionType &&
        amount == other.amount &&
        close == other.close &&
        closeamount == other.closeamount &&
        closerewards == other.closerewards &&
        to == other.to &&
        torewards == other.torewards;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, amount.hashCode), close.hashCode),
                    closeamount.hashCode),
                closerewards.hashCode),
            to.hashCode),
        torewards.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaymentTransactionType')
          ..add('amount', amount)
          ..add('close', close)
          ..add('closeamount', closeamount)
          ..add('closerewards', closerewards)
          ..add('to', to)
          ..add('torewards', torewards))
        .toString();
  }
}

class PaymentTransactionTypeBuilder
    implements Builder<PaymentTransactionType, PaymentTransactionTypeBuilder> {
  _$PaymentTransactionType _$v;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  String _close;
  String get close => _$this._close;
  set close(String close) => _$this._close = close;

  int _closeamount;
  int get closeamount => _$this._closeamount;
  set closeamount(int closeamount) => _$this._closeamount = closeamount;

  int _closerewards;
  int get closerewards => _$this._closerewards;
  set closerewards(int closerewards) => _$this._closerewards = closerewards;

  String _to;
  String get to => _$this._to;
  set to(String to) => _$this._to = to;

  int _torewards;
  int get torewards => _$this._torewards;
  set torewards(int torewards) => _$this._torewards = torewards;

  PaymentTransactionTypeBuilder();

  PaymentTransactionTypeBuilder get _$this {
    if (_$v != null) {
      _amount = _$v.amount;
      _close = _$v.close;
      _closeamount = _$v.closeamount;
      _closerewards = _$v.closerewards;
      _to = _$v.to;
      _torewards = _$v.torewards;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentTransactionType other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$PaymentTransactionType;
  }

  @override
  void update(void Function(PaymentTransactionTypeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaymentTransactionType build() {
    final _$result = _$v ??
        _$PaymentTransactionType._(
            amount: amount,
            close: close,
            closeamount: closeamount,
            closerewards: closerewards,
            to: to,
            torewards: torewards);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
