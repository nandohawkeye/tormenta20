import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class MenaceUtils {
  static String handleMenaceTitle(String value) {
    if (value.contains('animals')) {
      return 'Animal';
    } else if (value.contains('constructs')) {
      return 'Constructo';
    } else if (value == 'spirits') {
      return 'Espirito';
    } else if (value == 'humanoids') {
      return 'Humanoide';
    } else if (value.contains('monsters')) {
      return 'Monstro';
    } else if (value.contains('undead')) {
      return 'Morto-vivo';
    } else {
      return value.capitalize().trim();
    }
  }
}
