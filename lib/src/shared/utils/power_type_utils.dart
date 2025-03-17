import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class PowerTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('general')) {
      return 'Geral';
    } else if (value.contains('unic')) {
      return 'Único';
    } else if (value.contains('divinity')) {
      return 'Divindade';
    } else {
      return value.capitalize().trim();
    }
  }
}
