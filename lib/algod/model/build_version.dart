        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'build_version.g.dart';

abstract class BuildVersion implements Built<BuildVersion, BuildVersionBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'branch')
    String get branch;
    
        @nullable
    @BuiltValueField(wireName: r'build_number')
    int get buildNumber;
    
        @nullable
    @BuiltValueField(wireName: r'channel')
    String get channel;
    
        @nullable
    @BuiltValueField(wireName: r'commit_hash')
    String get commitHash;
    
        @nullable
    @BuiltValueField(wireName: r'major')
    int get major;
    
        @nullable
    @BuiltValueField(wireName: r'minor')
    int get minor;

    // Boilerplate code needed to wire-up generated code
    BuildVersion._();

    factory BuildVersion([updates(BuildVersionBuilder b)]) = _$BuildVersion;
    static Serializer<BuildVersion> get serializer => _$buildVersionSerializer;

}

