import 'dart:convert';

import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create an algod client
  final acl = AlgodClient(token: algodToken, url: algodUrl);

  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  // convert passphrase to secret key
  final sk = to_private_key(mnemonic);
  final address = address_from_private_key(sk);

  // generate three accounts
  final account1 = generate_account();

  // get suggested params
  final params = await acl.transactionParams();

  // create transaction
  final txn = PaymentTxn(
      sender: address,
      fee: params.fee,
      first_valid_round: params.lastRound,
      last_valid_round: params.lastRound + 100,
      genesis_hash: params.genesishashb64,
      receiver: account1.address,
      genesis_id: params.genesisID,
      note: utf8.encode('Some Text'),
      amt: 10000);

  // sign it
  txn.sign(sk);
}
