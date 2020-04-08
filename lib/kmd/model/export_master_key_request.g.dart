// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_master_key_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExportMasterKeyRequest> _$exportMasterKeyRequestSerializer =
    new _$ExportMasterKeyRequestSerializer();

class _$ExportMasterKeyRequestSerializer
    implements StructuredSerializer<ExportMasterKeyRequest> {
  @override
  final Iterable<Type> types = const [
    ExportMasterKeyRequest,
    _$ExportMasterKeyRequest
  ];
  @override
  final String wireName = 'ExportMasterKeyRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ExportMasterKeyRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.walletHandleToken != null) {
      result
        ..add('wallet_handle_token')
        ..add(serializers.serialize(object.walletHandleToken,
            specifiedType: const FullType(String)));
    }
    if (object.walletPassword != null) {
      result
        ..add('wallet_password')
        ..add(serializers.serialize(object.walletPassword,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ExportMasterKeyRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExportMasterKeyRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'wallet_handle_token':
          result.walletHandleToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wallet_password':
          result.walletPassword = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ExportMasterKeyRequest extends ExportMasterKeyRequest {
  @override
  final String walletHandleToken;
  @override
  final String walletPassword;

  factory _$ExportMasterKeyRequest(
          [void Function(ExportMasterKeyRequestBuilder) updates]) =>
      (new ExportMasterKeyRequestBuilder()..update(updates)).build();

  _$ExportMasterKeyRequest._({this.walletHandleToken, this.walletPassword})
      : super._();

  @override
  ExportMasterKeyRequest rebuild(
          void Function(ExportMasterKeyRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExportMasterKeyRequestBuilder toBuilder() =>
      new ExportMasterKeyRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExportMasterKeyRequest &&
        walletHandleToken == other.walletHandleToken &&
        walletPassword == other.walletPassword;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, walletHandleToken.hashCode), walletPassword.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExportMasterKeyRequest')
          ..add('walletHandleToken', walletHandleToken)
          ..add('walletPassword', walletPassword))
        .toString();
  }
}

class ExportMasterKeyRequestBuilder
    implements Builder<ExportMasterKeyRequest, ExportMasterKeyRequestBuilder> {
  _$ExportMasterKeyRequest _$v;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  String _walletPassword;
  String get walletPassword => _$this._walletPassword;
  set walletPassword(String walletPassword) =>
      _$this._walletPassword = walletPassword;

  ExportMasterKeyRequestBuilder();

  ExportMasterKeyRequestBuilder get _$this {
    if (_$v != null) {
      _walletHandleToken = _$v.walletHandleToken;
      _walletPassword = _$v.walletPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExportMasterKeyRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ExportMasterKeyRequest;
  }

  @override
  void update(void Function(ExportMasterKeyRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExportMasterKeyRequest build() {
    final _$result = _$v ??
        new _$ExportMasterKeyRequest._(
            walletHandleToken: walletHandleToken,
            walletPassword: walletPassword);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
