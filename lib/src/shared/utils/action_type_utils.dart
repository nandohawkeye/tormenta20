import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class ActionTypeUtils {
  static String handleMenaceTitle(String value) {
    if (value.contains('passive')) {
      return 'Passiva';
    } else if (value.contains('free')) {
      return 'Livre';
    } else if (value.contains('standard')) {
      return 'Padrão';
    } else if (value.contains('movement')) {
      return 'Movimento';
    } else if (value.contains('complete')) {
      return 'Completa';
    } else if (value.contains('reaction')) {
      return 'Reação';
    } else {
      return value.capitalize().trim();
    }
  }
}
