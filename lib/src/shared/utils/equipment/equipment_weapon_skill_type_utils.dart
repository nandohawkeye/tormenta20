import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentWeaponSkillTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('adaptable')) {
      return 'Adaptável';
    } else if (value.contains('agile')) {
      return 'Ágil';
    } else if (value.contains('elongated')) {
      return 'Alongada';
    } else if (value.contains('unbalanced')) {
      return 'Desbalanceada';
    } else if (value.contains('pair')) {
      return 'Dupla';
    } else if (value.contains('versatile')) {
      return 'Versátil';
    } else {
      return value.capitalize().trim();
    }
  }
}
