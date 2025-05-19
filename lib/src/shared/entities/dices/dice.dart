import 'package:tormenta20/src/shared/entities/entity_base.dart';

class Dice extends EntityBase {
  final String uuid;
  final int quantity;
  final int sides;

  Dice({
    required this.uuid,
    required this.quantity,
    required this.sides,
  });

  @override
  String toString() => '${quantity}D$sides';

  @override
  bool operator ==(other) =>
      other is Dice &&
      other.uuid == uuid &&
      other.quantity == quantity &&
      other.sides == sides;

  @override
  int get hashCode => uuid.hashCode ^ quantity.hashCode ^ sides.hashCode;

  @override
  String get exibitionLabel => toString();

  @override
  get primaryKey => uuid;
}
