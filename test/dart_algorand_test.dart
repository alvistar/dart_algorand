import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:convert/convert.dart';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/account.dart';
import 'package:dart_algorand/src/asset_config_txn.dart';
import 'package:dart_algorand/src/asset_freeze_txn.dart';
import 'package:dart_algorand/src/asset_transfer_txn.dart';
import 'package:dart_algorand/src/logic.dart';
import 'package:dart_algorand/src/logic_sig.dart';
import 'package:dart_algorand/src/logic_sig_txn.dart';
import 'package:dart_algorand/src/mnemonic.dart' as mnemonic;
import 'package:dart_algorand/src/multisig_txn.dart';
import 'package:dart_algorand/src/template.dart';
import 'package:dart_algorand/src/template_htlc.dart';
import 'package:dart_algorand/src/template_split.dart';
import 'package:dart_algorand/src/wordlist.dart';
import 'package:test/test.dart';
import 'package:base32/base32.dart';

void main() {
  group('A group of tests', () {
    setUp(() {});

    test('parseUrl', () {
      final result = parseUrl(
          'algorand://NMCHCPELNTYXRIHIVN3PE5NL5DFCBWDGSR4S7DQZDPV5XYVGSU4B6UEDIY?amount=100');
      expect(result.address,
          'NMCHCPELNTYXRIHIVN3PE5NL5DFCBWDGSR4S7DQZDPV5XYVGSU4B6UEDIY');
      expect(result.amount, 100);
    });

    test('parseUrl with no amount', () {
      final result = parseUrl(
          'algorand://NMCHCPELNTYXRIHIVN3PE5NL5DFCBWDGSR4S7DQZDPV5XYVGSU4B6UEDIY');
      expect(result.address,
          'NMCHCPELNTYXRIHIVN3PE5NL5DFCBWDGSR4S7DQZDPV5XYVGSU4B6UEDIY');
      expect(result.amount, 0);
    });

    test('parseUrl wrong address', () {
      final result = parseUrl(
          'algorand://NMCHCPELTYXRIHIVN3PE5NL5DFCBWDGSR4S7DQZDPV5XYVGSU4B6UEDIY');
      expect(result, isNull);
    });

    test('encode transaction', () {
      final note = utf8.encode("Hello World");

      var t = PaymentTxn(
        sender: "BICEALPAAJT3VMBTPNE6U44HAJGZKMUZQMYWVEOCGMNDVKQOTRU7OUXAZU",
        receiver: "HQVYNUAJVOFZB4UUDZWAJ7I24SFXGPD2E3BOAZAPIMWOU2QEMY4TLLJVOE",
        fee: 1000,
        amt: 10000,
        note: note,
        first_valid_round: 10,
        last_valid_round: 1000,
        genesis_id: 'testnet-v1.0',
        genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
        flat_fee: true,
      );

      expect(msgpack_encode(t),
          'iqNhbXTNJxCjZmVlzQPoomZ2CqNnZW6sdGVzdG5ldC12MS4womdoxCBIY7UYpLPITsgQ8i1PEIHLD3HwWaesIN7GL39w5Qk6IqJsds0D6KRub3RlxAtIZWxsbyBXb3JsZKNyY3bEIDwrhtAJq4uQ8pQebAT9GuSLczx6JsLgZA9DLOpqBGY5o3NuZMQgCgRALeACZ7qwM3tJ6nOHAk2VMpmDMWqRwjMaOqoOnGmkdHlwZaNwYXk=');
    });
  });

  group('Logic Signatures', () {
    test('basic', () {
      expect(() => LogicSig(program: Uint8List(0)),
          throwsA(isA<InvalidProgram>()));

      var program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x22]);
      final program_hash = '6Z3C3LDVWGMX23BMSYMANACQOSINPFIRF77H7N3AWJZYV6OH6GWTJKVMXY';
      final public_key = decode_address(program_hash);
      var lsig = LogicSig(program: program);
      expect(lsig.program, program);
      expect(lsig.args, null);
      expect(lsig.sig, null);
      expect(lsig.msig, null);

      expect(lsig.verify(public_key), isTrue);
      expect(lsig.address(), program_hash);

      final args = <Uint8List>[
        Uint8List.fromList([1, 2, 3]),
        Uint8List.fromList([4, 5, 6])
      ];

      lsig = LogicSig(program: program, args: args);
      expect(lsig.program, program);
      expect(lsig.args, args);
      expect(lsig.sig, null);
      expect(lsig.msig, null);
      expect(lsig.verify(public_key), isTrue);

      // check serialization
      final encoded = msgpack_encode(lsig);
      final decoded = msgpack_decode(encoded);
      expect(decoded.dictify(), lsig.dictify());
      expect(lsig.verify(public_key), isTrue);

      // check signature verification on modified program
      program = Uint8List.fromList([0x01, 0x20, 0x01, 0x03, 0x22]);
      lsig = LogicSig(program: program);
      expect(lsig.program, program);
      expect(lsig.verify(public_key), isFalse);
      expect(lsig.address(), isNot(program_hash));

      // check invalid program fails
      program = Uint8List.fromList([0x00, 0x20, 0x01, 0x03, 0x22]);
      lsig = LogicSig(program: program);
      expect(lsig.verify(public_key), isFalse);
    });

    test('signature', () {
      final account = generate_account();
      final public_key = decode_address(account.address);
      final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x22]);
      final lsig = LogicSig(program: program);
      lsig.sign(private_key: account.private_key);

      expect(lsig.program, program);
      expect(lsig.args, isNull);
      expect(lsig.msig, isNull);
      expect(lsig.sig, isNotNull);
      expect(lsig.verify(public_key), isTrue);

      // Check serialization
      final encoded = msgpack_encode(lsig);
      final decoded = msgpack_decode(encoded);
      expect(decoded.dictify(), lsig.dictify());
    });

    test('multisig', () {
      final account = generate_account();
      final account_1 = generate_account();
      final account_2 = generate_account();

      // create multisig address with invalid version
      final msig = Multisig(version: 1,
          threshold: 2,
          addresses: [account_1.address, account_2.address]);

      final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x22]);
      final lsig = LogicSig(program: program);
      lsig.sign(private_key: account_1.private_key, multisig: msig);
      expect(lsig.program, program);
      expect(lsig.args, isNull);
      expect(lsig.sig, isNull);
      expect(lsig.msig, isNotNull);

      final sender_addr = msig.address();
      final public_key = decode_address(sender_addr);
      expect(lsig.verify(public_key), isFalse); // not enough signatures

      expect(() => lsig.append_to_multisig(account.private_key),
          throwsA(isA<InvalidSecretKeyError>()));

      lsig.append_to_multisig(account_2.private_key);
      expect(lsig.verify(public_key), isTrue);

      // combine sig and multisig, ensure it fails
      final lsigf = LogicSig(program: program);
      lsigf.sign(private_key: account.private_key);
      lsig.sig = lsigf.sig;
      expect(lsig.verify(public_key), isFalse);

      // remove, ensure it still works
      lsig.sig = null;
      expect(lsig.verify(public_key), isTrue);

      // check serialization
      final encoded = msgpack_encode(lsig);
      final decoded = msgpack_decode(encoded);

      // TODO: Implements equatable in subclasses

      expect(decoded.dictify(), lsig.dictify());
    });

    test('transaction', () {
      final from_address = '47YPQTIGQEO7T4Y4RWDYWEKV6RTR2UNBQXBABEEGM72ESWDQNCQ52OPASU';
      final to_address = 'PNWOET7LLOWMBMLE4KOCELCX6X3D3Q4H2Q4QJASYIEOF7YIPPQBG3YQ5YI';
      final mn = 'advice pudding treat near rule blouse same whisper inner electric'
          ' quit surface sunny dismiss leader blood seat clown cost exist ho'
          'spital century reform able sponsor';

      final tx = PaymentTxn(
          sender: from_address,
          fee: 1000,
          first_valid_round: 2063137,
          last_valid_round: 2063137 + 1000,
          genesis_hash: 'sC3P7e2SdbqKJK0tbiCdK9tdSpbe6XeCGKdoNzmlj0E=',
          receiver: to_address,
          amt: 2000,
          note: base64Decode('8xMCTuLQ810='),
          genesis_id: 'devnet-v1.0',
          flat_fee: true
      );

      final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x22]);
      final args = <Uint8List>[
        utf8.encode('123'),
        utf8.encode('456'),
      ];

      final sk = mnemonic.to_private_key(mn);
      final lsig = LogicSig(program: program, args: args);
      lsig.sign(private_key: sk);
      final lstx = LogicSigTransaction(transaction: tx, lsig: lsig);
      expect(lstx.verify(), isTrue);

      final golden = 'gqRsc2lng6NhcmeSxAMxMjPEAzQ1NqFsxAUBIAEBIqNzaWfEQE6HXaI5K0lcq5' +
          '0o/y3bWOYsyw9TLi/oorZB4xaNdn1Z14351u2f6JTON478fl+JhIP4HNRRAIh/'
              'I8EWXBPpJQ2jdHhuiqNhbXTNB9CjZmVlzQPoomZ2zgAfeyGjZ2Vuq2Rldm5ldC'
              '12MS4womdoxCCwLc/t7ZJ1uookrS1uIJ0r211Klt7pd4IYp2g3OaWPQaJsds4A'
              'H38JpG5vdGXECPMTAk7i0PNdo3JjdsQge2ziT+tbrMCxZOKcIixX9fY9w4fUOQ'
              'SCWEEcX+EPfAKjc25kxCDn8PhNBoEd+fMcjYeLEVX0Zx1RoYXCAJCGZ/RJWHBo'
              'oaR0eXBlo3BheQ==';

      expect(msgpack_encode(lstx), golden);
    });
  });

  group('Logic', () {
    test('parse uvarint', () {
      var data = Uvarint(Uint8List.fromList([0x01]));
      expect(data.length, 1);
      expect(data.value, 1);

      data = Uvarint(Uint8List.fromList([0x7b]));
      expect(data.length, 1);
      expect(data.value, 123);

      data = Uvarint(Uint8List.fromList([0xc8, 0x03]));
      expect(data.length, 2);
      expect(data.value, 456);
    });

    test('parse intcblock', () {
      final data = Uint8List.fromList(
          [0x20, 0x05, 0x00, 0x01, 0xc8, 0x03, 0x7b, 0x02]);

      final results = read_int_const_block(data, 0);
      expect(results.size, data.length);
      expect(results.results, containsAllInOrder([0, 1, 456, 123, 2]));
    });

    test('parse bytecblock', () {
      final data = Uint8List.fromList(
          [0x026, 0x02, 0x0d, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38,
            0x39, 0x30, 0x31, 0x32, 0x33, 0x02, 0x01, 0x02]);

      final expected = <Uint8List>[
        Uint8List.fromList([0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38,
          0x39, 0x30, 0x31, 0x32, 0x33]),
        Uint8List.fromList([0x1, 0x2])
      ];

      final results = read_byte_const_block(data, 0);

      expect(results.size, data.length);
      expect(results.results, containsAllInOrder(expected));
    });

    test('check_program_valid', () {
      final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x22]);

      // Null argument
      var program_data = read_program(program, null);
      expect(program_data.good, true);
      expect(program_data.int_block, containsAllInOrder([1]));
      expect(program_data.byte_block, isEmpty);

      // No argument
      var args = <Uint8List>[];
      program_data = read_program(program, args);
      expect(program_data.good, true);
      expect(program_data.int_block, containsAllInOrder([1]));
      expect(program_data.byte_block, isEmpty);

      // Unused argument
      final arg = Uint8List.fromList(List.filled(10, 0x31));
      args.add(arg);
      program_data = read_program(program, args);
      expect(program_data.good, true);
      expect(program_data.int_block, containsAllInOrder([1]));
      expect(program_data.byte_block, isEmpty);

      // ???
      final int1 = Uint8List.fromList(List.filled(10, 0x22));
      final program2 = Uint8List.fromList(program + int1);

      program_data = read_program(program2, args);
      expect(program_data.good, true);
      expect(program_data.int_block, containsAllInOrder([1]));
      expect(program_data.byte_block, isEmpty);
    });

    test('check program long args', () async {
      final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x22]);
      final args = <Uint8List>[];
      final arg = Uint8List.fromList(List.filled(1000, 0x31));
      args.add(arg);

      expect(() async => await read_program(program, args),
          throwsA(predicate((e) =>
          e is InvalidProgram &&
              e.message == 'program too long')));
    });

    test('check program long', () {
      final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x22]);
      final int1 = Uint8List(1000);
      final program2 = Uint8List.fromList(program + int1);

      expect(() async => await read_program(program2, []),
          throwsA(predicate((e) =>
          e is InvalidProgram &&
              e.message == 'program too long')));
    });

    test('check program invalid opcode', () {
      final program = Uint8List.fromList([0x01, 0x20, 0x01, 0x01, 0x81]);
      final args = <Uint8List>[];

      expect(() async => await read_program(program, args),
          throwsA(predicate((e) =>
          e is InvalidProgram &&
              e.message == 'invalid instruction 129')));
    });

    test('check program costly', () async {
      final program = Uint8List.fromList(
          [0x01, 0x26, 0x01, 0x01, 0x01, 0x01, 0x28, 0x02]);

      expect(await check_program(program, []), isTrue);

      final keccak25610 = Uint8List.fromList(List.filled(10, 0x02));

      final program2 = Uint8List.fromList(program + keccak25610);
      expect(await check_program(program2, []), isTrue);

      final keccak256800 = Uint8List.fromList(List.filled(800, 0x02));
      final program3 = Uint8List.fromList(program + keccak256800);

      expect(() async => await read_program(program3, []),
          throwsA(predicate((e) =>
          e is InvalidProgram &&
              e.message == 'program too costly to run')));
    });
  });

  group('Sign Bytes', () {
    test('sign', () {
      final account = generate_account();
      final random = Random();
      final message = List<int>.generate(15, (_) => random.nextInt(255));
    });
  });

  group('Multisig', () {
    test('merge', () {
      final msig = Multisig(
          version: 1,
          threshold: 2,
          addresses: [
            'DN7MBMCL5JQ3PFUQS7TMX5AH4EEKOBJVDUF4TCV6WERATKFLQF4MQUPZTA',
            'BFRTECKTOOE7A5LHCF3TTEOH2A7BW46IYT2SX5VP6ANKEXHZYJY77SJTVM',
            '47YPQTIGQEO7T4Y4RWDYWEKV6RTR2UNBQXBABEEGM72ESWDQNCQ52OPASU'
          ]
      );

      final mn = 'auction inquiry lava second expand liberty glass involve '
          'ginger illness length room item discover ahead table doctor '
          'term tackle cement bonus profit right above catch';

      final sk = mnemonic.to_private_key(mn);

      final txn = PaymentTxn(
          sender: 'RWJLJCMQAFZ2ATP2INM2GZTKNL6OULCCUBO5TQPXH3V2KR4AG7U5UA5JNM',
          fee: 0,
          first_valid_round: 62229,
          last_valid_round: 63229,
          genesis_hash: '/rNsORAUOQDD2lVCyhg2sA/S+BlZElfNI/YEL5jINp0=',
          receiver: 'PNWOET7LLOWMBMLE4KOCELCX6X3D3Q4H2Q4QJASYIEOF7YIPPQBG3YQ5YI',
          amt: 1000,
          note: base64Decode('RSYiABhShvs='),
          genesis_id: 'devnet-v38.0',
          close_remainder_to: 'IDUTJEUIEVSMXTU4LGTJWZ2UE2E6TIODUKU6UW3FU3UKIQQ77RLUBBBFLA'
      );

      final mtx = MultisigTransaction(transaction: txn, multisig: msig);
      mtx.sign(sk);

      final golden = 'gqRtc2lng6ZzdWJzaWeTgqJwa8QgG37AsEvqYbeWkJfmy/QH4QinBTUdC'
          '8mKvrEiCairgXihc8RAuLAFE0oma0skOoAmOzEwfPuLYpEWl4LINtsiLr'
          'UqWQkDxh4WHb29//YCpj4MFbiSgD2jKYt0XKRD86zKCF4RDYGicGvEIAl'
          'jMglTc4nwdWcRdzmRx9A+G3PIxPUr9q/wGqJc+cJxgaJwa8Qg5/D4TQaB'
          'HfnzHI2HixFV9GcdUaGFwgCQhmf0SVhwaKGjdGhyAqF2AaN0eG6Lo2Ftd'
          'M0D6KVjbG9zZcQgQOk0koglZMvOnFmmm2dUJonpocOiqepbZabopEIf/F'
          'ejZmVlzQPoomZ2zfMVo2dlbqxkZXZuZXQtdjM4LjCiZ2jEIP6zbDkQFDk'
          'Aw9pVQsoYNrAP0vgZWRJXzSP2BC+YyDadomx2zfb9pG5vdGXECEUmIgAY'
          'Uob7o3JjdsQge2ziT+tbrMCxZOKcIixX9fY9w4fUOQSCWEEcX+EPfAKjc'
          '25kxCCNkrSJkAFzoE36Q1mjZmpq/OosQqBd2cH3PuulR4A36aR0eXBlo3'
          'BheQ==';

      expect(msgpack_encode(mtx), golden);

      final mtx_2 = MultisigTransaction(
          transaction: txn, multisig: msig.get_multisig_account());

      final mn2 = 'since during average anxiety protect cherry club long '
          'lawsuit loan expand embark forum theory winter park twenty '
          'ball kangaroo cram burst board host ability left';

      final sk2 = mnemonic.to_private_key(mn2);

      mtx_2.sign(sk2);

      final mtx_final = MultisigTransaction.merge([mtx, mtx_2]);

      final golden2 = 'gqRtc2lng6ZzdWJzaWeTgqJwa8QgG37AsEvqYbeWkJfmy/QH4QinBTUd'
          'C8mKvrEiCairgXihc8RAuLAFE0oma0skOoAmOzEwfPuLYpEWl4LINtsi'
          'LrUqWQkDxh4WHb29//YCpj4MFbiSgD2jKYt0XKRD86zKCF4RDYKicGvE'
          'IAljMglTc4nwdWcRdzmRx9A+G3PIxPUr9q/wGqJc+cJxoXPEQBAhuyRj'
          'sOrnHp3s/xI+iMKiL7QPsh8iJZ22YOJJP0aFUwedMr+a6wfdBXk1Oefy'
          'rAN1wqJ9rq6O+DrWV1fH0ASBonBrxCDn8PhNBoEd+fMcjYeLEVX0Zx1R'
          'oYXCAJCGZ/RJWHBooaN0aHICoXYBo3R4boujYW10zQPopWNsb3NlxCBA'
          '6TSSiCVky86cWaabZ1Qmiemhw6Kp6ltlpuikQh/8V6NmZWXNA+iiZnbN'
          '8xWjZ2VurGRldm5ldC12MzguMKJnaMQg/rNsORAUOQDD2lVCyhg2sA/S'
          '+BlZElfNI/YEL5jINp2ibHbN9v2kbm90ZcQIRSYiABhShvujcmN2xCB7'
          'bOJP61uswLFk4pwiLFf19j3Dh9Q5BIJYQRxf4Q98AqNzbmTEII2StImQ'
          'AXOgTfpDWaNmamr86ixCoF3Zwfc+66VHgDfppHR5cGWjcGF5';

      expect(msgpack_encode(mtx_final), golden2);
    });
    test('sign', () {
      final msig = Multisig(
          version: 1,
          threshold: 2,
          addresses: [
            'DN7MBMCL5JQ3PFUQS7TMX5AH4EEKOBJVDUF4TCV6WERATKFLQF4MQUPZTA',
            'BFRTECKTOOE7A5LHCF3TTEOH2A7BW46IYT2SX5VP6ANKEXHZYJY77SJTVM',
            '47YPQTIGQEO7T4Y4RWDYWEKV6RTR2UNBQXBABEEGM72ESWDQNCQ52OPASU'
          ]);

      final mn = 'advice pudding treat near rule blouse same whisper inner '
          'electric quit surface sunny dismiss leader blood seat clown '
          'cost exist hospital century reform able sponsor';

      final sk = mnemonic.to_private_key(mn);

      final txn = PaymentTxn(
          sender: msig.address(),
          fee: 4,
          first_valid_round: 12466,
          last_valid_round: 13466,
          genesis_hash: 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=',
          receiver: 'PNWOET7LLOWMBMLE4KOCELCX6X3D3Q4H2Q4QJASYIEOF7YIPPQBG3YQ5YI',
          amt: 1000,
          note: base64Decode('X4Bl4wQ9rCo='),
          genesis_id: 'devnet-v33.0',
          close_remainder_to: 'IDUTJEUIEVSMXTU4LGTJWZ2UE2E6TIODUKU6UW3FU3UKIQQ77RLUBBBFLA'
      );

      final mtx = MultisigTransaction(transaction: txn, multisig: msig);
      mtx.sign(sk);

      final golden = 'gqRtc2lng6ZzdWJzaWeTgaJwa8QgG37AsEvqYbeWkJfmy/QH4QinBTUdC'
          '8mKvrEiCairgXiBonBrxCAJYzIJU3OJ8HVnEXc5kcfQPhtzyMT1K/av8B'
          'qiXPnCcYKicGvEIOfw+E0GgR358xyNh4sRVfRnHVGhhcIAkIZn9ElYcGi'
          'hoXPEQF6nXZ7CgInd1h7NVspIPFZNhkPL+vGFpTNwH3Eh9gwPM8pf1EPT'
          'HfPvjf14sS7xN7mTK+wrz7Odhp4rdWBNUASjdGhyAqF2AaN0eG6Lo2Ftd'
          'M0D6KVjbG9zZcQgQOk0koglZMvOnFmmm2dUJonpocOiqepbZabopEIf/F'
          'ejZmVlzQSYomZ2zTCyo2dlbqxkZXZuZXQtdjMzLjCiZ2jEICYLIAmgk6i'
          'Gi3lYci+l5Ubt5+0X5NhcTHivsEUmkO3Somx2zTSapG5vdGXECF+AZeME'
          'Pawqo3JjdsQge2ziT+tbrMCxZOKcIixX9fY9w4fUOQSCWEEcX+EPfAKjc'
          '25kxCCNkrSJkAFzoE36Q1mjZmpq/OosQqBd2cH3PuulR4A36aR0eXBlo3'
          'BheQ==';

      expect(msgpack_encode(mtx), golden);

      final txid_golden = 'TDIO6RJWJIVDDJZELMSX5CPJW7MUNM3QR4YAHYAKHF3W2CFRTI7A';
      expect(txn.get_txid(), txid_golden);
    });

    test('Msig address', () {
      final msig = Multisig(
          version: 1,
          threshold: 2,
          addresses: [
            'XMHLMNAVJIMAW2RHJXLXKKK4G3J3U6VONNO3BTAQYVDC3MHTGDP3J5OCRU',
            'HTNOX33OCQI2JCOLZ2IRM3BC2WZ6JUILSLEORBPFI6W7GU5Q4ZW6LINHLA',
            'E6JSNTY4PVCY3IRZ6XEDHEO6VIHCQ5KGXCIQKFQCMB2N6HXRY4IB43VSHI']
      );

      final golden = 'UCE2U2JC4O4ZR6W763GUQCG57HQCDZEUJY4J5I6VYY4HQZUJDF7AKZO5GM';
      expect(msig.address(), golden);

      final msig2 = Multisig(
          version: 1,
          threshold: 2,
          addresses: [
            'DN7MBMCL5JQ3PFUQS7TMX5AH4EEKOBJVDUF4TCV6WERATKFLQF4MQUPZTA',
            'BFRTECKTOOE7A5LHCF3TTEOH2A7BW46IYT2SX5VP6ANKEXHZYJY77SJTVM',
            '47YPQTIGQEO7T4Y4RWDYWEKV6RTR2UNBQXBABEEGM72ESWDQNCQ52OPASU']
      );

      final golden2 = 'RWJLJCMQAFZ2ATP2INM2GZTKNL6OULCCUBO5TQPXH3V2KR4AG7U5UA5JNM';
      expect(msig2.address(), golden2);
    });

    test('errors', () {
      // get random private key
      final account_1 = generate_account();
      final account_2 = generate_account();
      final account_3 = generate_account();

      // create transaction

      final txn = PaymentTxn(
          sender: account_2.address,
          fee: 3,
          first_valid_round: 1234,
          last_valid_round: 1334,
          genesis_hash: 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=',
          receiver: account_2.address,
          amt: 1000
      );

      //  create multisig address with invalid version
      final msig = Multisig(
          version: 2,
          threshold: 2,
          addresses: [account_1.address, account_2.address]
      );

      expect(() => msig.validate(), throwsA(isA<UnknownMsigVersionError>()));

      // change it to have invalid threshold
      msig.version = 1;
      msig.threshold = 3;

      expect(() => msig.validate(), throwsA(isA<InvalidThresholdError>()));

      // try to sign multisig transaction
      msig.threshold = 2;
      var mtx = MultisigTransaction(transaction: txn, multisig: msig);

      expect(() => mtx.sign(account_1.private_key),
          throwsA(isA<BadTxnSenderError>()));

      // change sender address to be correct
      txn.sender = msig.address();
      mtx = MultisigTransaction(transaction: txn, multisig: msig);

      // try to sign with incorrect private key
      expect(() => mtx.sign(account_3.private_key),
          throwsA(isA<InvalidSecretKeyError>()));

      // create another multisig with different address
      final msig_2 = Multisig(
          version: 1,
          threshold: 2,
          addresses: [account_2.address, account_3.address]
      );

      // try to merge with different addresses
      final mtx_2 = MultisigTransaction(transaction: txn, multisig: msig_2);

      expect(() => MultisigTransaction.merge([mtx, mtx_2]),
          throwsA(isA<MergeKeysMismatchError>()));

      // create another multisig with same address
      final msig_3 = msig_2.get_multisig_account();

      // add mismatched signatures
      msig_2.subsigs[0].signature = Utf8Encoder().convert('sig2');
      msig_3.subsigs[0].signature = Utf8Encoder().convert('sig3');

      // try to merge
      expect(() =>
          MultisigTransaction.merge(
              [MultisigTransaction(transaction: txn, multisig: msig_2),
                MultisigTransaction(transaction: txn, multisig: msig_3)]),
          throwsA(isA<DuplicateSigMismatchError>()));
    });
  });

  group('Mnemonic', () {
    test('Private key from mnemonic', () {
      final mn =
      ('awful drop leaf tennis indoor begin mandate discover uncle se' +
          'ven only coil atom any hospital uncover make any climb actor ' +
          'armed measure need above hundred');

      expect(mnemonic.to_private_key(mn),
          'hdhQ/fKNOVHg8D5kLzE21SKHKLyt7DSMAlYq4IUnepIJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/Q==');
    });

    test('Private key from/to', () {
      final account = generate_account();
      final mn = mnemonic.from_private_key(account.private_key);
      expect(mn
          .split(' ')
          .length, MNEMONIC_LEN);
      expect(account.private_key, mnemonic.to_private_key(mn));
    });

    test('Zero mnemnonic', () {
      final zero_bytes = Uint8List(32);
      zero_bytes.fillRange(0, 31, 0);
      final expected_mnemonic = ('abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon invest');
      final result = mnemonic.from_key(zero_bytes);
      expect(expected_mnemonic, result);
      expect(mnemonic.to_key(result), zero_bytes);
    });

    test('Wrong checksum', () {
      final mn = ('abandon abandon abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon');

      expect(() => mnemonic.to_key(mn), throwsA(isA<WrongChecksumError>()));
    });

    test('Word not in list', () {
      final mn = ('abandon abandon abandon abandon abandon abandon abandon '
          'abandon abandon abandon abandon abandon abandon abandon '
          'abandon abandon abandon venues abandon abandon abandon '
          'abandon abandon abandon invest');
      expect(() => mnemonic.to_key(mn), throwsA(isA<WordNotInList>()));
    });

    test('Word list', () {
      final result =
      mnemonic.mnemonicChecksum(Utf8Encoder().convert(WORD_LIST_RAW));

      expect(result, 'venue');
    });

    test('Wrong length', () {
      final mn = 'abandon abandon abandon';
      expect(
              () => mnemonic.to_key(mn),
          throwsA(isA<WrongMnemonicLengthError>()));
    });

    test('Bytes wrong len', () {
      final zero_bytes = Uint8List(31);
      zero_bytes.fillRange(0, 30, 0);

      expect(() => mnemonic.from_key(zero_bytes),
          throwsA(isA<WrongKeyBytesLengthError>()));
    });
  });

  group('Address', () {
    test('Encode Decode', () {
      final account = generate_account();
      expect(account.address, encode_address(decode_address(account.address)));
    });

    test('Is valid', () {
      final valid = 'MO2H6ZU47Q36GJ6GVHUKGEBEQINN7ZWVACMWZQGIYUOE3RBSRVYHV4ACJI';
      expect(is_valid_address(valid), isTrue);
      final invalid = 'MO2H6ZU47Q36GJ6GVHUKGEBEQINN7ZWVACMWZQGIYUOE3RBSRVYHV4ACJG';
      expect(is_valid_address(invalid), isFalse);
    });
  });

  group('MsgPack', () {
    test('Bid', () {
      final bid = 'gqFigqNiaWSGo2FpZAGjYXVjxCCokNFWl9DCqHrP9trjPICAMGOaRoX/OR+'
          'M6tHWhfUBkKZiaWRkZXLEIP1rCXe2x5+exPBfU3CZwGPMY8mzwvglET+Qtg'
          'fCPdCmo2N1cs8AAADN9kTOAKJpZM5JeDcCpXByaWNlzQMgo3NpZ8RAiR06J'
          '4suAixy13BKHlw4VrORKzLT5CJr9n3YSj0Ao6byV23JHGU0yPf7u9/o4ECw'
          '4Xy9hc9pWopLW97xKXRfA6F0oWI=';

      expect(msgpack_encode(msgpack_decode(bid)), bid);
    });

    test('Signed Txn', () {
      final stxn = 'gqNzaWfEQGdpjnStb70k2iXzOlu+RSMgCYLe25wkUfbgRsXs7jx6rbW61i'
          'vCs6/zGs3gZAZf4L2XAQak7OjMh3lw9MTCIQijdHhuiaNhbXTOAAGGoKNm'
          'ZWXNA+iiZnbNcl+jZ2Vuq25ldHdvcmstdjM4omdoxCBN/+nfiNPXLbuigk'
          '8M/TXsMUfMK7dV//xB1wkoOhNu9qJsds1yw6NyY3bEIPRUuVDPVUFC7Jk3'
          '+xDjHJfwWFDp+Wjy+Hx3cwL9ncVYo3NuZMQgGC5kQiOIPooA8mrvoHRyFt'
          'k27F/PPN08bAufGhnp0BGkdHlwZaNwYXk=';

      expect(msgpack_encode(msgpack_decode(stxn)), stxn);
    });

    test('Payment txn', () {
      final paytxn = 'iaNhbXTOAAGGoKNmZWXNA+iiZnbNcq2jZ2Vuq25ldHdvcmstdjM4omdo'
          'xCBN/+nfiNPXLbuigk8M/TXsMUfMK7dV//xB1wkoOhNu9qJsds1zEaNy'
          'Y3bEIAZ2cvp4J0OiBy5eAHIX/njaRko955rEdN4AUNEl4rxTo3NuZMQg'
          'GC5kQiOIPooA8mrvoHRyFtk27F/PPN08bAufGhnp0BGkdHlwZaNwYXk=';

      expect(msgpack_encode(msgpack_decode(paytxn)), paytxn);
    });

    test('Multisig txn', () {
      final msigtxn = 'gqRtc2lng6ZzdWJzaWeSgqJwa8Qg1ke3gkLuR0MUN/Ku0oyiRVIm9P1'
          'QFDaiEhT5vtfLmd+hc8RAIEbfnhccjWfYQFQp/P4aJjATFdgaDDpnhy'
          'JF0tU/37CO5I5hhoCvUCRH/A/6X94Ewz9YEtk5dANEGKQW+/WyAIKic'
          'GvEIKgAZfZ4iDC+UY/P5F3tgs5rqeyYt08LT0c/D78u0V7KoXPEQCxU'
          'kQgTVC9lLpKVzcZGKesSCQcZL9UjXTzrteADicvcca7KT3WP0crGgAf'
          'J3a17Na5cykJzFEn7pq2SHgwD/QujdGhyAqF2AaN0eG6Jo2FtdM0D6K'
          'NmZWXNA+iiZnbNexSjZ2Vuq25ldHdvcmstdjM4omdoxCBN/+nfiNPXL'
          'buigk8M/TXsMUfMK7dV//xB1wkoOhNu9qJsds17eKNyY3bEIBguZEIj'
          'iD6KAPJq76B0chbZNuxfzzzdPGwLnxoZ6dARo3NuZMQgpuIJvJzW8E4'
          'uxsQGCW0S3n1u340PbHTB2zhtXo/AiI6kdHlwZaNwYXk=';

      expect(msgpack_encode(msgpack_decode(msigtxn)), msigtxn);
    });

    test('Keyreg txn', () {
      final keyregtxn = 'jKNmZWXNA+iiZnbNcoqjZ2Vuq25ldHdvcmstdjM4omdoxCBN/+nfi'
          'NPXLbuigk8M/TXsMUfMK7dV//xB1wkoOhNu9qJsds1y7qZzZWxrZX'
          'nEIBguZEIjiD6KAPJq76B0chbZNuxfzzzdPGwLnxoZ6dARo3NuZMQ'
          'gGC5kQiOIPooA8mrvoHRyFtk27F/PPN08bAufGhnp0BGkdHlwZaZr'
          'ZXlyZWendm90ZWZzdM1yiqZ2b3Rla2TNMDmndm90ZWtlecQgGC5kQ'
          'iOIPooA8mrvoHRyFtk27F/PPN08bAufGhnp0BGndm90ZWxzdM1y7g==';

      expect(msgpack_encode(msgpack_decode(keyregtxn)), keyregtxn);
    });

    test('Asset create', () {
      final golden = 'gqNzaWfEQEDd1OMRoQI/rzNlU4iiF50XQXmup3k5czI9hEsNqHT7K4Ksf'
          'mA/0DUVkbzOwtJdRsHS8trm3Arjpy9r7AXlbAujdHhuh6RhcGFyiaJhbc'
          'QgZkFDUE80blJnTzU1ajFuZEFLM1c2U2djNEFQa2N5RmiiYW6odGVzdGN'
          'vaW6iYXWnd2Vic2l0ZaFjxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxc'
          'dphkfbbh/aFmxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/'
          'aFtxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aFyxCAJ+9'
          'J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aF0ZKJ1bqN0c3SjZmV'
          'lzQ+0omZ2zgAE7A+iZ2jEIEhjtRiks8hOyBDyLU8QgcsPcfBZp6wg3sYv'
          'f3DlCToiomx2zgAE7/ejc25kxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgf'
          'oxcdphkfbbh/aR0eXBlpGFjZmc=';

      expect(msgpack_encode(msgpack_decode(golden)), golden);
    });

    test('Asset config', () {
      final asset_txn = 'gqNzaWfEQBBkfw5n6UevuIMDo2lHyU4dS80JCCQ/vTRUcTx5m0ivX6'
          '8zTKyuVRrHaTbxbRRc3YpJ4zeVEnC9Fiw3Wf4REwejdHhuiKRhcGFy'
          'hKFjxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aFmxC'
          'AJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aFtxCAJ+9J2'
          'LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aFyxCAJ+9J2LAj4bF'
          'rmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aRjYWlkzQTSo2ZlZc0NSKJm'
          'ds4ABOwPomdoxCBIY7UYpLPITsgQ8i1PEIHLD3HwWaesIN7GL39w5Q'
          'k6IqJsds4ABO/3o3NuZMQgCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6M'
          'XHaYZH224f2kdHlwZaRhY2Zn';

      expect(msgpack_encode(msgpack_decode(asset_txn)), asset_txn);
    });

    test('Asset config wih decimal', () {
      final asset_txn = 'gqNzaWfEQBBkfw5n6UevuIMDo2lHyU4dS80JCCQ/vTRUcTx5m0ivX6'
          '8zTKyuVRrHaTbxbRRc3YpJ4zeVEnC9Fiw3Wf4REwejdHhuiKRhcGFy'
          'haFjxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aJkYw'
          'yhZsQgCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH224f2hbcQg'
          'CfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH224f2hcsQgCfvSdi'
          'wI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH224f2kY2FpZM0E0qNmZWXN'
          'DUiiZnbOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi'
          '9/cOUJOiKibHbOAATv96NzbmTEIAn70nYsCPhsWua/bdenqQHeZnXX'
          'UOB+jFx2mGR9tuH9pHR5cGWkYWNmZw==';

      expect(msgpack_encode(msgpack_decode(asset_txn)), asset_txn);
    });

    test('Asset destroy', () {
      final asset_txn = 'gqNzaWfEQBSP7HtzD/Lvn4aVvaNpeR4T93dQgo4LvywEwcZgDEoc/W'
          'Vl3aKsZGcZkcRFoiWk8AidhfOZzZYutckkccB8RgGjdHhuh6RjYWlk'
          'AaNmZWXNB1iiZnbOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8F'
          'mnrCDexi9/cOUJOiKibHbOAATv96NzbmTEIAn70nYsCPhsWua/bden'
          'qQHeZnXXUOB+jFx2mGR9tuH9pHR5cGWkYWNmZw==';

      expect(msgpack_encode(msgpack_decode(asset_txn)), asset_txn);
    });

    test('Asset freeze', () {
      final asset_txn = 'gqNzaWfEQAhru5V2Xvr19s4pGnI0aslqwY4lA2skzpYtDTAN9DKSH5'
          '+qsfQQhm4oq+9VHVj7e1rQC49S28vQZmzDTVnYDQGjdHhuiaRhZnJ6'
          'w6RmYWRkxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/a'
          'RmYWlkAaNmZWXNCRqiZnbOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCB'
          'yw9x8FmnrCDexi9/cOUJOiKibHbOAATv+KNzbmTEIAn70nYsCPhsWu'
          'a/bdenqQHeZnXXUOB+jFx2mGR9tuH9pHR5cGWkYWZyeg==';

      expect(msgpack_encode(msgpack_decode(asset_txn)), asset_txn);
    });

    test('Asset transfer', () {
      final asset_txn = 'gqNzaWfEQNkEs3WdfFq6IQKJdF1n0/hbV9waLsvojy9pM1T4fvwfMN'
          'djGQDy+LeesuQUfQVTneJD4VfMP7zKx4OUlItbrwSjdHhuiqRhYW10'
          'AaZhY2xvc2XEIAn70nYsCPhsWua/bdenqQHeZnXXUOB+jFx2mGR9tu'
          'H9pGFyY3bEIAn70nYsCPhsWua/bdenqQHeZnXXUOB+jFx2mGR9tuH9'
          'o2ZlZc0KvqJmds4ABOwPomdoxCBIY7UYpLPITsgQ8i1PEIHLD3HwWa'
          'esIN7GL39w5Qk6IqJsds4ABO/4o3NuZMQgCfvSdiwI+Gxa5r9t16ep'
          'Ad5mdddQ4H6MXHaYZH224f2kdHlwZaVheGZlcqR4YWlkAQ==';

      expect(msgpack_encode(msgpack_decode(asset_txn)), asset_txn);
    });

    test('Asset accept', () {
      final asset_txn = 'gqNzaWfEQJ7q2rOT8Sb/wB0F87ld+1zMprxVlYqbUbe+oz0WM63Fct'
          'Ii+K9eYFSqT26XBZ4Rr3+VTJpBE+JLKs8nctl9hgijdHhuiKRhcmN2'
          'xCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aNmZWXNCO'
          'iiZnbOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/'
          'cOUJOiKibHbOAATv96NzbmTEIAn70nYsCPhsWua/bdenqQHeZnXXUO'
          'B+jFx2mGR9tuH9pHR5cGWlYXhmZXKkeGFpZAE=';

      expect(msgpack_encode(msgpack_decode(asset_txn)), asset_txn);
    });

    test('Asset revoke', () {
      final asset_txn = 'gqNzaWfEQHsgfEAmEHUxLLLR9s+Y/yq5WeoGo/jAArCbany+7ZYwEx'
          'MySzAhmV7M7S8+LBtJalB4EhzEUMKmt3kNKk6+vAWjdHhuiqRhYW10'
          'AaRhcmN2xCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/a'
          'Rhc25kxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aNm'
          'ZWXNCqqiZnbOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrC'
          'Dexi9/cOUJOiKibHbOAATv96NzbmTEIAn70nYsCPhsWua/bdenqQHe'
          'ZnXXUOB+jFx2mGR9tuH9pHR5cGWlYXhmZXKkeGFpZAE=';

      expect(msgpack_encode(msgpack_decode(asset_txn)), asset_txn);
    });
  });

  group('Transaction', () {
    test('Min Txn Fee', () {
      final address =
          '7ZUECA7HFLZTXENRV24SHLU4AVPUTMTTDUFUBNBD64C73F3UHRTHAIOF6Q';
      final gh = 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=';
      final txn = PaymentTxn(
          sender: address,
          fee: 0,
          first_valid_round: 1,
          last_valid_round: 100,
          genesis_hash: gh,
          receiver: address,
          amt: 1000,
          note: Uint8List.fromList([0]));
      expect(MIN_TXN_FEE, txn.fee);
    });

    test('Serialize', () {
      final address =
          '7ZUECA7HFLZTXENRV24SHLU4AVPUTMTTDUFUBNBD64C73F3UHRTHAIOF6Q';
      final gh = 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=';

      final txn = PaymentTxn(
          sender: address,
          fee: 3,
          first_valid_round: 1,
          last_valid_round: 100,
          genesis_hash: gh,
          receiver: address,
          amt: 1000,
          note: Uint8List.fromList([1, 32, 200]));

      final enc = msgpack_encode(txn);
      final re_enc = msgpack_encode(msgpack_decode(enc));
      expect(re_enc, enc);
    });

    test('Serialize zero amount', () {
      final address =
          '7ZUECA7HFLZTXENRV24SHLU4AVPUTMTTDUFUBNBD64C73F3UHRTHAIOF6Q';
      final gh = 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=';

      final txn = PaymentTxn(
          sender: address,
          fee: 3,
          first_valid_round: 1,
          last_valid_round: 100,
          genesis_hash: gh,
          receiver: address,
          amt: 0,
          note: Uint8List.fromList([1, 32, 200]));

      final enc = msgpack_encode(txn);
      final re_enc = msgpack_encode(msgpack_decode(enc));
      expect(re_enc, enc);
    });

    test('Serialize genesis_id', () {
      final address =
          '7ZUECA7HFLZTXENRV24SHLU4AVPUTMTTDUFUBNBD64C73F3UHRTHAIOF6Q';
      final gh = 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=';

      final txn = PaymentTxn(
          sender: address,
          fee: 3,
          first_valid_round: 1,
          last_valid_round: 100,
          genesis_hash: gh,
          receiver: address,
          amt: 1000,
          genesis_id: 'tesnet-v1.0',
          close_remainder_to: address);

      final enc = msgpack_encode(txn);
      final re_enc = msgpack_encode(msgpack_decode(enc));
      expect(re_enc, enc);
    });

    test('Serialize txgroup', () {
      final address = '7ZUECA7HFLZTXENRV24SHLU4AVPUTMTTDUFUBNBD64C73F3UHRTHAIOF6Q';
      final gh = 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=';

      final txn = PaymentTxn(
          sender: address,
          fee: 3,
          first_valid_round: 1,
          last_valid_round: 100,
          genesis_hash: gh,
          receiver: address,
          amt: 1000,
          genesis_id: 'testnet-v1.0',
          close_remainder_to: address
      );

      final txid = txn.get_txid();
      final txid_decoded = base32.decode(txid);

      var txgroup = TxGroup([txid_decoded]);
      var enc = msgpack_encode(txgroup);
      var re_enc = msgpack_encode(msgpack_decode(enc));

      expect(re_enc, enc);

      txgroup = TxGroup(List.filled(11, txid_decoded));
      enc = msgpack_encode(txgroup);
      re_enc = msgpack_encode(msgpack_decode(enc));

      expect(re_enc, enc);

      final gid = calculate_group_id([txn, txn]);
      txn.group = gid;
      enc = msgpack_encode(txn);
      re_enc = msgpack_encode(msgpack_decode(enc));

      expect(re_enc, enc);
    });

    test('Sign', () {
      final mn = 'advice pudding treat near rule blouse same whisper inner '
          'electric quit surface sunny dismiss leader blood seat '
          'clown cost exist hospital century reform able sponsor';

      final gh = 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=';
      final address =
          'PNWOET7LLOWMBMLE4KOCELCX6X3D3Q4H2Q4QJASYIEOF7YIPPQBG3YQ5YI';
      final close =
          'IDUTJEUIEVSMXTU4LGTJWZ2UE2E6TIODUKU6UW3FU3UKIQQ77RLUBBBFLA';

      final sk = mnemonic.to_private_key(mn);
      final pk = address_from_private_key(sk);

      final txn = PaymentTxn(
          sender: pk,
          fee: 4,
          first_valid_round: 12466,
          last_valid_round: 13466,
          genesis_hash: gh,
          receiver: address,
          amt: 1000,
          note: base64Decode('6gAVR0Nsv5Y='),
          genesis_id: 'devnet-v33.0',
          close_remainder_to: close);

      final stx = txn.sign(sk);
      final golden = 'gqNzaWfEQPhUAZ3xkDDcc8FvOVo6UinzmKBCqs0woYSfodlmBMfQvGbeU'
          'x3Srxy3dyJDzv7rLm26BRv9FnL2/AuT7NYfiAWjdHhui6NhbXTNA+ilY2'
          'xvc2XEIEDpNJKIJWTLzpxZpptnVCaJ6aHDoqnqW2Wm6KRCH/xXo2ZlZc0'
          'EmKJmds0wsqNnZW6sZGV2bmV0LXYzMy4womdoxCAmCyAJoJOohot5WHIv'
          'peVG7eftF+TYXEx4r7BFJpDt0qJsds00mqRub3RlxAjqABVHQ2y/lqNyY'
          '3bEIHts4k/rW6zAsWTinCIsV/X2PcOH1DkEglhBHF/hD3wCo3NuZMQg5/'
          'D4TQaBHfnzHI2HixFV9GcdUaGFwgCQhmf0SVhwaKGkdHlwZaNwYXk=';

      expect(msgpack_encode(stx), golden);

      final txid_golden =
          '5FJDJD5LMZC3EHUYYJNH5I23U4X6H2KXABNDGPIL557ZMJ33GZHQ';

      expect(txn.get_txid(), txid_golden);
    });

    test('Serialize pay', () {
      final mn = 'advice pudding treat near rule blouse same whisper inner '
          'electric quit surface sunny dismiss leader blood seat '
          'clown cost exist hospital century reform able sponsor';

      final sk = mnemonic.to_private_key(mn);
      final pk = address_from_private_key(sk);

      final txn = PaymentTxn(
          sender: pk,
          fee: 4,
          first_valid_round: 12466,
          last_valid_round: 13466,
          genesis_hash: 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=',
          receiver:
          'PNWOET7LLOWMBMLE4KOCELCX6X3D3Q4H2Q4QJASYIEOF7YIPPQBG3YQ5YI',
          amt: 1000,
          note: base64Decode('6gAVR0Nsv5Y='),
          genesis_id: 'devnet-v33.0',
          close_remainder_to:
          'IDUTJEUIEVSMXTU4LGTJWZ2UE2E6TIODUKU6UW3FU3UKIQQ77RLUBBBFLA');

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQPhUAZ3xkDDcc8FvOVo6UinzmKBCqs0woYSfodlmBMfQvGbeU'
          'x3Srxy3dyJDzv7rLm26BRv9FnL2/AuT7NYfiAWjdHhui6NhbXTNA+ilY2'
          'xvc2XEIEDpNJKIJWTLzpxZpptnVCaJ6aHDoqnqW2Wm6KRCH/xXo2ZlZc0'
          'EmKJmds0wsqNnZW6sZGV2bmV0LXYzMy4womdoxCAmCyAJoJOohot5WHIv'
          'peVG7eftF+TYXEx4r7BFJpDt0qJsds00mqRub3RlxAjqABVHQ2y/lqNyY'
          '3bEIHts4k/rW6zAsWTinCIsV/X2PcOH1DkEglhBHF/hD3wCo3NuZMQg5/'
          'D4TQaBHfnzHI2HixFV9GcdUaGFwgCQhmf0SVhwaKGkdHlwZaNwYXk=';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Serialize pay lease', () {
      final mn = 'advice pudding treat near rule blouse same whisper inner elec'
          'tric quit surface sunny dismiss leader blood seat clown cost '
          'exist hospital century reform able sponsor';

      final sk = mnemonic.to_private_key(mn);
      final pk = address_from_private_key(sk);

      // @formatter:off
      final lease = Uint8List.fromList([1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3,
        4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]);
      // @formatter:on

      final txn = PaymentTxn(
          sender: pk,
          fee: 4,
          first_valid_round: 12466,
          last_valid_round: 13466,
          genesis_hash: 'JgsgCaCTqIaLeVhyL6XlRu3n7Rfk2FxMeK+wRSaQ7dI=',
          receiver: 'PNWOET7LLOWMBMLE4KOCELCX6X3D3Q4H2Q4QJASYIEOF7YIPPQBG3YQ5YI',
          note: base64Decode('6gAVR0Nsv5Y='),
          amt: 1000,
          close_remainder_to: 'IDUTJEUIEVSMXTU4LGTJWZ2UE2E6TIODUKU6UW3FU3UKIQQ77RLUBBBFLA',
          genesis_id: 'devnet-v33.0',
          lease: lease
      );

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQOMmFSIKsZvpW0txwzhmbgQjxv6IyN7BbV5sZ2aNgFbVcrWUn'
          'qPpQQxfPhV/wdu9jzEPUU1jAujYtcNCxJ7ONgejdHhujKNhbXTNA+ilY2'
          'xvc2XEIEDpNJKIJWTLzpxZpptnVCaJ6aHDoqnqW2Wm6KRCH/xXo2ZlZc0'
          'FLKJmds0wsqNnZW6sZGV2bmV0LXYzMy4womdoxCAmCyAJoJOohot5WHIv'
          'peVG7eftF+TYXEx4r7BFJpDt0qJsds00mqJseMQgAQIDBAECAwQBAgMEA'
          'QIDBAECAwQBAgMEAQIDBAECAwSkbm90ZcQI6gAVR0Nsv5ajcmN2xCB7bO'
          'JP61uswLFk4pwiLFf19j3Dh9Q5BIJYQRxf4Q98AqNzbmTEIOfw+E0GgR3'
          '58xyNh4sRVfRnHVGhhcIAkIZn9ElYcGihpHR5cGWjcGF5';

      expect(golden, msgpack_encode(signed_txn));
    });


    test('Serialize keyreg', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final votekey = encode_address(
          base64Decode('Kv7QI7chi1y6axoy+t7wzAVpePqRq/rkjzWh/RMYyLo='));

      final selpk = encode_address(
          base64Decode('bPgrv4YogPcdaUAxrt1QysYZTVyRAuUMD4zQmCu9llc='));

      final txn = KeyregTxn(
        sender: pk,
        fee: 1000,
        first_valid_round: 322575,
        last_valid_round: 323575,
        genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
        votekey: votekey,
        selkey: selpk,
        votefst: 10000,
        votelst: 10111,
        votekd: 11,
        flat_fee: true,
      );

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQEA8ANbrvTRxU9c8v6WERcEPw7D/HacRgg4vICa61vEof60Ww'
          'tx6KJKDyvBuvViFeacLlngPY6vYCVP0DktTwQ2jdHhui6NmZWXNA+iiZn'
          'bOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiK'
          'ibHbOAATv96ZzZWxrZXnEIGz4K7+GKID3HWlAMa7dUMrGGU1ckQLlDA+M'
          '0JgrvZZXo3NuZMQgCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH224'
          'f2kdHlwZaZrZXlyZWendm90ZWZzdM0nEKZ2b3Rla2QLp3ZvdGVrZXnEIC'
          'r+0CO3IYtcumsaMvre8MwFaXj6kav65I81of0TGMi6p3ZvdGVsc3TNJ38=';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Serialize asset create', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetConfigTxn(
        sender: pk,
        fee: 10,
        first_valid_round: 322575,
        last_valid_round: 323575,
        genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
        total: 100,
        manager: pk,
        reserve: pk,
        freeze: pk,
        clawback: pk,
        unit_name: 'tst',
        asset_name: 'testcoin',
        url: 'website',
        metadata_hash: AsciiCodec().encode('fACPO4nRgO55j1ndAK3W6Sgc4APkcyFh'),
        default_frozen: false,
      );

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQEDd1OMRoQI/rzNlU4iiF50XQXmup3k5czI9hEsNqHT7K4Ksf'
          'mA/0DUVkbzOwtJdRsHS8trm3Arjpy9r7AXlbAujdHhuh6RhcGFyiaJhbc'
          'QgZkFDUE80blJnTzU1ajFuZEFLM1c2U2djNEFQa2N5RmiiYW6odGVzdGN'
          'vaW6iYXWnd2Vic2l0ZaFjxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxc'
          'dphkfbbh/aFmxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/'
          'aFtxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aFyxCAJ+9'
          'J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aF0ZKJ1bqN0c3SjZmV'
          'lzQ+0omZ2zgAE7A+iZ2jEIEhjtRiks8hOyBDyLU8QgcsPcfBZp6wg3sYv'
          'f3DlCToiomx2zgAE7/ejc25kxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgf'
          'oxcdphkfbbh/aR0eXBlpGFjZmc=';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Asset create decimal', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetConfigTxn(
        sender: pk,
        fee: 10,
        first_valid_round: 322575,
        last_valid_round: 323575,
        genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
        total: 100,
        manager: pk,
        reserve: pk,
        freeze: pk,
        clawback: pk,
        unit_name: 'tst',
        asset_name: 'testcoin',
        url: 'website',
        metadata_hash: AsciiCodec().encode('fACPO4nRgO55j1ndAK3W6Sgc4APkcyFh'),
        default_frozen: false,
        decimals: 1,
      );

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQCj5xLqNozR5ahB+LNBlTG+d0gl0vWBrGdAXj1ibsCkvAwOsX'
          's5KHZK1YdLgkdJecQiWm4oiZ+pm5Yg0m3KFqgqjdHhuh6RhcGFyiqJhbc'
          'QgZkFDUE80blJnTzU1ajFuZEFLM1c2U2djNEFQa2N5RmiiYW6odGVzdGN'
          'vaW6iYXWnd2Vic2l0ZaFjxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxc'
          'dphkfbbh/aJkYwGhZsQgCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZ'
          'H224f2hbcQgCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH224f2hcs'
          'QgCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH224f2hdGSidW6jdHN'
          '0o2ZlZc0P3KJmds4ABOwPomdoxCBIY7UYpLPITsgQ8i1PEIHLD3HwWaes'
          'IN7GL39w5Qk6IqJsds4ABO/3o3NuZMQgCfvSdiwI+Gxa5r9t16epAd5md'
          'ddQ4H6MXHaYZH224f2kdHlwZaRhY2Zn';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Asset Empty address error', () {
      final pk = 'DN7MBMCL5JQ3PFUQS7TMX5AH4EEKOBJVDUF4TCV6WERATKFLQF4MQUPZTA';

      expect(() =>
          AssetConfigTxn(
            sender: pk,
            fee: 10,
            first_valid_round: 322575,
            last_valid_round: 323575,
            genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
            reserve: pk,
            freeze: pk,
            clawback: pk,
            index: 1234,
          ), throwsA(isA<EmptyAddressError>()));
    }
    );

    test('Asset serialize asset config', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetConfigTxn(
        sender: pk,
        fee: 10,
        first_valid_round: 322575,
        last_valid_round: 323575,
        genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
        manager: pk,
        reserve: pk,
        freeze: pk,
        clawback: pk,
        index: 1234,
      );

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQBBkfw5n6UevuIMDo2lHyU4dS80JCCQ/vTRUcTx5m0ivX68zT'
          'KyuVRrHaTbxbRRc3YpJ4zeVEnC9Fiw3Wf4REwejdHhuiKRhcGFyhKFjxC'
          'AJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aFmxCAJ+9J2LAj'
          '4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aFtxCAJ+9J2LAj4bFrmv23X'
          'p6kB3mZ111Dgfoxcdphkfbbh/aFyxCAJ+9J2LAj4bFrmv23Xp6kB3mZ11'
          '1Dgfoxcdphkfbbh/aRjYWlkzQTSo2ZlZc0NSKJmds4ABOwPomdoxCBIY7'
          'UYpLPITsgQ8i1PEIHLD3HwWaesIN7GL39w5Qk6IqJsds4ABO/3o3NuZMQ'
          'gCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH224f2kdHlwZaRhY2Zn';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Serialize asset destroy', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetConfigTxn(
          sender: pk,
          fee: 10,
          first_valid_round: 322575,
          last_valid_round: 323575,
          genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
          index: 1,
          strict_empty_address_check: false
      );

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQBSP7HtzD/Lvn4aVvaNpeR4T93dQgo4LvywEwcZgDEoc/WVl3'
          'aKsZGcZkcRFoiWk8AidhfOZzZYutckkccB8RgGjdHhuh6RjYWlkAaNmZW'
          'XNB1iiZnbOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9'
          '/cOUJOiKibHbOAATv96NzbmTEIAn70nYsCPhsWua/bdenqQHeZnXXUOB+'
          'jFx2mGR9tuH9pHR5cGWkYWNmZw==';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Serialize asset freeze', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetFreezeTxn(
        sender: pk,
        fee: 10,
        first_valid_round: 322575,
        last_valid_round: 323576,
        genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
        index: 1,
        target: 'BH55E5RMBD4GYWXGX5W5PJ5JAHPGM5OXKDQH5DC4O2MGI7NW4H6VOE4CP4',
        new_freeze_state: true,
      );

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQAhru5V2Xvr19s4pGnI0aslqwY4lA2skzpYtDTAN9DKSH5+qs'
          'fQQhm4oq+9VHVj7e1rQC49S28vQZmzDTVnYDQGjdHhuiaRhZnJ6w6RmYW'
          'RkxCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aRmYWlkAaN'
          'mZWXNCRqiZnbOAATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDe'
          'xi9/cOUJOiKibHbOAATv+KNzbmTEIAn70nYsCPhsWua/bdenqQHeZnXXU'
          'OB+jFx2mGR9tuH9pHR5cGWkYWZyeg==';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Serialize asset transfer', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetTransferTxn(
          sender: pk,
          fee: 10,
          first_valid_round: 322575,
          last_valid_round: 323576,
          genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
          receiver:
          'BH55E5RMBD4GYWXGX5W5PJ5JAHPGM5OXKDQH5DC4O2MGI7NW4H6VOE4CP4',
          amt: 1,
          index: 1,
          close_assets_to:
          'BH55E5RMBD4GYWXGX5W5PJ5JAHPGM5OXKDQH5DC4O2MGI7NW4H6VOE4CP4');


      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQNkEs3WdfFq6IQKJdF1n0/hbV9waLsvojy9pM1T4fvwfMNdjG'
          'QDy+LeesuQUfQVTneJD4VfMP7zKx4OUlItbrwSjdHhuiqRhYW10AaZhY2'
          'xvc2XEIAn70nYsCPhsWua/bdenqQHeZnXXUOB+jFx2mGR9tuH9pGFyY3b'
          'EIAn70nYsCPhsWua/bdenqQHeZnXXUOB+jFx2mGR9tuH9o2ZlZc0KvqJm'
          'ds4ABOwPomdoxCBIY7UYpLPITsgQ8i1PEIHLD3HwWaesIN7GL39w5Qk6I'
          'qJsds4ABO/4o3NuZMQgCfvSdiwI+Gxa5r9t16epAd5mdddQ4H6MXHaYZH'
          '224f2kdHlwZaVheGZlcqR4YWlkAQ==';

      expect(msgpack_encode(signed_txn), golden);
    });


    test('Serialize asset accept', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetTransferTxn(
          sender: pk,
          fee: 10,
          first_valid_round: 322575,
          last_valid_round: 323575,
          genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
          receiver:
          'BH55E5RMBD4GYWXGX5W5PJ5JAHPGM5OXKDQH5DC4O2MGI7NW4H6VOE4CP4',
          amt: 0,
          index: 1);

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQJ7q2rOT8Sb/wB0F87ld+1zMprxVlYqbUbe+oz0WM63FctIi+'
          'K9eYFSqT26XBZ4Rr3+VTJpBE+JLKs8nctl9hgijdHhuiKRhcmN2xCAJ+9'
          'J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aNmZWXNCOiiZnbOAAT'
          'sD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiKibHbO'
          'AATv96NzbmTEIAn70nYsCPhsWua/bdenqQHeZnXXUOB+jFx2mGR9tuH9p'
          'HR5cGWlYXhmZXKkeGFpZAE=';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Serialize asset revoke', () {
      final mn = 'awful drop leaf tennis indoor begin mandate discover uncle se'
          'ven only coil atom any hospital uncover make any climb actor '
          'armed measure need above hundred';

      final sk = mnemonic.to_private_key(mn);
      final pk = mnemonic.to_public_key(mn);

      final txn = AssetTransferTxn(
          sender: pk,
          fee: 10,
          first_valid_round: 322575,
          last_valid_round: 323575,
          genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=',
          receiver:
          'BH55E5RMBD4GYWXGX5W5PJ5JAHPGM5OXKDQH5DC4O2MGI7NW4H6VOE4CP4',
          amt: 1,
          revocation_target:
          'BH55E5RMBD4GYWXGX5W5PJ5JAHPGM5OXKDQH5DC4O2MGI7NW4H6VOE4CP4',
          index: 1);

      final signed_txn = txn.sign(sk);

      final golden = 'gqNzaWfEQHsgfEAmEHUxLLLR9s+Y/yq5WeoGo/jAArCbany+7ZYwExMyS'
          'zAhmV7M7S8+LBtJalB4EhzEUMKmt3kNKk6+vAWjdHhuiqRhYW10AaRhcm'
          'N2xCAJ+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aRhc25kxCA'
          'J+9J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aNmZWXNCqqiZnbO'
          'AATsD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiKib'
          'HbOAATv96NzbmTEIAn70nYsCPhsWua/bdenqQHeZnXXUOB+jFx2mGR9tu'
          'H9pHR5cGWlYXhmZXKkeGFpZAE=';

      expect(msgpack_encode(signed_txn), golden);
    });

    test('Group ID', () {
      final address = 'UPYAFLHSIPMJOHVXU2MPLQ46GXJKSDCEMZ6RLCQ7GWB5PRDKJUWKKXECXI';
      final from_address = address;
      final to_address = address;
      final fee = 1000;
      final amount = 2000;
      final genesis_id = 'devnet-v1.0';
      final genesis_hash = 'sC3P7e2SdbqKJK0tbiCdK9tdSpbe6XeCGKdoNzmlj0E=';

      final first_round1 = 710399;
      final note1 = base64Decode('wRKw5cJ0CMo=');

      final tx1 = PaymentTxn(
        sender: from_address,
        fee: fee,
        first_valid_round: first_round1,
        last_valid_round: first_round1 + 1000,
        genesis_hash: genesis_hash,
        receiver: to_address,
        amt: amount,
        note: note1,
        genesis_id: genesis_id,
        flat_fee: true,
      );

      final first_round2 = 710515;

      final note2 = base64Decode('dBlHI6BdrIg=');

      final tx2 = PaymentTxn(
          sender: from_address,
          fee: fee,
          first_valid_round: first_round2,
          last_valid_round: first_round2 + 1000,
          genesis_hash: genesis_hash,
          receiver: to_address,
          amt: amount,
          note: note2,
          genesis_id: genesis_id,
          flat_fee: true
      );

      // preserve original tx{1,2} objects

      var tx1_copy = Transaction.from(tx1);
      var tx2_copy = Transaction.from(tx2);

      var stx1 = SignedTransaction(transaction: tx1_copy);
      var stx2 = SignedTransaction(transaction: tx2_copy);

      final goldenTx1 = 'gaN0eG6Ko2FtdM0H0KNmZWXNA+iiZnbOAArW/6NnZW6rZGV2bmV0LXYxLjCiZ2j'
          'EILAtz+3tknW6iiStLW4gnSvbXUqW3ul3ghinaDc5pY9Bomx2zgAK2uekbm90Zc'
          'QIwRKw5cJ0CMqjcmN2xCCj8AKs8kPYlx63ppj1w5410qkMRGZ9FYofNYPXxGpNL'
          'KNzbmTEIKPwAqzyQ9iXHremmPXDnjXSqQxEZn0Vih81g9fEak0spHR5cGWjcGF5';

      final goldenTx2 = 'gaN0eG6Ko2FtdM0H0KNmZWXNA+iiZnbOAArXc6NnZW6rZGV2bmV0LXYxLjCiZ2j'
          'EILAtz+3tknW6iiStLW4gnSvbXUqW3ul3ghinaDc5pY9Bomx2zgAK21ukbm90Zc'
          'QIdBlHI6BdrIijcmN2xCCj8AKs8kPYlx63ppj1w5410qkMRGZ9FYofNYPXxGpNL'
          'KNzbmTEIKPwAqzyQ9iXHremmPXDnjXSqQxEZn0Vih81g9fEak0spHR5cGWjcGF5';

      expect(msgpack_encode(stx1), goldenTx1);
      expect(msgpack_encode(stx2), goldenTx2);

      final gid = calculate_group_id([tx1_copy, tx2_copy]);
      stx1.transaction.group = gid;
      stx2.transaction.group = gid;

      // goal clerk group sets Group to every transaction and concatenate
      // them in output file
      // simulating that behavior here

      var txg = base64Encode(base64Decode(msgpack_encode(stx1)) +
          base64Decode(msgpack_encode(stx2)));

      final goldenTxg = 'gaN0eG6Lo2FtdM0H0KNmZWXNA+iiZnbOAArW/6NnZW6rZGV2bmV0LXYxLjCiZ2j'
          'EILAtz+3tknW6iiStLW4gnSvbXUqW3ul3ghinaDc5pY9Bo2dycMQgLiQ9OBup9H'
          '/bZLSfQUH2S6iHUM6FQ3PLuv9FNKyt09SibHbOAAra56Rub3RlxAjBErDlwnQIy'
          'qNyY3bEIKPwAqzyQ9iXHremmPXDnjXSqQxEZn0Vih81g9fEak0so3NuZMQgo/AC'
          'rPJD2Jcet6aY9cOeNdKpDERmfRWKHzWD18RqTSykdHlwZaNwYXmBo3R4boujYW1'
          '0zQfQo2ZlZc0D6KJmds4ACtdzo2dlbqtkZXZuZXQtdjEuMKJnaMQgsC3P7e2Sdb'
          'qKJK0tbiCdK9tdSpbe6XeCGKdoNzmlj0GjZ3JwxCAuJD04G6n0f9tktJ9BQfZLq'
          'IdQzoVDc8u6/0U0rK3T1KJsds4ACttbpG5vdGXECHQZRyOgXayIo3JjdsQgo/AC'
          'rPJD2Jcet6aY9cOeNdKpDERmfRWKHzWD18RqTSyjc25kxCCj8AKs8kPYlx63ppj'
          '1w5410qkMRGZ9FYofNYPXxGpNLKR0eXBlo3BheQ==';

      expect(txg, goldenTxg);

      // repeat test above for assign_group_id

      tx1_copy = Transaction.from(tx1);
      tx2_copy = Transaction.from(tx2);

      var txns = assign_group_id(txns: [tx1_copy, tx2_copy]);

      expect(txns.length, 2);

      stx1 = SignedTransaction(transaction: txns[0]);
      stx2 = SignedTransaction(transaction: txns[1]);

      // goal clerk group sets Group to every transaction and concatenate
      // them in output file
      // simulating that behavior here

      txg = base64Encode(base64Decode(msgpack_encode(stx1)) +
          base64Decode(msgpack_encode(stx2)));

      expect(txg, goldenTxg);

      // Check filtering

      txns = assign_group_id(txns: [tx1, tx2], address: from_address);
      expect(txns.length, 2);
      expect(txns[0].group, gid);

      txns = assign_group_id(txns: [tx1, tx2], address: 'NONEXISTENT');
      expect(txns.length, 0);
    });
  });

  group('template', () {
    test("split", () {
      final addr1 = 'WO3QIJ6T4DZHBX5PWJH26JLHFSRT7W7M2DJOULPXDTUS6TUX7ZRIO4KDFY';
      final addr2 = 'W6UUUSEAOGLBHT7VFT4H2SDATKKSG6ZBUIJXTZMSLW36YS44FRP5NVAU7U';
      final addr3 = 'XCIBIN7RT4ZXGBMVAMU3QS6L5EKB7XGROC5EPCNHHYXUIBAA5Q6C5Y7NEU';

      final s = Split(owner: addr1,
          receiver_1: addr2,
          receiver_2: addr3,
          ratn: 30,
          ratd: 100,
          expiry_round: 123456,
          min_pay: 10000,
          max_fee: 5000000);

      final golden = 'ASAIAcCWsQICAMDEBx5kkE4mAyCztwQn0+DycN+vsk+vJWcsoz/b7NDS'
          '6i33HOkvTpf+YiC3qUpIgHGWE8/1LPh9SGCalSN7IaITeeWSXbfsS5ws'
          'XyC4kBQ38Z8zcwWVAym4S8vpFB/c0XC6R4mnPi9EBADsPDEQIhIxASMM'
          'EDIEJBJAABkxCSgSMQcyAxIQMQglEhAxAiEEDRAiQAAuMwAAMwEAEjEJ'
          'MgMSEDMABykSEDMBByoSEDMACCEFCzMBCCEGCxIQMwAIIQcPEBA=';

      final golden_addr = 'KPYGWKTV7CKMPMTLQRNGMEQRSYTYD'
          'HUOFNV4UDSBDLC44CLIJPQWRTCPBU';

      expect(s.get_program(), base64Decode(golden));
      expect(s.get_address(), golden_addr);
    });

    test('HTLC', () {
      final addr1 = '726KBOYUJJNE5J5UHCSGQGWIBZWKCBN4WYD7YVSTEXEVNFPWUIJ7TAEOPM';
      final addr2 = '42NJMHTPFVPXVSDGA6JGKUV6TARV5UZTMPFIREMLXHETRKIVW34QFSDFRE';

      final s = HTLC(
          owner: addr1,
          receiver: addr2,
          hash_function: 'sha256',
          hash_image: 'f4OxZX/x/FO5LcGBSKHWXfwtSx+j1ncoSt3SABJtkGk=',
          expiry_round: 600000,
          max_fee: 1000
      );

      final golden_addr = 'KNBD7ATNUVQ4NTLOI72EEUWBVMBNK'
          'MPHWVBCETERV2W7T2YO6CVMLJRBM4';

      final golden = 'ASAE6AcBAMDPJCYDIOaalh5vLV96yGYHkmVSvpgjXtMzY8qIkYu5yTip'
          'Fbb5IH+DsWV/8fxTuS3BgUih1l38LUsfo9Z3KErd0gASbZBpIP68oLsU'
          'SlpOp7Q4pGgayA5soQW8tgf8VlMlyVaV9qITMQEiDjEQIxIQMQcyAxIQ'
          'MQgkEhAxCSgSLQEpEhAxCSoSMQIlDRAREA==';

      expect(s.get_program(), base64Decode(golden));
      expect(s.get_address(), golden_addr);
    });
  });
}