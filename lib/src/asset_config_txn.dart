import 'dart:collection';
import 'dart:math';

import 'package:meta/meta.dart';
import 'dart:typed_data';

import 'encoding.dart';
import 'transaction.dart';
import 'constants.dart';
import 'error.dart';

/// Represents a transaction for asset creation, reconfiguration, or
/// destruction.
///

class AssetConfigTxn extends Transaction {
  int total;
  bool default_frozen;
  String unit_name;
  String asset_name;
  String manager;
  String reserve;
  String freeze;
  String clawback;
  String url;
  Uint8List metadata_hash;
  int decimals;
  int index;

  /// To create an asset, include the following:
  /// total, default_frozen, unit_name, asset_name,
  /// manager, reserve, freeze, clawback, url, metadata,
  /// decimals
  ///
  /// To destroy an asset, include the following:
  /// index, strict_empty_address_check (set to False)
  ///
  /// To update asset configuration, include the following:
  /// index, manager, reserve, freeze, clawback,
  /// strict_empty_address_check (optional)
  ///  sender (str): address of the sender
  ///  fee (int): transaction fee (per byte if flat_fee is false)
  ///  first (int): first round for which the transaction is valid
  ///  last (int): last round for which the transaction is valid
  ///  gh (str): genesis_hash
  ///
  ///  index: index of the asset
  ///
  ///  total: total number of base units of this asset created
  ///
  ///  default_frozen: whether slots for this asset in user
  ///  accounts are frozen by default
  ///
  ///  unit_name: hint for the name of a unit of this asset
  ///
  ///  asset_name: hint for the name of the asset
  ///
  ///  manager: address allowed to change nonzero addresses
  ///  for this asset
  ///
  ///  reserve: account whose holdings of this asset should
  ///  be reported as "not minted"
  ///
  ///  freeze: account allowed to change frozen state of
  ///  holdings of this asset
  ///
  ///  clawback: account allowed take units of this asset
  ///  from any account
  ///
  ///  url: a URL where more information about the asset
  ///  can be retrieved
  ///
  ///  metadata_hash: a commitment to some unspecified
  ///  asset metadata (32 byte hash)
  ///
  ///  note (bytes, optional): arbitrary optional bytes
  ///
  ///  gen (str, optional): genesis_id
  ///
  ///  flat_fee: whether the specified fee is a flat fee
  ///
  ///  lease: specifies a lease, and no other transaction
  ///  with the same sender and lease can be confirmed in this
  ///  transaction's valid rounds
  ///
  ///  strict_empty_address_check: set this to False if you
  ///  want to specify empty addresses. Otherwise, if this is left as
  ///  True (the default), having empty addresses will raise an error,
  ///  which will prevent accidentally removing admin access to assets or
  ///  deleting the asset.
  ///
  ///  decimals: number of digits to use for display after
  ///  decimal. If set to 0, the asset is not divisible. If set to 1, the
  ///  base unit of the asset is in tenths. Must be between 0 and 19,
  ///  inclusive. Defaults to 0.
  AssetConfigTxn(
      {@required String sender,
      @required int fee,
      @required int first_valid_round,
      @required int last_valid_round,
      Uint8List note,
      String genesis_id,
      @required String genesis_hash,
      Uint8List lease,
      bool flat_fee = false,
      this.total,
      this.default_frozen = false,
      this.unit_name,
      this.asset_name,
      this.manager,
      this.reserve,
      this.freeze,
      this.clawback,
      this.url,
      this.metadata_hash,
      this.index,
      bool strict_empty_address_check = true,
      this.decimals})
      : super(
            sender: sender,
            fee: fee,
            first_valid_round: first_valid_round,
            last_valid_round: last_valid_round,
            note: note,
            genesis_id: genesis_id,
            genesis_hash: genesis_hash,
            lease: lease,
            type: ASSETCONFIG_TXN) {
    if (default_frozen == null) {
      throw ArgumentError();
    }

    this.fee = flat_fee
        ? max(MIN_TXN_FEE, fee)
        : max(estimate_size() * fee, MIN_TXN_FEE);

    if (strict_empty_address_check) {
      if (!(manager != null &&
          reserve != null &&
          freeze != null &&
          clawback != null)) {
        throw EmptyAddressError();
      }
    }

    if (decimals != null) {
      if (decimals < 0 || decimals > MAX_ASSET_DECIMALS) {
        throw OutOfRangeDecimalsError();
      }
    }

    if (metadata_hash != null) {
      if (metadata_hash.length != METADATA_LENGTH) {
        throw WrongMetadataLengthError();
      }
    }
  }

  @override
  SplayTreeMap<String, dynamic> dictify() {
    final m = super.dictify();

    if (total != null ||
        default_frozen ||
        unit_name != null ||
        asset_name != null ||
        manager != null ||
        reserve != null ||
        freeze != null ||
        clawback != null ||
        decimals != null) {
      final apar = SplayTreeMap<String, dynamic>();

      if (metadata_hash != null) {
        apar['am'] = metadata_hash;
      }

      if (asset_name != null) {
        apar['an'] = asset_name;
      }

      if (url != null) {
        apar['au'] = url;
      }

      if (clawback != null) {
        apar['c'] = decode_address(clawback);
      }

      if (decimals != null) {
        apar['dc'] = decimals;
      }

      if (default_frozen) {
        apar['df'] = default_frozen;
      }

      if (freeze != null) {
        apar['f'] = decode_address(freeze);
      }

      if (manager != null) {
        apar['m'] = decode_address(manager);
      }

      if (reserve != null) {
        apar['r'] = decode_address(reserve);
      }

      if (total != null) {
        apar['t'] = total;
      }

      if (unit_name != null) {
        apar['un'] = unit_name;
      }

      m['apar'] = apar;
    }

    if (index != null && index != 0) {
      m['caid'] = index;
    }

    return m;
  }

  static Map<String, dynamic> undictify(Map<String, dynamic> m) {
    final args = <String, dynamic>{};

    if (m.containsKey('caid')) {
      args['index'] = m['caid'];
    }

    if (m.containsKey('apar')) {
      Map<String, dynamic> apar = Map.from(m['apar']);

      args['total'] = apar.containsKey('t') ? apar['t'] : null;

      args['default_frozen'] = apar.containsKey('df') ? apar['df'] : false;

      args['unit_name'] = apar.containsKey('un') ? apar['un'] : null;

      args['asset_name'] = apar.containsKey('an') ? apar['an'] : null;

      args['manager'] =
          apar.containsKey('m') ? encode_address(apar['m']) : null;

      args['reserve'] =
          apar.containsKey('r') ? encode_address(apar['r']) : null;

      args['freeze'] = apar.containsKey('f') ? encode_address(apar['f']) : null;

      args['clawback'] =
          apar.containsKey('c') ? encode_address(apar['c']) : null;

      args['url'] = apar.containsKey('au') ? apar['au'] : null;

      args['metadata_hash'] = apar.containsKey('am') ? apar['am'] : null;

      args['decimals'] = apar.containsKey('dc') ? apar['dc'] : null;
    }

    return args;
  }
}
