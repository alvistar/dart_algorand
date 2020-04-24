Dart Algorand SDK 

A Dart library for interacting with the Algorand network.

## Installation

TBD

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

Follow the instructions in Algorand's [developer resources](https://developer.algorand.org/docs/introduction-installing-node) to install a node on your computer.

## Running example.py

Before running examples/example.dart, start kmd:

```
$ ./goal kmd start -d [data directory]
```

Next, create a wallet and an account:

```
$ ./goal wallet new [wallet name] -d [data directory]
```

```
$ ./goal account new -d [data directory] -w [wallet name]
```

Visit the [Algorand dispenser](https://bank.testnet.algorand.network/) and enter the account address to fund your account.

Next, in examples/example.dart update the const to reflect your params.

You're now ready to run example.dart!

## More examples

### using the Wallet class
Instead of always having to keep track of handles, IDs, and passwords for wallets, create a Wallet object to manage everything for you.
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
  print ('Wallet name: ${info.wallet.name}');

  // create an account
  final address = await wallet.generateKey();
  print('New account: ${address}');

  // delete the account
  await wallet.deleteKey(address);
  print('Account deleted');
}
```

### backing up a wallet with mnemonic

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
```

### working with NoteField
We can put things in the "note" field of a transaction; here's an example with an auction bid. Note that you can put any bytes you want in the "note" field; you don't have to use the NoteField object.

```dart
import 'dart:convert';

import 'package:dart_algorand/dart_algorand.dart';

import 'params.dart';

void main() async {
  // create an algod client
  final acl = AlgodClient(token: algodToken, url: algodUrl);

  final mnemonic =
      'teach chat health avocado broken avocado trick adapt parade '
      'witness damp gift behave harbor maze truth figure below scatter taste '
      'slow sustain aspect absorb nuclear';

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
      amt: 10000
  );
  
  // sign it
  txn.sign(sk);
}
```

### working with transaction group
```python
import params
from algosdk import algod, kmd, transaction

private_key_sender, sender = account.generate_account()
private_key_receiver, receiver = account.generate_account()

# create an algod and kmd client
acl = algod.AlgodClient(params.algod_token, params.algod_address)
kcl = kmd.KMDClient(params.kmd_token, params.kmd_address)

# get suggested parameters
params = acl.suggested_params()
gen = params["genesisID"]
gh = params["genesishashb64"]
last_round = params["lastRound"]
fee = params["fee"]

# create a transaction
amount = 10000
txn1 = transaction.PaymentTxn(sender, fee, last_round, last_round+100, gh, receiver, amount)
txn2 = transaction.PaymentTxn(receiver, fee, last_round, last_round+100, gh, sender, amount)

# get group id and assign it to transactions
gid = transaction.calculate_group_id([txn1, txn2])
txn1.transaction.group = gid
txn2.transaction.group = gid

# sign transactions
stxn1 = txn1.sign(private_key_sender)
stxn2 = txn2.sign(private_key_receiver)

# send them over network
acl.send_transactions([stxn1, stxn2])
```

### working with logic sig

Example below creates a LogicSig transaction signed by a program that never approves the transfer.

```python
import params
from algosdk import algod, transaction

program = b"\x01\x20\x01\x00\x22"  # int 0
lsig = transaction.LogicSig(program)
sender = lsig.address()

# create an algod client
acl = algod.AlgodClient(params.algod_token, params.algod_address)

# get suggested parameters
params = acl.suggested_params()
gen = params["genesisID"]
gh = params["genesishashb64"]
last_round = params["lastRound"]
fee = params["fee"]

# create a transaction
amount = 10000
txn = transaction.PaymentTxn(sender, fee, last_round, last_round+100, gh, receiver, amount)

# note, transaction is signed by logic only (no delegation)
# that means sender address must match to program hash
lstx = transaction.LogicSigTransaction(txn, lsig)
assert lstx.verify()

# send them over network
acl.send_transaction(lstx)
```

