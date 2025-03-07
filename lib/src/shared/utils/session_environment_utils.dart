import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class SessionEnvironmentUtils {
  static String handleTitle(String value) {
    if (value.contains('subterraneo')) {
      return 'Subterrâneo';
    } else if (value.contains('pantano')) {
      return 'Pântano';
    } else if (value.contains('artico')) {
      return 'Ártico';
    } else if (value.contains('planicie')) {
      return 'Planície';
    } else if (value.contains('aquatico')) {
      return 'Aquático';
    } else {
      return value.capitalize().trim();
    }
  }
}
