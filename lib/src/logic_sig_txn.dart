import 'dart:collection';
import 'package:meta/meta.dart';
import 'transaction.dart';
import 'package:dart_algorand/dart_algorand.dart';
import 'logic_sig.dart';

/// Represents a logic signed transaction
class LogicSigTransaction {
  Transaction transaction;
  LogicSig lsig;

  LogicSigTransaction({@required this.transaction, this.lsig});

  factory LogicSigTransaction.undictify(Map<String, dynamic> m) {
    return LogicSigTransaction (
      transaction: Transaction.undictify(Map.from(m['txn'])),
      lsig: m.containsKey('lsig') ? LogicSig.undictify(Map.from(m['lsig'])) : null
    );
  }

  // Verify LogicSig against the transaction.
  // Returns true if the signature is valid (the sender address matches
  // the logic hash or the signature is valid against the sender
  // address), false otherwise

  bool verify() {
    final public_key = decode_address(transaction.sender);
    return lsig.verify(public_key);
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();
    if (lsig != null) {
      m['lsig'] = lsig.dictify();
    }
    m['txn'] = transaction.dictify();
    return m;
  }
}