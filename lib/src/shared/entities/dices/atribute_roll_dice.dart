import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/dices/dice.dart';

class AtributeRollDice extends Dice {
  List<int> rolledDicesValue = [];
  int atributeValue = 0;
  Atribute? atribute;

  AtributeRollDice({
    required super.uuid,
    super.quantity = 4,
    super.dice = 6,
  });

  @override
  String toString() => '${quantity}D$dice';

  @override
  bool operator ==(other) =>
      other is AtributeRollDice &&
      other.uuid == uuid &&
      other.quantity == quantity &&
      other.dice == dice &&
      other.rolledDicesValue == rolledDicesValue &&
      other.atributeValue == atributeValue &&
      other.atribute == atribute;

  @override
  int get hashCode =>
      uuid.hashCode ^
      quantity.hashCode ^
      dice.hashCode ^
      rolledDicesValue.hashCode ^
      atributeValue.hashCode ^
      atribute.hashCode;

  @override
  String get exibitionLabel => toString();

  @override
  get primaryKey => uuid;
}
