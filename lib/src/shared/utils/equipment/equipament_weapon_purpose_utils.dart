import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipamentWeaponPurposeUtils {
  static String handleTitle(String value) {
    if (value.contains('melee')) {
      return 'Corpo-a-corpo';
    } else if (value.contains('pitch')) {
      return 'Arremesso (á distância)';
    } else if (value.contains('shooting')) {
      return 'Disparo (á distância)';
    } else {
      return value.capitalize().trim();
    }
  }
}
