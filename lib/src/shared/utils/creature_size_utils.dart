import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class CreatureSizeUtils {
  static String handleTitle(String value) {
    if (value.contains('tiny')) {
      return 'Minúsculo';
    } else if (value.contains('small')) {
      return 'Pequeno';
    } else if (value.contains('medium')) {
      return 'Médio';
    } else if (value.contains('big')) {
      return 'Grande';
    } else if (value.contains('huge')) {
      return 'Enorme';
    } else {
      return value.capitalize().trim();
    }
  }
}
