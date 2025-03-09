import 'dart:math';

abstract class DicesUtils {
  static int result(int limiteDice) {
    return (1 + Random().nextInt(limiteDice));
  }
}
