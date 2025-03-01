import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentWieldableTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('light')) {
      return 'Leve';
    } else if (value == ('oneOrTwoHand')) {
      return 'Uma ou duas mãos';
    } else if (value == ('oneHand')) {
      return 'Uma mão';
    } else if (value.contains('twoHands')) {
      return 'Duas mãos';
    } else {
      return value.capitalize().trim();
    }
  }
}
