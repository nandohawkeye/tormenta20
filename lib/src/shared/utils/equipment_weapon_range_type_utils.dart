import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentWeaponRangeTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('short')) {
      return 'Curto';
    } else if (value.contains('medium')) {
      return 'Médio';
    } else if (value.contains('long')) {
      return 'Longo';
    } else {
      return value.capitalize().trim();
    }
  }
}
