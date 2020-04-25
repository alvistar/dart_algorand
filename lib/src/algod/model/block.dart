import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'transaction_list.dart';

part 'block.g.dart';

abstract class Block implements Built<Block, BlockBuilder> {
  /* CurrentProtocol is a string that represents the current protocol */
  @nullable
  @BuiltValueField(wireName: r'currentProtocol')
  String get currentProtocol;

  /* The number of leftover MicroAlgos after the distribution of RewardsRate/rewardUnits MicroAlgos for every reward unit in the next round. */
  @nullable
  @BuiltValueField(wireName: r'frac')
  int get frac;

  /* Hash is the current block hash */
  @nullable
  @BuiltValueField(wireName: r'hash')
  String get hash;

  /* NextProtocol is a string that represents the next proposed protocol */
  @nullable
  @BuiltValueField(wireName: r'nextProtocol')
  String get nextProtocol;

  /* NextProtocolApprovals is the number of blocks which approved the protocol upgrade */
  @nullable
  @BuiltValueField(wireName: r'nextProtocolApprovals')
  int get nextProtocolApprovals;

  /* NextProtocolSwitchOn is the round on which the protocol upgrade will take effect */
  @nullable
  @BuiltValueField(wireName: r'nextProtocolSwitchOn')
  int get nextProtocolSwitchOn;

  /* NextProtocolVoteBefore is the deadline round for this protocol upgrade (No votes will be consider after this round) */
  @nullable
  @BuiltValueField(wireName: r'nextProtocolVoteBefore')
  int get nextProtocolVoteBefore;

  /* Period is the period on which the block was confirmed */
  @nullable
  @BuiltValueField(wireName: r'period')
  int get period;

  /* PreviousBlockHash is the previous block hash */
  @nullable
  @BuiltValueField(wireName: r'previousBlockHash')
  String get previousBlockHash;

  /* Proposer is the address of this block proposer */
  @nullable
  @BuiltValueField(wireName: r'proposer')
  String get proposer;

  /* The number of new MicroAlgos added to the participation stake from rewards at the next round. */
  @nullable
  @BuiltValueField(wireName: r'rate')
  int get rate;

  /* RewardsLevel specifies how many rewards, in MicroAlgos, have been distributed to each config.Protocol.RewardUnit of MicroAlgos since genesis. */
  @nullable
  @BuiltValueField(wireName: r'reward')
  int get reward;

  /* Round is the current round on which this block was appended to the chain */
  @nullable
  @BuiltValueField(wireName: r'round')
  int get round;

  /* Seed is the sortition seed */
  @nullable
  @BuiltValueField(wireName: r'seed')
  String get seed;

  /* TimeStamp in seconds since epoch */
  @nullable
  @BuiltValueField(wireName: r'timestamp')
  int get timestamp;

  /* TransactionsRoot authenticates the set of transactions appearing in the block. More specifically, it's the root of a merkle tree whose leaves are the block's Txids, in lexicographic order. For the empty block, it's 0. Note that the TxnRoot does not authenticate the signatures on the transactions, only the transactions themselves. Two blocks with the same transactions but in a different order and with different signatures will have the same TxnRoot. */
  @nullable
  @BuiltValueField(wireName: r'txnRoot')
  String get txnRoot;

  @nullable
  @BuiltValueField(wireName: r'txns')
  TransactionList get txns;

  /* UpgradeApprove indicates a yes vote for the current proposal */
  @nullable
  @BuiltValueField(wireName: r'upgradeApprove')
  bool get upgradeApprove;

  /* UpgradePropose indicates a proposed upgrade */
  @nullable
  @BuiltValueField(wireName: r'upgradePropose')
  String get upgradePropose;

  // Boilerplate code needed to wire-up generated code
  Block._();

  factory Block([updates(BlockBuilder b)]) = _$Block;

  static Serializer<Block> get serializer => _$blockSerializer;
}
