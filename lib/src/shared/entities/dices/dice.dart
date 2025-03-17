import 'package:tormenta20/src/shared/entities/entity_base.dart';

class Dice extends EntityBase {
  final String uuid;
  final int quantity;
  final int dice;

  Dice({
    required this.uuid,
    required this.quantity,
    required this.dice,
  });

  @override
  String toString() => '${quantity}D$dice';

  @override
  bool operator ==(other) =>
      other is Dice &&
      other.uuid == uuid &&
      other.quantity == quantity &&
      other.dice == dice;

  @override
  int get hashCode => uuid.hashCode ^ quantity.hashCode ^ dice.hashCode;

  @override
  String get exibitionLabel => toString();

  @override
  get primaryKey => uuid;
}
