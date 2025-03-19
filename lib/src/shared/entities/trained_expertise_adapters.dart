import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/services/expertises_base_service.dart';

abstract class TrainedExpertiseAdapters {
  static List<ExpertiseBase> fromString(String? value) {
    try {
      if (value == null) {
        return [];
      }

      if (value.isEmpty) {
        return [];
      }

      final indexList = value.split(',').map((v) => int.parse(v)).toList();
      final expertises = ExpertisesBaseService().getExpertises();

      return indexList
          .map((i) => expertises.firstWhere((e) => e.id == i))
          .toList();
    } catch (e) {
      return [];
    }
  }

  static String toStringValue(List<ExpertiseBase> values) {
    if (values.isEmpty) {
      return '';
    }

    int index = 0;
    String formatted = '';

    for (var value in values) {
      if (index == 0) {
        formatted += '${value.id}';
      } else {
        formatted += ',${value.id}';
      }

      index++;
    }

    return formatted;
  }
}
