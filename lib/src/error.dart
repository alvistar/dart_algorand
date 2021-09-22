import 'package:dio/dio.dart';

class WrongKeyLengthError implements Exception {
  @override
  String toString() => 'key length must be 58';
}

class WrongChecksumError implements Exception {
  @override
  String toString() => 'checksum failed to validate';
}

class WrongMnemonicLengthError implements Exception {
  @override
  String toString() => 'mnemonic length must be 25';
}

class WrongKeyBytesLengthError implements Exception {
  @override
  String toString() => 'key length in bytes must be 32';
}

class WordNotInList implements Exception {
  @override
  String toString() => 'word not in list';
}

class TransactionGroupSizeError implements Exception {
  @override
  String toString() => 'transaction groups are limited to 16 transactions';
}

class WrongLeaseLengthError implements Exception {
  @override
  String toString() => 'lease length must be 32 bytes';
}

class EmptyAddressError implements Exception {
  @override
  String toString() => 'manager, freeze, reserve, and clawback '
      'should not be empty unless '
      'strict_empty_address_check is set to False';
}

class OutOfRangeDecimalsError implements Exception {
  @override
  String toString() => 'decimals must be between 0 and 19, inclusive';
}

class WrongMetadataLengthError implements Exception {
  @override
  String toString() => 'metadata length must be 32 bytes';
}

class UnknownMsigVersionError implements Exception {
  @override
  String toString() => 'unknown multisig version != 1';
}

class InvalidThresholdError implements Exception {
  @override
  String toString() => 'invalid multisig threshold';
}

class MultisigAccountSizeError implements Exception {
  @override
  String toString() => 'multisig accounts are limited to 256 addresses';
}

class BadTxnSenderError implements Exception {
  @override
  String toString() => 'transaction sender does not match multisig parameters';
}

class InvalidSecretKeyError implements Exception {
  @override
  String toString() => 'secret key has no corresponding public key in multisig';
}

class MergeKeysMismatchError implements Exception {
  @override
  String toString() => 'multisig parameters do not match';
}

class DuplicateSigMismatchError implements Exception {
  @override
  String toString() => 'mismatched duplicate signatures in multisig';
}

class InvalidProgram implements Exception {
  String message;
  InvalidProgram({this.message = 'invalid program for logic sig'});
  @override
  String toString() => message;
}

class ClientError extends DioError {
  ClientError({
    RequestOptions request,
    Response response,
    DioErrorType type = DioErrorType.other,
    error,
  }) : super(
            requestOptions: request,
            response: response,
            type: type,
            error: error);

  @override
  String toString() {
    String m;

    if (response?.data is Map) {
      m = response.data['message'];
    } else if (response?.data is String) {
      m = response.data;
    }
    return m ?? super.toString();
  }
}
