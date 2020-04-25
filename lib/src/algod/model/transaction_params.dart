import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transaction_params.g.dart';

abstract class TransactionParams
    implements Built<TransactionParams, TransactionParamsBuilder> {
  /* ConsensusVersion indicates the consensus protocol version as of LastRound. */
  @nullable
  @BuiltValueField(wireName: r'consensusVersion')
  String get consensusVersion;
  /* Fee is the suggested transaction fee Fee is in units of micro-Algos per byte. Fee may fall to zero but transactions must still have a fee of at least MinTxnFee for the current network protocol. */
  @nullable
  @BuiltValueField(wireName: r'fee')
  int get fee;
  /* Genesis ID */
  @nullable
  @BuiltValueField(wireName: r'genesisID')
  String get genesisID;
  /* Genesis hash */
  @nullable
  @BuiltValueField(wireName: r'genesishashb64')
  String get genesishashb64;
  /* LastRound indicates the last round seen */
  @nullable
  @BuiltValueField(wireName: r'lastRound')
  int get lastRound;
  /* The minimum transaction fee (not per byte) required for the txn to validate for the current network protocol. */
  @nullable
  @BuiltValueField(wireName: r'minFee')
  int get minFee;

  // Boilerplate code needed to wire-up generated code
  TransactionParams._();

  factory TransactionParams([updates(TransactionParamsBuilder b)]) =
      _$TransactionParams;
  static Serializer<TransactionParams> get serializer =>
      _$transactionParamsSerializer;
}
