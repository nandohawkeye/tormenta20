import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentWeaponTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('court')) {
      return 'Corte';
    } else if (value.contains('impact')) {
      return 'Impacto';
    } else if (value.contains('perforation')) {
      return 'Perfuração';
    } else {
      return value.capitalize().trim();
    }
  }
}
