// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_results.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionResults> _$transactionResultsSerializer =
    _$TransactionResultsSerializer();

class _$TransactionResultsSerializer
    implements StructuredSerializer<TransactionResults> {
  @override
  final Iterable<Type> types = const [TransactionResults, _$TransactionResults];
  @override
  final String wireName = 'TransactionResults';

  @override
  Iterable<Object> serialize(Serializers serializers, TransactionResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.createdasset;
    if (value != null) {
      result
        ..add('createdasset')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  TransactionResults deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TransactionResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'createdasset':
          result.createdasset = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionResults extends TransactionResults {
  @override
  final int createdasset;

  factory _$TransactionResults(
          [void Function(TransactionResultsBuilder) updates]) =>
      (TransactionResultsBuilder()..update(updates)).build();

  _$TransactionResults._({this.createdasset}) : super._();

  @override
  TransactionResults rebuild(
          void Function(TransactionResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionResultsBuilder toBuilder() =>
      TransactionResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionResults && createdasset == other.createdasset;
  }

  @override
  int get hashCode {
    return $jf($jc(0, createdasset.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionResults')
          ..add('createdasset', createdasset))
        .toString();
  }
}

class TransactionResultsBuilder
    implements Builder<TransactionResults, TransactionResultsBuilder> {
  _$TransactionResults _$v;

  int _createdasset;
  int get createdasset => _$this._createdasset;
  set createdasset(int createdasset) => _$this._createdasset = createdasset;

  TransactionResultsBuilder();

  TransactionResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdasset = $v.createdasset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionResults;
  }

  @override
  void update(void Function(TransactionResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionResults build() {
    final _$result = _$v ?? _$TransactionResults._(createdasset: createdasset);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
