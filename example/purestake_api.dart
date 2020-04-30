// use PureStake API instead of your own node or sandbox - see https://developer.purestake.io/
import 'package:dart_algorand/dart_algorand.dart';

const algodUrl = 'https://testnet-algorand.api.purestake.io/ps1';
const algodHeaders = {
  'X-API-Key': 'your Purestake API key' // API key to get by signing in on https://developer.purestake.io/
};

void main() async {
  final acl = AlgodClient(url: algodUrl, headers: algodHeaders);

  print(await acl.status());
}