import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class TreasureTypeUtils {
  static String handleMenaceTitle(String value) {
    if (value.contains('none')) {
      return 'Nenhum';
    } else if (value.contains('standard')) {
      return 'Padrão';
    } else if (value == 'half') {
      return 'Métade';
    } else if (value == 'double') {
      return 'Dobro';
    } else {
      return value.capitalize().trim();
    }
  }
}
