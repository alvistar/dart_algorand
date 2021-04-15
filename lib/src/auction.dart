import 'dart:collection';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:dart_algorand/dart_algorand.dart';
import 'package:pinenacl/ed25519.dart';

/// Represents a bid in an auction.
class Bid {
  String bidder;
  int bid_currency;
  int max_price;
  int bid_id;
  String auction_key;
  int auction_id;

  ///  bidder: address of the bidder
  ///  bid_currency: how much external currency is being spent
  ///  max_price: the maximum price the bidder is willing to pay
  ///  bid_id: bid ID
  ///  auction_key: address of the auction
  ///  auction_id: auction ID
  Bid(
      {@required this.bidder,
      @required this.bid_currency,
      @required this.max_price,
      @required this.bid_id,
      @required this.auction_id,
      @required this.auction_key});

  factory Bid.undictify(Map<String, dynamic> m) {
    return Bid(
        bidder: encode_address(m['bidder']),
        bid_currency: m['cur'],
        max_price: m['price'],
        bid_id: m['id'],
        auction_key: encode_address(m['auc']),
        auction_id: m['aid']);
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();

    m['aid'] = auction_id;
    m['auc'] = decode_address(auction_key);
    m['bidder'] = decode_address(bidder);
    m['cur'] = bid_currency;
    m['id'] = bid_id;
    m['price'] = max_price;

    return m;
  }

  /// Sign a bid with [private_key]
  SignedBid sign(String private_key) {
    final temp = msgpack_encode(this);
    final to_sign = Utf8Encoder().convert(BID_PREFIX) + base64Decode(temp);
    final pkey = base64Decode(private_key);
    final signing_key = SigningKey.fromSeed(pkey.sublist(0, KEY_LEN_BYTES));
    final signed = signing_key.sign(to_sign);
    return SignedBid(bid: this, signature: base64Encode(signed.signature));
  }
}

/// Represents a signed bid in an auction.
class SignedBid {
  Bid bid;
  String signature;

  /// bid: bid that was signed
  /// signature: the signature of the bidder

  SignedBid({this.bid, this.signature});

  factory SignedBid.undictify(Map<String, dynamic> m) {
    return SignedBid(
        bid: Bid.undictify(Map.from(m['bid'])),
        signature: base64Encode(m['sig']));
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();
    m['bid'] = bid.dictify();
    m['sig'] = base64Decode(signature);
    return m;
  }
}

/// Can be encoded and added to a transaction.
class NoteField {
  SignedBid signed_bid;
  String note_field_type;

  ///  signed_bid: bid with signature of bidder
  ///  note_field_type: the type of note; see constants for possible
  ///  types
  NoteField({this.signed_bid, this.note_field_type});

  factory NoteField.undictify(Map<String, dynamic> m) {
    return NoteField(
        signed_bid: SignedBid.undictify(Map.from(m['b'])),
        note_field_type: m['t']);
  }

  SplayTreeMap<String, dynamic> dictify() {
    final m = SplayTreeMap<String, dynamic>();
    m['b'] = signed_bid.dictify();
    m['t'] = note_field_type;
    return m;
  }
}
