// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_key_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GenerateKeyRequest> _$generateKeyRequestSerializer =
    _$GenerateKeyRequestSerializer();

class _$GenerateKeyRequestSerializer
    implements StructuredSerializer<GenerateKeyRequest> {
  @override
  final Iterable<Type> types = const [GenerateKeyRequest, _$GenerateKeyRequest];
  @override
  final String wireName = 'GenerateKeyRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, GenerateKeyRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.displayMnemonic;
    if (value != null) {
      result
        ..add('display_mnemonic')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  GenerateKeyRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GenerateKeyRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'display_mnemonic':
          result.displayMnemonic = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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

class _$GenerateKeyRequest extends GenerateKeyRequest {
  @override
  final bool displayMnemonic;
  @override
  final String walletHandleToken;

  factory _$GenerateKeyRequest(
          [void Function(GenerateKeyRequestBuilder) updates]) =>
      (GenerateKeyRequestBuilder()..update(updates)).build();

  _$GenerateKeyRequest._({this.displayMnemonic, this.walletHandleToken})
      : super._();

  @override
  GenerateKeyRequest rebuild(
          void Function(GenerateKeyRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenerateKeyRequestBuilder toBuilder() =>
      GenerateKeyRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenerateKeyRequest &&
        displayMnemonic == other.displayMnemonic &&
        walletHandleToken == other.walletHandleToken;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc(0, displayMnemonic.hashCode), walletHandleToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GenerateKeyRequest')
          ..add('displayMnemonic', displayMnemonic)
          ..add('walletHandleToken', walletHandleToken))
        .toString();
  }
}

class GenerateKeyRequestBuilder
    implements Builder<GenerateKeyRequest, GenerateKeyRequestBuilder> {
  _$GenerateKeyRequest _$v;

  bool _displayMnemonic;
  bool get displayMnemonic => _$this._displayMnemonic;
  set displayMnemonic(bool displayMnemonic) =>
      _$this._displayMnemonic = displayMnemonic;

  String _walletHandleToken;
  String get walletHandleToken => _$this._walletHandleToken;
  set walletHandleToken(String walletHandleToken) =>
      _$this._walletHandleToken = walletHandleToken;

  GenerateKeyRequestBuilder();

  GenerateKeyRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayMnemonic = $v.displayMnemonic;
      _walletHandleToken = $v.walletHandleToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenerateKeyRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenerateKeyRequest;
  }

  @override
  void update(void Function(GenerateKeyRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GenerateKeyRequest build() {
    final _$result = _$v ??
        _$GenerateKeyRequest._(
            displayMnemonic: displayMnemonic,
            walletHandleToken: walletHandleToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
