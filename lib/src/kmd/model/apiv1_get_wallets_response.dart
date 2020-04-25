import 'package:built_collection/built_collection.dart';
import 'apiv1_wallet.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apiv1_get_wallets_response.g.dart';

abstract class APIV1GETWalletsResponse
    implements Built<APIV1GETWalletsResponse, APIV1GETWalletsResponseBuilder> {
  @nullable
  @BuiltValueField(wireName: r'error')
  bool get error;

  @nullable
  @BuiltValueField(wireName: r'message')
  String get message;

  @nullable
  @BuiltValueField(wireName: r'wallets')
  BuiltList<APIV1Wallet> get wallets;

  // Boilerplate code needed to wire-up generated code
  APIV1GETWalletsResponse._();

  factory APIV1GETWalletsResponse([updates(APIV1GETWalletsResponseBuilder b)]) =
      _$APIV1GETWalletsResponse;

  static Serializer<APIV1GETWalletsResponse> get serializer =>
      _$aPIV1GETWalletsResponseSerializer;
}
