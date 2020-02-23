import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'build_version.dart';

part 'version.g.dart';

abstract class Version implements Built<Version, VersionBuilder> {
  @nullable
  @BuiltValueField(wireName: r'build')
  BuildVersion get vbuild;

  @nullable
  @BuiltValueField(wireName: r'genesis_hash_b64')
  String get genesisHashB64;

  @nullable
  @BuiltValueField(wireName: r'genesis_id')
  String get genesisId;

  @nullable
  @BuiltValueField(wireName: r'versions')
  BuiltList<String> get versions;

  // Boilerplate code needed to wire-up generated code
  Version._();

  factory Version([updates(VersionBuilder b)]) = _$Version;

  static Serializer<Version> get serializer => _$versionSerializer;
}
