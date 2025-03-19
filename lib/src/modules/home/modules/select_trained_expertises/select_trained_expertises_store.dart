// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_base.dart';
import 'package:tormenta20/src/shared/services/expertises_base_service.dart';

class SelectTrainedExpertisesStore extends ChangeNotifier {
  SelectTrainedExpertisesStore(List<ExpertiseBase> initial) {
    _selectedExpertises.addAll(initial);
    _expertises.addAll(ExpertisesBaseService().getExpertises());
  }

  List<ExpertiseBase> _expertises = [];
  List<ExpertiseBase> get expertises => _expertises;

  List<ExpertiseBase> _selectedExpertises = [];
  List<ExpertiseBase> get selectedExpertises => _selectedExpertises;
  void setSelectedExpertise(ExpertiseBase value) {
    if (_selectedExpertises.contains(value)) {
      _selectedExpertises.remove(value);
    } else {
      _selectedExpertises.add(value);
    }

    notifyListeners();
  }
}
