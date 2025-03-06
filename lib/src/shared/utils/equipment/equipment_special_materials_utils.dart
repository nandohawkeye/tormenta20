import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentSpecialMaterialsUtils {
  static String handleTitle(String value) {
    if (value.contains('Aco')) {
      return 'Aço-Rubi';
    } else if (value.contains('Gelo')) {
      return 'Gelo eterno';
    } else if (value.contains('Mira')) {
      return 'Mira telescopica';
    } else if (value.contains('Madeira')) {
      return 'Madeira tollon';
    } else if (value.contains('Energetico')) {
      return 'Energético';
    } else if (value.contains('Materia')) {
      return 'Materia vermelha';
    } else {
      return value.capitalize().trim();
    }
  }
}
