import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('Weapon')) {
      return 'Arma';
    } else if (value.contains('Ammunition')) {
      return 'Munição';
    } else if (value.contains('Armor')) {
      return 'Armadura';
    } else if (value.contains('Shield')) {
      return 'Escudo';
    } else if (value.contains('GeneralItem')) {
      return 'Item geral';
    } else if (value.contains('Saddlebag')) {
      return 'Alforja';
    } else if (value == ('AdventurerBackpack')) {
      return 'Mochila de aventureiro';
    } else if (value.contains('Backpack')) {
      return 'Mochila';
    } else {
      return value.capitalize().trim();
    }
  }
}
