import 'dart:math';

import 'package:tormenta20/src/shared/entities/dices/atribute_roll_dice.dart';
import 'package:tormenta20/src/shared/utils/atribute_roll_dice_utils.dart';

extension AtributeRollDiceExt on AtributeRollDice {
  void roll() {
    for (int i = 0; i < 4; i++) {
      Random random = Random();
      int aleatory = 1 + random.nextInt(6);
      rolledDicesValue.add(aleatory);
    }

    rolledDicesValue.sort((a, b) => b.compareTo(a));

    List<int> toSomeList = rolledDicesValue.sublist(0, 3);

    final some = toSomeList.reduce((a, b) => a + b);

    atributeValue = AtributeRollDiceUtils.atributeValueForRoll(some);
  }
}
