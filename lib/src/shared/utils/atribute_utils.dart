import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class AtributeUtils {
  static String handleTitle(String value) {
    if (value.contains('strength')) {
      return 'Força';
    } else if (value.contains('dexterity')) {
      return 'Destreza';
    } else if (value.contains('constitution')) {
      return 'Constituição';
    } else if (value.contains('intelligence')) {
      return 'Inteligência';
    } else if (value.contains('wisdom')) {
      return 'Sabedoria';
    } else if (value.contains('charisma')) {
      return 'Carisma';
    } else {
      return value.capitalize().trim();
    }
  }

  static String resumedTitle(Atribute atribute) {
    if (atribute == Atribute.strength) {
      return 'FOR: ';
    } else if (atribute == Atribute.dexterity) {
      return 'DES: ';
    } else if (atribute == Atribute.constitution) {
      return 'CON: ';
    } else if (atribute == Atribute.intelligence) {
      return 'INT: ';
    } else if (atribute == Atribute.wisdom) {
      return 'SAB: ';
    } else {
      return 'CAR: ';
    }
  }
}
