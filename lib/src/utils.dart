import 'package:dart_algorand/dart_algorand.dart';

class ParsedUrl {
  final String address;
  final int amount;

  ParsedUrl({this.address, this.amount});
}

ParsedUrl parseUrl(String url) {
  final re = RegExp(r'algorand:\/\/([A-Z2-7]+)(?:\?(.*)|$)');

  final matched = re.firstMatch(url);

  if (matched == null) {
    return null;
  }

  try {
    decode_address(matched.group(1));
  } catch (e) {
    return null;
  }

  var amount = 0;

  if (matched.group(2) != null) {
    final qs = Uri.splitQueryString(matched.group(2));

    amount = qs.containsKey('amount') ? int.parse(qs['amount']) : 0;
  }

  return ParsedUrl(amount: amount, address: matched.group(1));
}
