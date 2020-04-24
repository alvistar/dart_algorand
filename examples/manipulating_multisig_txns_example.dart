import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create an algod client
  final acl = AlgodClient(token: algodToken, url: algodUrl);

  // generate three accounts
  final account1 = generate_account();
  final account2 = generate_account();
  final account3 = generate_account();

  // create a multisig account
  final version = 1; // multisig version
  final threshold = 2; //  how many signatures are necessary
  final msig = Multisig(version: version,
      threshold: threshold,
      addresses: [account1.address, account2.address]);

  // get suggested params
  final params = await acl.transactionParams();

  // create transaction
  final txn = PaymentTxn(
    sender: msig.address(),
    fee: params.fee,
    first_valid_round: params.lastRound,
    last_valid_round: params.lastRound + 100,
    genesis_hash: params.genesishashb64,
    receiver: account3.address,
    genesis_id: params.genesisID,
    amt: 10000
  );

  // create a SignedTransaction object
  final mtx = MultisigTransaction(transaction: txn, multisig: msig);

  // sign the transaction
  mtx.sign(account1.private_key);
  mtx.sign(account2.private_key);

  // print encoded transaction
  print(msgpack_encode(mtx));
}