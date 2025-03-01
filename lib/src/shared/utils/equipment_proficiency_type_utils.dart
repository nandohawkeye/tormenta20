import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentProficiencyTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('simple')) {
      return 'Simples';
    } else if (value == ('martial')) {
      return 'Marcial';
    } else if (value == ('exotic')) {
      return 'Exótica';
    } else if (value.contains('fire')) {
      return 'Arma de fogo';
    } else {
      return value.capitalize().trim();
    }
  }
}
