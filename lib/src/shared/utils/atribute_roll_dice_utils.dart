abstract class AtributeRollDiceUtils {
  static int atributeValueForRoll(int roll) {
    if (roll == 18) {
      return 4;
    } else if (roll == 17 || roll == 16) {
      return 3;
    } else if (roll == 15 || roll == 14) {
      return 2;
    } else if (roll == 13 || roll == 12) {
      return 1;
    } else if (roll == 11 || roll == 10) {
      return 0;
    } else if (roll == 9 || roll == 8) {
      return -1;
    } else {
      return -2;
    }
  }
}
