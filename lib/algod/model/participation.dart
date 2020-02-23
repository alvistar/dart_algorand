        import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'participation.g.dart';

abstract class Participation implements Built<Participation, ParticipationBuilder> {

    /* ParticipationPK is the root participation public key (if any) currently registered for this round */
        @nullable
    @BuiltValueField(wireName: r'partpkb64')
    String get partpkb64;
    /* VoteFirst is the first round for which this participation is valid. */
        @nullable
    @BuiltValueField(wireName: r'votefst')
    int get votefst;
    /* VoteKeyDilution is the number of subkeys in for each batch of participation keys. */
        @nullable
    @BuiltValueField(wireName: r'votekd')
    int get votekd;
    /* VoteLast is the last round for which this participation is valid. */
        @nullable
    @BuiltValueField(wireName: r'votelst')
    int get votelst;
    /* VRFPK is the selection public key (if any) currently registered for this round */
        @nullable
    @BuiltValueField(wireName: r'vrfpkb64')
    String get vrfpkb64;

    // Boilerplate code needed to wire-up generated code
    Participation._();

    factory Participation([updates(ParticipationBuilder b)]) = _$Participation;
    static Serializer<Participation> get serializer => _$participationSerializer;

}

