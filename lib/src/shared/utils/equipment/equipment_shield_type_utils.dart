import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentShieldTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('light')) {
      return 'Leve';
    } else if (value.contains('heavy')) {
      return 'Pesada';
    } else {
      return value.capitalize().trim();
    }
  }
}
