// ignore_for_file: prefer_final_fields

import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/services/expertises_base_service.dart';

class AddEditMenaceExpertiseStore {
  AddEditMenaceExpertiseStore() {
    _expertisesBase.addAll(_service.getExpertises());
  }

  List<ExpertiseBase> _expertisesBase = [];
  List<ExpertiseBase> get expertises => _expertisesBase;
  final ExpertisesBaseService _service = ExpertisesBaseService();
}
