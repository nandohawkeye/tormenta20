import 'package:tormenta20/src/shared/entities/dices/dice.dart';

class RollDice extends Dice {
  List<int> rolledDicesValue = [];
  int value = 0;

  RollDice({
    required super.uuid,
    required super.quantity,
    required super.dice,
  });

  @override
  String toString() => '${quantity}D$dice';

  @override
  bool operator ==(other) =>
      other is RollDice &&
      other.uuid == uuid &&
      other.quantity == quantity &&
      other.dice == dice &&
      other.rolledDicesValue == rolledDicesValue &&
      other.value == value;

  @override
  int get hashCode =>
      uuid.hashCode ^
      quantity.hashCode ^
      dice.hashCode ^
      rolledDicesValue.hashCode ^
      value.hashCode;

  @override
  String get exibitionLabel => toString();

  @override
  get primaryKey => uuid;
}
