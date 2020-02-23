import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dart_algorand/algod/model/payment_transaction_type.dart';
import 'package:dart_algorand/algod/model/transaction_results.dart';

import 'asset_config_transaction_type.dart';
import 'asset_freeze_transaction_type.dart';
import 'asset_transfer_transaction_type.dart';
import 'keyreg_transaction_type.dart';

part 'transaction.g.dart';

abstract class Transaction implements Built<Transaction, TransactionBuilder> {
  @nullable
  @BuiltValueField(wireName: r'curcfg')
  AssetConfigTransactionType get curcfg;

  @nullable
  @BuiltValueField(wireName: r'curfrz')
  AssetFreezeTransactionType get curfrz;

  @nullable
  @BuiltValueField(wireName: r'curxfer')
  AssetTransferTransactionType get curxfer;

  /* Fee is the transaction fee */
  @nullable
  @BuiltValueField(wireName: r'fee')
  int get fee;

  /* FirstRound indicates the first valid round for this transaction */
  @nullable
  @BuiltValueField(wireName: r'first-round')
  int get firstRound;

  /* From is the sender's address */
  @nullable
  @BuiltValueField(wireName: r'from')
  String get from;

  /* FromRewards is the amount of pending rewards applied to the From account as part of this transaction. */
  @nullable
  @BuiltValueField(wireName: r'fromrewards')
  int get fromrewards;

  /* Genesis ID */
  @nullable
  @BuiltValueField(wireName: r'genesisID')
  String get genesisID;

  /* Genesis hash */
  @nullable
  @BuiltValueField(wireName: r'genesishashb64')
  String get genesishashb64;

  /* Group */
  @nullable
  @BuiltValueField(wireName: r'group')
  String get group;

  @nullable
  @BuiltValueField(wireName: r'keyreg')
  KeyregTransactionType get keyreg;

  /* LastRound indicates the last valid round for this transaction */
  @nullable
  @BuiltValueField(wireName: r'last-round')
  int get lastRound;

  /* Lease enforces mutual exclusion of transactions.  If this field is nonzero, then once the transaction is confirmed, it acquires the lease identified by the (Sender, Lease) pair of the transaction until the LastValid round passes.  While this transaction possesses the lease, no other transaction specifying this lease can be confirmed. */
  @nullable
  @BuiltValueField(wireName: r'lease')
  String get lease;

  /* Note is a free form data */
  @nullable
  @BuiltValueField(wireName: r'noteb64')
  String get noteb64;

  @nullable
  @BuiltValueField(wireName: r'payment')
  PaymentTransactionType get payment;

  /* PoolError indicates the transaction was evicted from this node's transaction pool (if non-empty).  A non-empty PoolError does not guarantee that the transaction will never be committed; other nodes may not have evicted the transaction and may attempt to commit it in the future. */
  @nullable
  @BuiltValueField(wireName: r'poolerror')
  String get poolerror;

  /* ConfirmedRound indicates the block number this transaction appeared in */
  @nullable
  @BuiltValueField(wireName: r'round')
  int get round;

  /* TxID is the transaction ID */
  @nullable
  @BuiltValueField(wireName: r'tx')
  String get tx;

  @nullable
  @BuiltValueField(wireName: r'txresults')
  TransactionResults get txresults;

  /* Type is the transaction type */
  @nullable
  @BuiltValueField(wireName: r'type')
  String get type;

  // Boilerplate code needed to wire-up generated code
  Transaction._();

  factory Transaction([updates(TransactionBuilder b)]) = _$Transaction;

  static Serializer<Transaction> get serializer => _$transactionSerializer;
}
