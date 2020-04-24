import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'asset_transfer_transaction_type.g.dart';

abstract class AssetTransferTransactionType
    implements
        Built<AssetTransferTransactionType,
            AssetTransferTransactionTypeBuilder> {
  /* Amount is the amount being transferred. */
  @nullable
  @BuiltValueField(wireName: r'amt')
  int get amt;
  /* CloseTo is the destination for remaining funds (if closing). */
  @nullable
  @BuiltValueField(wireName: r'closeto')
  String get closeto;
  /* AssetID is the asset being configured (or empty if creating) */
  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;
  /* Receiver is the recipient account. */
  @nullable
  @BuiltValueField(wireName: r'rcv')
  String get rcv;
  /* Sender is the source account (if using clawback). */
  @nullable
  @BuiltValueField(wireName: r'snd')
  String get snd;

  // Boilerplate code needed to wire-up generated code
  AssetTransferTransactionType._();

  factory AssetTransferTransactionType(
          [updates(AssetTransferTransactionTypeBuilder b)]) =
      _$AssetTransferTransactionType;
  static Serializer<AssetTransferTransactionType> get serializer =>
      _$assetTransferTransactionTypeSerializer;
}
