import 'package:tormenta20/src/shared/entities/classe_type.dart';

abstract class ClasseCharacterAdapters {
  static List<ClasseType> fromString(String? value) {
    try {
      if (value == null) {
        return [];
      }

      if (value.isEmpty) {
        return [];
      }

      final indexList = value.split(',').map((v) => int.parse(v)).toList();
      return indexList.map((i) => ClasseType.values[i]).toList();
    } catch (e) {
      return [];
    }
  }

  static String toStringValue(List<ClasseType> values) {
    if (values.isEmpty) {
      return '';
    }

    int index = 0;
    String formatted = '';

    for (var value in values) {
      if (index == 0) {
        formatted += '${value.index}';
      } else {
        formatted += ',${value.index}';
      }

      index++;
    }

    return formatted;
  }
}
