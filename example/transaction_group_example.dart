import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create an algod and kmd client
  final acl = AlgodClient(token: algodToken, url: algodUrl);
  final kcl = KmdClient(token: kmdToken, url: kmdUrl);

  final sender = generate_account();
  final receiver = generate_account();

  // get suggested params
  final params = await acl.transactionParams();

  // create transaction
  final txn1 = PaymentTxn(
      sender: sender.address,
      fee: params.fee,
      first_valid_round: params.lastRound,
      last_valid_round: params.lastRound + 100,
      genesis_hash: params.genesishashb64,
      receiver: receiver.address,
      genesis_id: params.genesisID,
      amt: 10000);

  final txn2 = PaymentTxn(
      sender: receiver.address,
      fee: params.fee,
      first_valid_round: params.lastRound,
      last_valid_round: params.lastRound + 100,
      genesis_hash: params.genesishashb64,
      receiver: sender.address,
      genesis_id: params.genesisID,
      amt: 10000);

  // get group id and assign it to transactions
  final gid = calculate_group_id([txn1, txn2]);
  txn1.group = gid;
  txn2.group = gid;

  // sign transactions
  final stxn1 = txn1.sign(sender.private_key);
  final stxn2 = txn2.sign(receiver.private_key);

  // send them over network
  // await acl.sendTransactions([stxn1, stxn2]);
}
