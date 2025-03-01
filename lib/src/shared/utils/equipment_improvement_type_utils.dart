import 'package:tormenta20/src/shared/extensions/string_ext.dart';

abstract class EquipmentImprovementTypeUtils {
  static String handleTitle(String value) {
    if (value.contains('Injecao')) {
      return 'Injeção alquimica';
    } else if (value == ('Macica')) {
      return 'Maciça';
    } else if (value.contains('Mira')) {
      return 'Mira telescopica';
    } else if (value.contains('Reforcada')) {
      return 'Reforçada';
    } else if (value.contains('Energetico')) {
      return 'Energético';
    } else if (value.contains('ouro')) {
      return 'Banhado a ouro';
    } else if (value.contains('Cravejado')) {
      return 'Cravejado de gemas';
    } else {
      return value.capitalize().trim();
    }
  }
}
