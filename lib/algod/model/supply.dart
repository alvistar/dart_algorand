import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'supply.g.dart';

abstract class Supply implements Built<Supply, SupplyBuilder> {
  /* OnlineMoney */
  @nullable
  @BuiltValueField(wireName: r'onlineMoney')
  int get onlineMoney;

  /* Round */
  @nullable
  @BuiltValueField(wireName: r'round')
  int get round;

  /* TotalMoney */
  @nullable
  @BuiltValueField(wireName: r'totalMoney')
  int get totalMoney;

  // Boilerplate code needed to wire-up generated code
  Supply._();

  factory Supply([updates(SupplyBuilder b)]) = _$Supply;

  static Serializer<Supply> get serializer => _$supplySerializer;
}
