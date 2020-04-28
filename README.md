Dart Algorand SDK

A Dart library for interacting with the Algorand network.

## Installation

Installation details can be found on
[pub.dev](https://pub.dev/packages/dart_algorand#-installing-tab-)

This is a port of Algorand Python SDK, function names and functionality is
very similar.

## Quick start

Here's a simple example you can run without a node.

```dart
import 'package:dart_algorand/dart_algorand.dart';

void main () {
  // generate an account
  final account = generate_account();

  print('Private key: ${account.private_key}');
  print('Address: ${account.address}');

  // check if the address is valid
  if (is_valid_address(account.address)) {
    print('The address is valid!');
  }
  else {
    print('The address is invalid.');
  }

}
```

## Node setup

Follow the instructions in Algorand's
[developer resources](https://developer.algorand.org/docs/build-apps/setup/) to
setup your workspace.

## Running example.py

To run `examples/example.py`, you need to install a node on your computer. Using
a
[third-party API service](https://developer.algorand.org/docs/build-apps/setup/#1-use-a-third-party-service)
will not be sufficient as it does not provide access to `kmd`. You have two
options:

1. Either use [sandbox](https://github.com/algorand/sandbox). This is simpler
   and faster to setup but should only be used for development. If you are using
   sandbox, prefix all the commands below with `/path/to/sandbox/sandbox`.
2. Or
   [install your own node](https://developer.algorand.org/docs/build-apps/setup/#3-run-your-own-node).
   We assume that the `$ALGORAND_DATA` environment variable is properly set up,
   Algorand binaries are in the PATH, and the node is synced up with TestNet.

Before running `examples/example.dart`, start `kmd`:

```
$ goal kmd start
```

(or `$ /path/to/sandbox/sandbox goal kmd start` with sandbox)

Next, create a wallet and an account:

```
$ goal wallet new [wallet name]
$ goal account new -w [wallet name]
```

where `[wallet name]` should be replaced by an arbitrary name such as
`mywallet`.

Visit the [Algorand dispenser](https://bank.testnet.algorand.network/) and enter
the account address to fund your account.

Next, in `examples/example.dart` update the const to reflect your params.

You're now ready to run `example.dart`:

## More examples

### using the Wallet class

Instead of always having to keep track of handles, IDs, and passwords for
wallets, create a Wallet object to manage everything for you.

[embedmd]:# (example/wallet_class_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create a kmd client
  final kcl = KmdClient(token: kmdToken, url: kmdUrl);

  // create a wallet object
  final wallet = await Wallet.init(
      walletName: existingWalletName,
      walletPassword: existingWalletPassword,
      kmdClient: kcl);

  // get wallet information
  final info = await wallet.info();
  print('Wallet name: ${info.wallet.name}');

  // create an account
  final address = await wallet.generateKey();
  print('New account: ${address}');

  // delete the account
  await wallet.deleteKey(address);
  print('Account deleted');
}
```

### backing up a wallet with mnemonic

[embedmd]:# (example/backing_up_wallet_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create a kmd client
  final kcl = KmdClient(token: kmdToken, url: kmdUrl);

  // create a wallet object
  final wallet = await Wallet.init(
      walletName: existingWalletName,
      walletPassword: existingWalletPassword,
      kmdClient: kcl);

  // get the wallet's master derivation key
  final mdk = await wallet.exportMasterDerivationKey();
  print('Master derivation key: ${mdk}');

  // get backup phrase
  final backup = from_master_derivation_key(mdk);
  print('Wallet backup phrase: ${backup}');
}
```

You can also back up accounts using from_private_key().

### recovering a wallet using a backup phrase

[embedmd]:# (example/recover_wallet_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create a kmd client
  final kcl = KmdClient(token: kmdToken, url: kmdUrl);

  // get the master derivation key from the mnemonic
  final backup =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final mdk = to_master_derivation_key(backup);

  // recover the wallet by passing mdk when creating a wallet
  await kcl.createWallet(
      name: 'new_wallet', password: 'pass', masterDerivKey: mdk);
}
```

```dart
import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create a kmd client
  final kcl = KmdClient(token: kmdToken, url: kmdUrl);

  // get the master derivation key from the mnemonic
  final backup =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';
  
  final mdk = to_master_derivation_key(backup);

  // recover the wallet by passing mdk when creating a wallet
  await kcl.createWallet(
      name: 'new_wallet', password: 'pass', masterDerivKey: mdk);
}
```

You can also recover accounts using to_private_key().

### manipulating multisig transactions

[embedmd]:# (example/manipulating_multisig_txns_example.dart)
```dart
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
  final msig = Multisig(
      version: version,
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
      amt: 10000);

  // create a SignedTransaction object
  final mtx = MultisigTransaction(transaction: txn, multisig: msig);

  // sign the transaction
  mtx.sign(account1.private_key);
  mtx.sign(account2.private_key);

  // print encoded transaction
  print(msgpack_encode(mtx));
}
```

### working with NoteField

We can put things in the "note" field of a transaction; here's an example with
an auction bid. Note that you can put any bytes you want in the "note" field;
you don't have to use the NoteField object.

[embedmd]:# (example/notefield_example.dart)
```dart
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
```

### working with transaction group

[embedmd]:# (example/transaction_group_example.dart)
```dart
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
```

### working with logic sig

Example below creates a LogicSig transaction signed by a program that never
approves the transfer.

[embedmd]:# (example/logic_sig_example.dart)
```dart
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
```

### working with assets

Assets can be managed by sending three types of transactions: AssetConfigTxn,
AssetFreezeTxn, and AssetTransferTxn. Shown below are examples of how to use
these transactions.

#### creating an asset

[embedmd]:# (example/asset_create_example.dart)
```dart
import 'dart:convert';

import 'package:dart_algorand/dart_algorand.dart';

void main() async {
  final creator = generate_account();
  final freeze = generate_account();
  final manager = generate_account();
  final clawback = generate_account();
  final reserve = generate_account();

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';

  final total = 100; // how many of this asset there will be
  final assetName = 'assetname';
  final unitName = 'unitname';
  final url = 'website';

  final metadata = AsciiEncoder()
      .convert('fACPO4nRgO55j1ndAK3W6Sgc4APkcyFh'); // should be a 32-byte hash

  final defaultFrozen = false; // whether accounts should be frozen by default

// create the asset creation transaction
  final txn = AssetConfigTxn(
      sender: creator.address,
      fee: feePerByte,
      first_valid_round: firstValidRound,
      last_valid_round: lastValidRound,
      genesis_hash: genesisHash,
      total: total,
      manager: manager.address,
      reserve: reserve.address,
      freeze: freeze.address,
      clawback: clawback.address,
      unit_name: unitName,
      asset_name: assetName,
      url: url,
      metadata_hash: metadata,
      default_frozen: defaultFrozen);

// sign the transaction
  final signed_txn = txn.sign(creator.private_key);
}
```

#### updating asset configuration

This transaction must be sent from the manager's account.

[embedmd]:# (example/asset_update_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/asset_config_txn.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final managerPrivateKey = to_private_key(mnemonic);
  final managerAddress = address_from_private_key(managerPrivateKey);

  final newFreeze = generate_account();
  final newManager = generate_account();
  final newClawback = generate_account();
  final newReserve = generate_account();

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';

  final index = 1234; // identifying index of the asset

  // create the asset config transaction
  final txn = AssetConfigTxn(
      sender: managerAddress,
      fee: feePerByte,
      first_valid_round: firstValidRound,
      last_valid_round: lastValidRound,
      genesis_hash: genesisHash,
      manager: newManager.address,
      reserve: newReserve.address,
      freeze: newFreeze.address,
      clawback: newClawback.address,
      index: index);

  // sign the transction
  final signedTxn = txn.sign(managerPrivateKey);
}
```

#### destroying an asset

This transaction must be sent from the creator's account.

[embedmd]:# (example/asset_destroy_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/asset_config_txn.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final creatorPrivateKey = to_private_key(mnemonic);
  final creatorAddress = address_from_private_key(creatorPrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';

  final index = 1234; // identifying index of the asset

  // create the asset config transaction
  final txn = AssetConfigTxn(
      sender: creatorAddress,
      fee: feePerByte,
      first_valid_round: firstValidRound,
      last_valid_round: lastValidRound,
      genesis_hash: genesisHash,
      index: index,
      strict_empty_address_check: false);

  // sign the transction
  final signedTxn = txn.sign(creatorPrivateKey);
}
```

#### freezing or unfreezing an account

This transaction must be sent from the account specified as the freeze manager
for the asset.

[embedmd]:# (example/asset_freeze_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/asset_config_txn.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final freezePrivateKey = to_private_key(mnemonic);
  final freezeAddress = address_from_private_key(freezePrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';

  final index = 1234; // identifying index of the asset
  final freezeTarget = generate_account(); // address to be frozen or unfrozen

  // create the asset config transaction
  final txn = AssetFreezeTxn(
    sender: freezeAddress,
    fee: feePerByte,
    first_valid_round: firstValidRound,
    last_valid_round: lastValidRound,
    genesis_hash: genesisHash,
    index: index,
    target: freezeTarget.address,
    new_freeze_state: true,
  );

  // sign the transction
  final signedTxn = txn.sign(freezePrivateKey);
}
```

#### sending assets

[embedmd]:# (example/asset_send_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final senderPrivateKey = to_private_key(mnemonic);
  final senderAddress = address_from_private_key(senderPrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';
  final receiver = generate_account();
  final closeAssetsTo = generate_account();

  final index = 1234; // identifying index of the asset

  // create the asset config transaction
  final txn = AssetTransferTxn(
      sender: senderAddress,
      fee: feePerByte,
      first_valid_round: firstValidRound,
      last_valid_round: lastValidRound,
      genesis_hash: genesisHash,
      index: index,
      receiver: receiver.address,
      amt: 100,
      close_assets_to: closeAssetsTo.address);

  // sign the transction
  final signedTxn = txn.sign(senderPrivateKey);
}
```

#### accepting assets

[embedmd]:# (example/asset_accept_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final senderPrivateKey = to_private_key(mnemonic);
  final senderAddress = address_from_private_key(senderPrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';
  final index = 1234; // identifying index of the asset

  // create the asset config transaction
  final txn = AssetTransferTxn(
    sender: senderAddress,
    fee: feePerByte,
    first_valid_round: firstValidRound,
    last_valid_round: lastValidRound,
    genesis_hash: genesisHash,
    index: index,
    receiver:
        senderAddress, // to start accepting assets, set receiver to sender
    amt: 0, // to start accepting assets, set amount to 0
  );

  // sign the transction
  final signedTxn = txn.sign(senderPrivateKey);
}
```

#### revoking assets

This transaction must be sent by the asset's clawback manager.

[embedmd]:# (example/asset_revoke_example.dart)
```dart
import 'package:dart_algorand/dart_algorand.dart';

void main() async {
  final mnemonic =
      'such chapter crane ugly uncover fun kitten duty culture giant skirt '
      'reunion pizza pill web monster upon dolphin aunt close marble dune '
      'kangaroo ability merit';

  final clawbackPrivateKey = to_private_key(mnemonic);
  final clawbackAddress = address_from_private_key(clawbackPrivateKey);

  final feePerByte = 10;
  final firstValidRound = 1000;
  final lastValidRound = 2000;
  final genesisHash = 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=';
  final index = 1234; // identifying index of the asset
  final receiver = generate_account(); // where to send the revoked assets
  final targetAddress =
      'WO3QIJ6T4DZHBX5PWJH26JLHFSRT7W7M2DJOULPXDTUS6TUX7ZRIO4KDFY'; // address to revoke assets from.

  // create the asset config transaction
  final txn = AssetTransferTxn(
    sender: clawbackAddress,
    fee: feePerByte,
    first_valid_round: firstValidRound,
    last_valid_round: lastValidRound,
    genesis_hash: genesisHash,
    index: index,
    receiver: receiver.address,
    amt: 100,
    revocation_target: targetAddress,
  );

  // sign the transction
  final signedTxn = txn.sign(clawbackPrivateKey);
}
```

## Documentation

Documentation for Algorand Dart SDK API is available at
[pub.dev](https://pub.dev/documentation/dart_algorand/latest/).

## License

Dart Algorand SDK is licensed under a MIT license. See the LICENSE.txt file for
details.
