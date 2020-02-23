
import 'package:dart_algorand/algod.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'package:pinenacl/api.dart';
import 'package:pinenacl/signing.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';

import 'private.dart';


AlgodApi init_client () {
  final options = BaseOptions(
    baseUrl: 'http://algorand-testnet.beappia.com',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  final dio = Dio(options);
  dio.interceptors.add(InterceptorsWrapper(
      onRequest: (Options options) {
        options.headers['X-Algo-API-Token']=PRIVATE_TOKEN;
      },
      onError: (DioError e) {
        if (e.response != null) {
          print(e.response.data);
          print(e.response.headers);
          print(e.response.request);
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print(e.request);
          print(e.message);
        }

        return e;
      }
  ));

  return Openapi(dio: dio).getAlgodApi();
}

testing() {
  var t = PaymentTxn(
      sender: "BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU",
      receiver: "HQVYNUAJVOFZB4UUDZWAJ7I24SFXGPD2E3BOAZAPIMWOU2QEMY4TLLJVOE",
      fee: 1000,
      amt: 10000,
      first_valid_round: 4911793,
      last_valid_round: 4911793 + 1000,
      genesis_id: 'testnet-v1.0',
      genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=');

  decode_address("QF2K6DX4MA7QPUOLSHCBTU5MEPGRJPJ7D3FNCNI2UGX65CYWPAQ64AR2PA");

  final d = t.dictify();

  print(d);

  print(hex.encode(d['gh']));
  msgpack_encode(d);

  final key =
      "Qc/WKR2xehDjKWbcoo+qIpNf/jEHXNYRZ45Js5miplkUxxteOp7+WXpXQnZ6xc1YGazm9WNdA4koZvw+NKd5uw==";
  var priv_key = base64Decode(key);
  priv_key = priv_key.sublist(0, KEY_LEN_BYTES);

  final sk = SigningKey.fromSeed(priv_key);

  print('\nSigned message');

  final signed = sk.sign(Utf8Encoder().convert('hello'));

  print(hex.encode(signed.signature));

  final st = t.sign(key);

  print(st.dictify());

  print(t.get_txid());
}

main() async {
  // Configure Apiclient

  final api_instance = init_client();

  // Get params for transactions

  final params = (await api_instance.transactionParams()).data;

  print(params);

  // Build transaction

  final t = PaymentTxn(
      sender: "BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU",
      receiver: "HQVYNUAJVOFZB4UUDZWAJ7I24SFXGPD2E3BOAZAPIMWOU2QEMY4TLLJVOE",
      fee: params.minFee,
      amt: 10000,
      first_valid_round: params.lastRound,
      last_valid_round: params.lastRound+1000,
      genesis_id: params.genesisID,
      genesis_hash: params.genesishashb64);

  print(t.dictify());

  const PRIV_KEY = "ME81aVXutEYkMKdNjKHKaspLGH9+d2zQdTX8WbVazXwKBEAt4AJnurAze0nqc4cCTZUymYMxapHCMxo6qg6caQ==";

  // Sign transaction

  final st = t.sign(PRIV_KEY);

  print(st.dictify()['txn']);
  print(msgpack_encode(t));

  print("SIGNATURE:");

  print(hex.encode(st.dictify()['sig']));
  
  // Send transaction

  final rawtxn =base64Decode(msgpack_encode(st));

  final result = await api_instance.rawTransaction(rawtxn);


//  print(result);
  


}
