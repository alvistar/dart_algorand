// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionList> _$transactionListSerializer =
    _$TransactionListSerializer();

class _$TransactionListSerializer
    implements StructuredSerializer<TransactionList> {
  @override
  final Iterable<Type> types = const [TransactionList, _$TransactionList];
  @override
  final String wireName = 'TransactionList';

  @override
  Iterable<Object> serialize(Serializers serializers, TransactionList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.transactions != null) {
      result
        ..add('transactions')
        ..add(serializers.serialize(object.transactions,
            specifiedType: const FullType(BuiltList, [FullType(Transaction)])));
    }
    return result;
  }

  @override
  TransactionList deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TransactionListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'transactions':
          result.transactions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, [FullType(Transaction)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionList extends TransactionList {
  @override
  final BuiltList<Transaction> transactions;

  factory _$TransactionList([void Function(TransactionListBuilder) updates]) =>
      (TransactionListBuilder()..update(updates)).build();

  _$TransactionList._({this.transactions}) : super._();

  @override
  TransactionList rebuild(void Function(TransactionListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionListBuilder toBuilder() => TransactionListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionList && transactions == other.transactions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, transactions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionList')
          ..add('transactions', transactions))
        .toString();
  }
}

class TransactionListBuilder
    implements Builder<TransactionList, TransactionListBuilder> {
  _$TransactionList _$v;

  ListBuilder<Transaction> _transactions;
  ListBuilder<Transaction> get transactions =>
      _$this._transactions ??= ListBuilder<Transaction>();
  set transactions(ListBuilder<Transaction> transactions) =>
      _$this._transactions = transactions;

  TransactionListBuilder();

  TransactionListBuilder get _$this {
    if (_$v != null) {
      _transactions = _$v.transactions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionList other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$TransactionList;
  }

  @override
  void update(void Function(TransactionListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionList build() {
    _$TransactionList _$result;
    try {
      _$result =
          _$v ?? _$TransactionList._(transactions: _transactions?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'transactions';
        _transactions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            'TransactionList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
