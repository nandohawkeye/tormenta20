import 'package:tormenta20/src/shared/entities/dices/dice.dart';
import 'package:uuid/uuid.dart';

abstract class DiceAdapters {
  static Dice fromMacro(String value) {
    final list = value.split('D');
    return Dice(
      uuid: const Uuid().v4(),
      quantity: int.parse(list[0]),
      dice: int.parse(list[1]),
    );
  }

  static Dice create(String quantity, String diceValue) => Dice(
        uuid: const Uuid().v4(),
        quantity: int.parse(quantity),
        dice: int.parse(diceValue),
      );

  static String toMacro(Dice dice) => '${dice.quantity}D${dice.dice}';
}
