// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_transactions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PendingTransactions> _$pendingTransactionsSerializer =
    new _$PendingTransactionsSerializer();

class _$PendingTransactionsSerializer
    implements StructuredSerializer<PendingTransactions> {
  @override
  final Iterable<Type> types = const [
    PendingTransactions,
    _$PendingTransactions
  ];
  @override
  final String wireName = 'PendingTransactions';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PendingTransactions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.totalTxns != null) {
      result
        ..add('totalTxns')
        ..add(serializers.serialize(object.totalTxns,
            specifiedType: const FullType(int)));
    }
    if (object.truncatedTxns != null) {
      result
        ..add('truncatedTxns')
        ..add(serializers.serialize(object.truncatedTxns,
            specifiedType: const FullType(TransactionList)));
    }
    return result;
  }

  @override
  PendingTransactions deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PendingTransactionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'totalTxns':
          result.totalTxns = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'truncatedTxns':
          result.truncatedTxns.replace(serializers.deserialize(value,
                  specifiedType: const FullType(TransactionList))
              as TransactionList);
          break;
      }
    }

    return result.build();
  }
}

class _$PendingTransactions extends PendingTransactions {
  @override
  final int totalTxns;
  @override
  final TransactionList truncatedTxns;

  factory _$PendingTransactions(
          [void Function(PendingTransactionsBuilder) updates]) =>
      (new PendingTransactionsBuilder()..update(updates)).build();

  _$PendingTransactions._({this.totalTxns, this.truncatedTxns}) : super._();

  @override
  PendingTransactions rebuild(
          void Function(PendingTransactionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PendingTransactionsBuilder toBuilder() =>
      new PendingTransactionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PendingTransactions &&
        totalTxns == other.totalTxns &&
        truncatedTxns == other.truncatedTxns;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, totalTxns.hashCode), truncatedTxns.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PendingTransactions')
          ..add('totalTxns', totalTxns)
          ..add('truncatedTxns', truncatedTxns))
        .toString();
  }
}

class PendingTransactionsBuilder
    implements Builder<PendingTransactions, PendingTransactionsBuilder> {
  _$PendingTransactions _$v;

  int _totalTxns;
  int get totalTxns => _$this._totalTxns;
  set totalTxns(int totalTxns) => _$this._totalTxns = totalTxns;

  TransactionListBuilder _truncatedTxns;
  TransactionListBuilder get truncatedTxns =>
      _$this._truncatedTxns ??= new TransactionListBuilder();
  set truncatedTxns(TransactionListBuilder truncatedTxns) =>
      _$this._truncatedTxns = truncatedTxns;

  PendingTransactionsBuilder();

  PendingTransactionsBuilder get _$this {
    if (_$v != null) {
      _totalTxns = _$v.totalTxns;
      _truncatedTxns = _$v.truncatedTxns?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PendingTransactions other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PendingTransactions;
  }

  @override
  void update(void Function(PendingTransactionsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PendingTransactions build() {
    _$PendingTransactions _$result;
    try {
      _$result = _$v ??
          new _$PendingTransactions._(
              totalTxns: totalTxns, truncatedTxns: _truncatedTxns?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'truncatedTxns';
        _truncatedTxns?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PendingTransactions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
