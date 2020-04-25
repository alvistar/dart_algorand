// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_id.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionID> _$transactionIDSerializer =
    _$TransactionIDSerializer();

class _$TransactionIDSerializer implements StructuredSerializer<TransactionID> {
  @override
  final Iterable<Type> types = const [TransactionID, _$TransactionID];
  @override
  final String wireName = 'TransactionID';

  @override
  Iterable<Object> serialize(Serializers serializers, TransactionID object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.txId != null) {
      result
        ..add('txId')
        ..add(serializers.serialize(object.txId,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TransactionID deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TransactionIDBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'txId':
          result.txId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionID extends TransactionID {
  @override
  final String txId;

  factory _$TransactionID([void Function(TransactionIDBuilder) updates]) =>
      (TransactionIDBuilder()..update(updates)).build();

  _$TransactionID._({this.txId}) : super._();

  @override
  TransactionID rebuild(void Function(TransactionIDBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionIDBuilder toBuilder() => TransactionIDBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionID && txId == other.txId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, txId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionID')..add('txId', txId))
        .toString();
  }
}

class TransactionIDBuilder
    implements Builder<TransactionID, TransactionIDBuilder> {
  _$TransactionID _$v;

  String _txId;
  String get txId => _$this._txId;
  set txId(String txId) => _$this._txId = txId;

  TransactionIDBuilder();

  TransactionIDBuilder get _$this {
    if (_$v != null) {
      _txId = _$v.txId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionID other) {
    if (other == null) {
      throw ArgumentError.notNull('other');
    }
    _$v = other as _$TransactionID;
  }

  @override
  void update(void Function(TransactionIDBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionID build() {
    final _$result = _$v ?? _$TransactionID._(txId: txId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
