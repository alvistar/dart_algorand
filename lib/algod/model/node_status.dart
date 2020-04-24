import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'node_status.g.dart';

abstract class NodeStatus implements Built<NodeStatus, NodeStatusBuilder> {
  /* CatchupTime in nanoseconds */
  @nullable
  @BuiltValueField(wireName: r'catchupTime')
  int get catchupTime;
  /* HasSyncedSinceStartup indicates whether a round has completed since startup */
  @nullable
  @BuiltValueField(wireName: r'hasSyncedSinceStartup')
  bool get hasSyncedSinceStartup;
  /* LastVersion indicates the last consensus version supported */
  @nullable
  @BuiltValueField(wireName: r'lastConsensusVersion')
  String get lastConsensusVersion;
  /* LastRound indicates the last round seen */
  @nullable
  @BuiltValueField(wireName: r'lastRound')
  int get lastRound;
  /* NextVersion of consensus protocol to use */
  @nullable
  @BuiltValueField(wireName: r'nextConsensusVersion')
  String get nextConsensusVersion;
  /* NextVersionRound is the round at which the next consensus version will apply */
  @nullable
  @BuiltValueField(wireName: r'nextConsensusVersionRound')
  int get nextConsensusVersionRound;
  /* NextVersionSupported indicates whether the next consensus version is supported by this node */
  @nullable
  @BuiltValueField(wireName: r'nextConsensusVersionSupported')
  bool get nextConsensusVersionSupported;
  /* TimeSinceLastRound in nanoseconds */
  @nullable
  @BuiltValueField(wireName: r'timeSinceLastRound')
  int get timeSinceLastRound;

  // Boilerplate code needed to wire-up generated code
  NodeStatus._();

  factory NodeStatus([updates(NodeStatusBuilder b)]) = _$NodeStatus;
  static Serializer<NodeStatus> get serializer => _$nodeStatusSerializer;
}
