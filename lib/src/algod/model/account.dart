import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'asset_holding.dart';
import 'participation.dart';

import 'asset_params.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  /* Address indicates the account public key */
  @nullable
  @BuiltValueField(wireName: r'address')
  String get address;

  /* Amount indicates the total number of MicroAlgos in the account */
  @nullable
  @BuiltValueField(wireName: r'amount')
  int get amount;

  /* AmountWithoutPendingRewards specifies the amount of MicroAlgos in the account, without the pending rewards. */
  @nullable
  @BuiltValueField(wireName: r'amountwithoutpendingrewards')
  int get amountwithoutpendingrewards;

  /* Assets specifies the holdings of assets by this account, indexed by the asset ID. */
  @nullable
  @BuiltValueField(wireName: r'assets')
  BuiltMap<String, AssetHolding> get assets;

  @nullable
  @BuiltValueField(wireName: r'participation')
  Participation get participation;

  /* PendingRewards specifies the amount of MicroAlgos of pending rewards in this account. */
  @nullable
  @BuiltValueField(wireName: r'pendingrewards')
  int get pendingrewards;

  /* Rewards indicates the total rewards of MicroAlgos the account has received, including pending rewards. */
  @nullable
  @BuiltValueField(wireName: r'rewards')
  int get rewards;

  /* Round indicates the round for which this information is relevant */
  @nullable
  @BuiltValueField(wireName: r'round')
  int get round;

  /* Status indicates the delegation status of the account's MicroAlgos Offline - indicates that the associated account is delegated. Online  - indicates that the associated account used as part of the delegation pool. NotParticipating - indicates that the associated account is neither a delegator nor a delegate. */
  @nullable
  @BuiltValueField(wireName: r'status')
  String get status;

  /* AssetParams specifies the parameters of assets created by this account. */
  @nullable
  @BuiltValueField(wireName: r'thisassettotal')
  BuiltMap<String, AssetParams> get thisassettotal;

  // Boilerplate code needed to wire-up generated code
  Account._();

  factory Account([updates(AccountBuilder b)]) = _$Account;

  static Serializer<Account> get serializer => _$accountSerializer;
}
