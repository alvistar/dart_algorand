import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:dart_algorand/src/account.dart';
import 'package:dart_algorand/src/mnemonic.dart' as mnemonic;
import 'package:dart_algorand/src/wordlist.dart';
import 'package:test/test.dart';


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
          receiver:
              "HQVYNUAJVOFZB4UUDZWAJ7I24SFXGPD2E3BOAZAPIMWOU2QEMY4TLLJVOE",
          fee: 1000,
          amt: 10000,
          note: note,
          first_valid_round: 10,
          last_valid_round: 1000,
          genesis_id: 'testnet-v1.0',
          genesis_hash: 'SGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiI=');

      expect(msgpack_encode(t),
          'iqNhbXTNJxCjZmVlzQPoomZ2CqNnZW6sdGVzdG5ldC12MS4womdoxCBIY7UYpLPITsgQ8i1PEIHLD3HwWaesIN7GL39w5Qk6IqJsds0D6KRub3RlxAtIZWxsbyBXb3JsZKNyY3bEIDwrhtAJq4uQ8pQebAT9GuSLczx6JsLgZA9DLOpqBGY5o3NuZMQgCgRALeACZ7qwM3tJ6nOHAk2VMpmDMWqRwjMaOqoOnGmkdHlwZaNwYXk=');
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
      expect(mn.split(' ').length, MNEMONIC_LEN);
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
      final result = mnemonic.mnemonicChecksum(Utf8Encoder().convert(WORD_LIST_RAW));

      expect(result, 'venue');
    });

    test('Wrong length', () {
      final mn = 'abandon abandon abandon';
      expect(() => mnemonic.to_key(mn), throwsA(isA<WrongMnemonicLengthError>()));
    });

    test('Bytes wrong len', () {
      final zero_bytes = Uint8List(31);
      zero_bytes.fillRange(0, 30, 0);

      expect(()=> mnemonic.from_key(zero_bytes), throwsA(isA<WrongKeyBytesLengthError>()));
    });

  });

  group('Address', () {
    test('Encode Decode', () {
      final account = generate_account();
      expect(account.address, encode_address(decode_address(account.address)));
    });
  });
}
