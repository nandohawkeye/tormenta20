import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class CombatRoleUtils {
  static String handleTitle(String value) {
    if (value.contains('footman')) {
      return 'Lacaio';
    } else if (value.contains('special')) {
      return 'Especial';
    } else {
      return value.capitalize().trim();
    }
  }
}
