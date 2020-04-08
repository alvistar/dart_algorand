            import 'package:built_collection/built_collection.dart';
        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'versions_response.g.dart';

abstract class VersionsResponse implements Built<VersionsResponse, VersionsResponseBuilder> {

    
        @nullable
    @BuiltValueField(wireName: r'versions')
    BuiltList<String> get versions;

    // Boilerplate code needed to wire-up generated code
    VersionsResponse._();

    factory VersionsResponse([updates(VersionsResponseBuilder b)]) = _$VersionsResponse;
    static Serializer<VersionsResponse> get serializer => _$versionsResponseSerializer;

}