### working with assets
Assets can be managed by sending three types of transactions: AssetConfigTxn, AssetFreezeTxn, and AssetTransferTxn. Shown below are examples of how to use these transactions.
#### creating an asset
```python
from algosdk import account, transaction

private_key, address = account.generate_account() # creator
_, freeze = account.generate_account() # account that can freeze other accounts for this asset
_, manager = account.generate_account() # account able to update asset configuration
_, clawback = account.generate_account() # account allowed to take this asset from any other account
_, reserve = account.generate_account() # account that holds reserves for this asset

fee_per_byte = 10
first_valid_round = 1000
last_valid_round = 2000
genesis_hash = "SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI="

total = 100 # how many of this asset there will be
assetname = "assetname"
unitname = "unitname"
url = "website"
metadata = bytes("fACPO4nRgO55j1ndAK3W6Sgc4APkcyFh", "ascii") # should be a 32-byte hash
default_frozen = False # whether accounts should be frozen by default

# create the asset creation transaction
txn = transaction.AssetConfigTxn(address, fee_per_byte, first_valid_round,
            last_valid_round, genesis_hash, total=total, manager=manager,
            reserve=reserve, freeze=freeze, clawback=clawback,
            unit_name=unitname, asset_name=assetname, url=url,
            metadata_hash=metadata, default_frozen=default_frozen)

# sign the transaction
signed_txn = txn.sign(private_key)
```
#### updating asset configuration
This transaction must be sent from the manager's account.
```python
from algosdk import account, transaction

manager_private_key = "manager private key"
manager_address = "manager address"
_, new_freeze = account.generate_account() # account that can freeze other accounts for this asset
_, new_manager = account.generate_account() # account able to update asset configuration
_, new_clawback = account.generate_account() # account allowed to take this asset from any other account
_, new_reserve = account.generate_account() # account that holds reserves for this asset

fee_per_byte = 10
first_valid_round = 1000
last_valid_round = 2000
genesis_hash = "SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI="

index = 1234 # identifying index of the asset

# create the asset config transaction
txn = transaction.AssetConfigTxn(manager_address, fee_per_byte, first_valid_round,
            last_valid_round, genesis_hash, manager=new_manager, reserve=new_reserve,
            freeze=new_freeze, clawback=new_clawback, index=index)

# sign the transaction
signed_txn = txn.sign(manager_private_key)
```

#### destroying an asset
This transaction must be sent from the creator's account.
```python
from algosdk import account, transaction

creator_private_key = "creator private key"
creator_address = "creator address"

fee_per_byte = 10
first_valid_round = 1000
last_valid_round = 2000
genesis_hash = "SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI="

index = 1234 # identifying index of the asset

# create the asset destroy transaction
txn = transaction.AssetConfigTxn(creator_address, fee_per_byte, first_valid_round, last_valid_round, genesis_hash,
                                         index=index, strict_empty_address_check=False)
# sign the transaction
signed_txn = txn.sign(creator_private_key)
```

#### freezing or unfreezing an account
This transaction must be sent from the account specified as the freeze manager for the asset.
```python
from algosdk import account, transaction

freeze_private_key = "freeze private key"
freeze_address = "freeze address"

fee_per_byte = 10
first_valid_round = 1000
last_valid_round = 2000
genesis_hash = "SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI="
freeze_target = "address to be frozen or unfrozen"

index = 1234 # identifying index of the asset

# create the asset freeze transaction
txn = transaction.AssetFreezeTxn(freeze_address, fee_per_byte, first_valid_round,
            last_valid_round, genesis_hash, index=index, target=freeze_target,
            new_freeze_state=True)

# sign the transaction
signed_txn = txn.sign(freeze_private_key)
```

#### sending assets
```python
from algosdk import account, transaction

sender_private_key = "freeze private key"
sender_address = "freeze address"

fee_per_byte = 10
first_valid_round = 1000
last_valid_round = 2000
genesis_hash = "SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI="
close_assets_to = "account to close assets to"
receiver = "account to receive assets"
amount = 100 # amount of assets to transfer

index = 1234 # identifying index of the asset

# create the asset transfer transaction
txn = transaction.AssetTransferTxn(sender_address, fee_per_byte, 
                first_valid_round, last_valid_round, genesis_hash,
                receiver, amount, index, close_assets_to)

# sign the transaction
signed_txn = txn.sign(sender_private_key)
```

#### accepting assets
```python
from algosdk import account, transaction

private_key = "freeze private key"
address = "freeze address"

fee_per_byte = 10
first_valid_round = 1000
last_valid_round = 2000
genesis_hash = "SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI="
receiver = address # to start accepting assets, set receiver to sender
amount = 0 # to start accepting assets, set amount to 0

index = 1234 # identifying index of the asset

# create the asset accept transaction
txn = transaction.AssetTransferTxn(address, fee_per_byte, 
                first_valid_round, last_valid_round, genesis_hash,
                receiver, amount, index)

# sign the transaction
signed_txn = txn.sign(private_key)
```

#### revoking assets
This transaction must be sent by the asset's clawback manager.
```python
from algosdk import account, transaction

clawback_private_key = "clawback private key"
clawback_address = "clawback address"

fee_per_byte = 10
first_valid_round = 1000
last_valid_round = 2000
genesis_hash = "SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI="
receiver = "receiver address" # where to send the revoked assets
target = "revocation target" # address to revoke assets from
amount = 100

index = 1234 # identifying index of the asset

# create the asset transfer transaction
txn = transaction.AssetTransferTxn(clawback_address, fee_per_byte, 
                first_valid_round, last_valid_round, genesis_hash,
                receiver, amount, index, revocation_target=target)

# sign the transaction
signed_txn = txn.sign(clawback_private_key)
```

## Documentation
Documentation for the Python SDK is available at [py-algorand-sdk.readthedocs.io](https://py-algorand-sdk.readthedocs.io/en/latest/).

## License
py-algorand-sdk is licensed under a MIT license. See the [LICENSE](https://github.com/algorand/py-algorand-sdk/blob/master/LICENSE) file for details.
