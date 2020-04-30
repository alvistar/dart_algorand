// create kmd and algod clients
import 'package:dart_algorand/dart_algorand.dart';
import 'params.dart';

void main() async {
  const newWalletName = 'wallet';
  const newWalletPassword = 'password';

  final kcl = KmdClient(token: kmdToken, url: kmdUrl);
  final acl = AlgodClient(token: algodToken, url: algodUrl);

  // get thw wallet ID
  final wallets = await kcl.listWallets();
  String existingWalletId;
  for (var w in wallets) {
    if (w.name == existingWalletName) {
      existingWalletId = w.id;
      break;
    }
  }

  // get a handle for existing wallet
  final existingHandle = await kcl.initWalletHandleToken(
      walledId: existingWalletId, walletPassword: existingWalletPassword);

  print("Got the wallet's handle: ${existingHandle}");

  // new wallet to create
  // check if the wallet already exists
  String walletId;
  for (var w in wallets) {
    if (w.name == newWalletName) {
      walletId = w.id;
      print("The wallet already exists, but let's just go with it!");
      break;
    }
  }

  // if it doesn't exist, create the wallet and get its ID
  if (walletId == null) {
    walletId = (await kcl.createWallet(
            name: newWalletName, password: newWalletPassword))
        .id;
    print('Walllet created!');
    print('Wallet ID: ${walletId}');
  }

  // get a handle for the wallet
  final handle = await kcl.initWalletHandleToken(
      walledId: walletId, walletPassword: newWalletPassword);
  print('Wallet handle token: ${handle}');

  // generate account offline and check if it's valid
  final account1 = generate_account();
  print('Private key: ${account1.private_key}');
  print('First account: ${account1.address}');

  // import generated key into the wallet
  await kcl.importKey(handle: handle, privateKey: account1.private_key);

  // generate account with kmd
  final address2 = await kcl.generateKey(handle: handle, displayMnemonic: false);
  print('Second account: ${address2}');

  // get the mnemonic for address1
  final mn = from_private_key(account1.private_key);
  print('Mnemonic for the first account: ${mn}');

  // get suggested params
  final params = await acl.transactionParams();

  // get last block info
  final blockInfo = await acl.blockInfo(params.lastRound);
  print('Block${params.lastRound} info:${blockInfo}');

  // create transaction
  final txn = PaymentTxn(
      sender: existingAccount,
      fee: params.fee,
      first_valid_round: params.lastRound,
      last_valid_round: params.lastRound + 100,
      genesis_hash: params.genesishashb64,
      receiver: account1.address,
      amt: 100000,
      genesis_id: params.genesisID);

  // sign transaction with kmd
  final signedWithKmd = await kcl.signTransaction(
      handle: existingHandle,
      password: existingWalletPassword,
      transaction: txn);

  // get private key for the existing account
  final privateKey = await kcl.exportKey(
      handle: existingHandle,
      password: existingWalletPassword,
      address: existingAccount);

  // sign transaction offline
  final signedOffline = txn.sign(privateKey);

  // check that they're the same
  if (msgpack_encode(signedOffline) == msgpack_encode(signedWithKmd)) {
    print('Signed transactions are the same!');
  } else {
    print("Well that's not so good...");
  }

  // send the transaction
  final transactionID = await acl.sendTransaction(signedWithKmd);
  print('Transaction was sent!');
  print('Transaction ID: ${transactionID}');

  // wait 2 rounds and then try to see the transaction
  print("Now let's wait a bit for the transaction to process.");
  await acl.statusAfterBlock(params.lastRound + 2);

  final txnInfo = await acl.transactionInfo(
      address: existingAccount, transactionID: transactionID);

  print('Transaction info: ${txnInfo}');

  // To see the new wallet and accounts that we've created, use goal:
  // $ ./goal wallet list
  // $ ./goal account list

  // now write your own!
}
