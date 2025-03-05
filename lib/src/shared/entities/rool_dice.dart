import 'package:tormenta20/src/shared/entities/entity_base.dart';

class RoolDice extends EntityBase {
  final String uuid;
  final String quantity;
  final String dice;

  RoolDice({
    required this.uuid,
    required this.quantity,
    required this.dice,
  });

  @override
  String toString() => '${quantity}D$dice';

  @override
  bool operator ==(other) =>
      other is RoolDice &&
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
