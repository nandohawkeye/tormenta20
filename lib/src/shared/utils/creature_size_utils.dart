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

  static String handleInfo(String value) {
    if (value.contains('tiny')) {
      return '(1,5m)  +5/–5';
    } else if (value.contains('small')) {
      return '(1,5m)  +2/–2';
    } else if (value.contains('medium')) {
      return '(1,5m)  0';
    } else if (value.contains('big')) {
      return '(3m)  –2/+2';
    } else if (value.contains('huge')) {
      return '(4,5m)  –5/+5';
    } else {
      return '(9m) –10/+10';
    }
  }
}
