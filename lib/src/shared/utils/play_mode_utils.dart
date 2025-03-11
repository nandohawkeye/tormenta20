import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class PlayModeUtils {
  static String handleTitle(String value) {
    if (value.contains('full')) {
      return 'Completo';
    } else if (value.contains('player')) {
      return 'Jogador';
    } else if (value.contains('master')) {
      return 'Mestre';
    } else {
      return value.capitalize().trim();
    }
  }
}
