class WrongKeyLengthError implements Exception {
  String errMsg() => 'key length must be 58"';
}

class WrongChecksumError implements Exception {
  String errMsg() => 'checksum failed to validate"';
}