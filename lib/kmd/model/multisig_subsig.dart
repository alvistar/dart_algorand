import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'multisig_subsig.g.dart';

abstract class MultisigSubsig
    implements Built<MultisigSubsig, MultisigSubsigBuilder> {
  @nullable
  @BuiltValueField(wireName: r'Key')
  String get key;

  @nullable
  @BuiltValueField(wireName: r'Sig')
  String get sig;

  // Boilerplate code needed to wire-up generated code
  MultisigSubsig._();

  factory MultisigSubsig([updates(MultisigSubsigBuilder b)]) = _$MultisigSubsig;

  static Serializer<MultisigSubsig> get serializer =>
      _$multisigSubsigSerializer;
}
