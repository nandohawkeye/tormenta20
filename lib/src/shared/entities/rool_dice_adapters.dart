import 'package:tormenta20/src/shared/entities/rool_dice.dart';
import 'package:uuid/uuid.dart';

abstract class RoolDiceAdapters {
  static RoolDice fromMacro(String value) {
    final list = value.split('D');
    return RoolDice(
      uuid: const Uuid().v4(),
      quantity: list[0],
      dice: list[1],
    );
  }

  static RoolDice create(String quantity, String diceValue) => RoolDice(
        uuid: const Uuid().v4(),
        quantity: quantity,
        dice: diceValue,
      );

  static String toMacro(RoolDice dice) => '${dice.quantity}d${dice.dice}';
}
