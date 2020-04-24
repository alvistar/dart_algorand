import 'dart:typed_data';

import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create an algod client
  final acl = AlgodClient(token: algodToken, url: algodUrl);

  final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x00, 0x22]);
  final lsig = LogicSig(program: program);
  final sender = lsig.address();

  // generate account
  final account1 = generate_account();

  // get suggested params
  final params = await acl.transactionParams();

  // create transaction
  final txn = PaymentTxn(
      sender: sender,
      fee: params.fee,
      first_valid_round: params.lastRound,
      last_valid_round: params.lastRound + 100,
      genesis_hash: params.genesishashb64,
      receiver: account1.address,
      genesis_id: params.genesisID,
      amt: 10000);

  // note, transaction is signed by logic only (no delegation)
  // that means sender address must match to program hash

  final lstx = LogicSigTransaction(transaction: txn, lsig: lsig);
  assert(lstx.verify());

  // send them over the network
  // await acl.sendTransaction(lstx);
}
