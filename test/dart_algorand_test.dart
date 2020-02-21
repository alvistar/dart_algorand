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
      final result =
          mnemonic.mnemonicChecksum(Utf8Encoder().convert(WORD_LIST_RAW));

      expect(result, 'venue');
    });

    test('Wrong length', () {
      final mn = 'abandon abandon abandon';
      expect(
          () => mnemonic.to_key(mn), throwsA(isA<WrongMnemonicLengthError>()));
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
  });

  group('MsgPack', () {
    test('Payment txn', () {
      final paytxn = 'iaNhbXTOAAGGoKNmZWXNA+iiZnbNcq2jZ2Vuq25ldHdvcmstdjM4omdo'
          'xCBN/+nfiNPXLbuigk8M/TXsMUfMK7dV//xB1wkoOhNu9qJsds1zEaNy'
          'Y3bEIAZ2cvp4J0OiBy5eAHIX/njaRko955rEdN4AUNEl4rxTo3NuZMQg'
          'GC5kQiOIPooA8mrvoHRyFtk27F/PPN08bAufGhnp0BGkdHlwZaNwYXk=';

      expect(msgpack_encode(msgpack_decode(paytxn)), paytxn);
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
              "BH55E5RMBD4GYWXGX5W5PJ5JAHPGM5OXKDQH5DC4O2MGI7NW4H6VOE4CP4");

      print(txn.dictify());

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

      print(txn.dictify());

      final signed_txn = txn.sign(sk);

      final         golden = ("gqNzaWfEQJ7q2rOT8Sb/wB0F87ld+1zMprxVlYqbUbe+oz0WM63FctIi+" +
          "K9eYFSqT26XBZ4Rr3+VTJpBE+JLKs8nctl9hgijdHhuiKRhcmN2xCAJ+9" +
          "J2LAj4bFrmv23Xp6kB3mZ111Dgfoxcdphkfbbh/aNmZWXNCOiiZnbOAAT" +
          "sD6JnaMQgSGO1GKSzyE7IEPItTxCByw9x8FmnrCDexi9/cOUJOiKibHbO" +
          "AATv96NzbmTEIAn70nYsCPhsWua/bdenqQHeZnXXUOB+jFx2mGR9tuH9p" +
          "HR5cGWlYXhmZXKkeGFpZAE=");

      expect(msgpack_encode(signed_txn), golden);
    });
  });
}
