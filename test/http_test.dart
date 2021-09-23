import 'package:test/test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:dart_algorand/dart_algorand.dart';

void main() {
  group('Http tests', () {
    setUp(() {});

    test('Http call', () async {
      final acl = AlgodClient(token: '123', url: 'http://127.0.0.1:8888');
      final dioAdapter = DioAdapter(dio: acl.dio);

      const REPLY = {
        'round': 15250994,
        'address': '34JJ6KINAVXBAWSELTO636AMAEVZLWNNPXHLGO6YQRWPE7VPRKAPB7BF4M',
        'amount': 0,
        'pendingrewards': 0,
        'amountwithoutpendingrewards': 0,
        'rewards': 0,
        'status': 'Offline'
      };

      dioAdapter.onGet(
          '/v1/account/6567', (server) => server.reply(200, REPLY));

      final account = await acl.accountInformation('6567');
      expect(account.address,
          '34JJ6KINAVXBAWSELTO636AMAEVZLWNNPXHLGO6YQRWPE7VPRKAPB7BF4M');
      expect(account.round, 15250994);
    });
  });
}
