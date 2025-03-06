import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentGenealItemTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('adventure')) {
      return 'Equipamento de aventura';
    } else if (value.contains('tools')) {
      return 'Ferramenta';
    } else if (value.contains('clothing')) {
      return 'Vestuário';
    } else if (value.contains('esoteric')) {
      return 'Esotérico';
    } else if (value.contains('preparations')) {
      return 'Preparado (Alquímico)';
    } else if (value.contains('catalysts')) {
      return 'Catalisador (Alquímico)';
    } else if (value.contains('poisons')) {
      return 'Veneno (Alquímico)';
    } else if (value.contains('food')) {
      return 'Alimento';
    } else if (value.contains('animals')) {
      return 'Animal';
    } else if (value.contains('vehicles')) {
      return 'Veículo';
    } else if (value.contains('services')) {
      return 'Serviço';
    } else {
      return value.capitalize().trim();
    }
  }
}
