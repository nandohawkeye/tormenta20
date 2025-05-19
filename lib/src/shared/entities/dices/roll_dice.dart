import 'package:tormenta20/src/shared/entities/dices/dice.dart';

class RollDice extends Dice {
  List<int> rolledDicesValue = [];
  int value = 0;

  RollDice({
    required super.uuid,
    required super.quantity,
    required super.sides,
  });

  @override
  String toString() => '${quantity}D$sides';

  @override
  bool operator ==(other) =>
      other is RollDice &&
      other.uuid == uuid &&
      other.quantity == quantity &&
      other.sides == sides &&
      other.rolledDicesValue == rolledDicesValue &&
      other.value == value;

  @override
  int get hashCode =>
      uuid.hashCode ^
      quantity.hashCode ^
      sides.hashCode ^
      rolledDicesValue.hashCode ^
      value.hashCode;

  @override
  String get exibitionLabel => toString();

  @override
  get primaryKey => uuid;
}
