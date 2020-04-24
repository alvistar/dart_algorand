import 'package:dart_algorand/dart_algorand.dart';

void main() {
  // generate an account
  final account = generate_account();

  print('Private key: ${account.private_key}');
  print('Address: ${account.address}');

  // check if the address is valid
  if (is_valid_address(account.address)) {
    print('The address is valid!');
  } else {
    print('The address is invalid.');
  }
}
