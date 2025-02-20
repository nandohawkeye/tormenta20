import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class CreatureVisionUtils {
  static String handleTitle(String value) {
    if (value.contains('twilight')) {
      return 'Penumbra';
    } else if (value.contains('dark')) {
      return 'Escuro';
    } else {
      return value.capitalize().trim();
    }
  }
}
