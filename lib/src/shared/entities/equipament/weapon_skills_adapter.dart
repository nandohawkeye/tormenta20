import 'package:tormenta20/src/shared/entities/equipament/weapon_skills.dart';

abstract class WeaponSkillsAdapter {
  static List<WeaponSkills> fromString(String? value) {
    if (value == null) {
      return [];
    }

    if (value.isEmpty) {
      return [];
    }

    final indexList = value.split(',').map((v) => int.parse(v)).toList();
    return indexList.map((i) => WeaponSkills.values[i]).toList();
  }

  static String? toStringValue(List<WeaponSkills> values) {
    if (values.isEmpty) {
      return null;
    }

    int index = 0;
    String formatted = '';

    for (var value in values) {
      if (index > 0) {
        formatted += ',${value.index}';
      } else {
        formatted += '${value.index}';
      }
    }

    return formatted;
  }
}
