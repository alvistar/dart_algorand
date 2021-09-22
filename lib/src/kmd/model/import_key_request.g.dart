// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import_key_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImportKeyRequest> _$importKeyRequestSerializer =
    _$ImportKeyRequestSerializer();

class _$ImportKeyRequestSerializer
    implements StructuredSerializer<ImportKeyRequest> {
  @override
  final Iterable<Type> types = const [ImportKeyRequest, _$ImportKeyRequest];
  @override
  final String wireName = 'ImportKeyRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, ImportKeyRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.privateKey;
    if (value != null) {
      result
        ..add('private_key')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.walletHandleToken;
    if (value != null) {
      result
        ..add('wallet_handle_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ImportKeyRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ImportKeyRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'private_key':
          result.privateKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_handle_token':
          result.walletHandleToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImportKeyRequest extends ImportKeyRequest {
  @override
  final String privateKey;
  @override
  final String walletHandleToken;

  factory _$ImportKeyRequest(
          [void Function(ImportKeyRequestBuilder) updates]) =>
      (ImportKeyRequestBuilder()..update(updates)).build();

  _$ImportKeyRequest._({this.privateKey, this.walletHandleToken}) : super._();

  @override
  ImportKeyRequest rebuild(void Function(ImportKeyRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImportKeyRequestBuilder toBuilder() =>
      ImportKeyRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImportKeyRequest &&
        privateKey == other.privateKey &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, privateKey.hashCode), walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImportKeyRequest')
          ..add('privateKey', privateKey)
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class ImportKeyRequestBuilder
    implements Builder<ImportKeyRequest, ImportKeyRequestBuilder> {
  _$ImportKeyRequest _$v;

  String _privateKey;
  String get privateKey => _$this._privateKey;
  set privateKey(String privateKey) => _$this._privateKey = privateKey;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  ImportKeyRequestBuilder();

  ImportKeyRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _privateKey = $v.privateKey;
      _walletHandleToken = $v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImportKeyRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImportKeyRequest;
  }

  @override
  void update(void Function(ImportKeyRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImportKeyRequest build() {
    final _$result = _$v ??
        _$ImportKeyRequest._(
            privateKey: privateKey, walletHandleToken: walletHandleToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
