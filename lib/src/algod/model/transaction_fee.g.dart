// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_fee.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionFee> _$transactionFeeSerializer =
    _$TransactionFeeSerializer();

class _$TransactionFeeSerializer
    implements StructuredSerializer<TransactionFee> {
  @override
  final Iterable<Type> types = const [TransactionFee, _$TransactionFee];
  @override
  final String wireName = 'TransactionFee';

  @override
  Iterable<Object> serialize(Serializers serializers, TransactionFee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.fee;
    if (value != null) {
      result
        ..add('fee')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  TransactionFee deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TransactionFeeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'fee':
          result.fee = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionFee extends TransactionFee {
  @override
  final int fee;

  factory _$TransactionFee([void Function(TransactionFeeBuilder) updates]) =>
      (TransactionFeeBuilder()..update(updates)).build();

  _$TransactionFee._({this.fee}) : super._();

  @override
  TransactionFee rebuild(void Function(TransactionFeeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionFeeBuilder toBuilder() => TransactionFeeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionFee && fee == other.fee;
  }

  @override
  int get hashCode {
    return $jf($jc(0, fee.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionFee')..add('fee', fee))
        .toString();
  }
}

class TransactionFeeBuilder
    implements Builder<TransactionFee, TransactionFeeBuilder> {
  _$TransactionFee _$v;

  int _fee;
  int get fee => _$this._fee;
  set fee(int fee) => _$this._fee = fee;

  TransactionFeeBuilder();

  TransactionFeeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fee = $v.fee;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionFee other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionFee;
  }

  @override
  void update(void Function(TransactionFeeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionFee build() {
    final _$result = _$v ?? _$TransactionFee._(fee: fee);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
