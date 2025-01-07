// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_service.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_utils.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class MagicsStore extends ChangeNotifier {
  final MagicsService _service = MagicsService();

  bool _compareText(String value) => value
      .toLowerCase()
      .replaceAllDiacritics()
      .contains(_searchFilter.toLowerCase().replaceAllDiacritics());

  List<Magic> _magics = [];
  List<Magic> get magics => _magics
      .where(
        (m) =>
            (_compareText(m.name) ||
                _compareText(m.desc) ||
                _compareText(m.targetAreaEfect) ||
                _compareText(m.publication)) &&
            (_typesSelecteds.isNotEmpty
                ? _typesSelecteds.contains(m.type)
                : MagicsUtils.allTypes.contains(m.type)) &&
            (_schoolsSelecteds.isNotEmpty
                ? _schoolsSelecteds.contains(m.school)
                : MagicsUtils.allSchools.contains(m.school)) &&
            (_rangesSelecteds.isNotEmpty
                ? _rangesSelecteds.contains(m.range)
                : MagicsUtils.allRanges.contains(m.range)) &&
            (_circlesSelecteds.isNotEmpty
                ? _circlesSelecteds.contains(m.circle)
                : MagicsUtils.allCircles.contains(m.circle)) &&
            (_durationsSelected.isNotEmpty
                ? _durationsSelected.contains(m.duration)
                : MagicsUtils.allDurations.contains(m.duration)) &&
            (_executionsSelecteds.isNotEmpty
                ? _executionsSelecteds.contains(m.execution)
                : MagicsUtils.allExecutions.contains(m.execution)) &&
            (_resistenciesSelecteds.isNotEmpty
                ? _resistenciesSelecteds.any(
                    (r) => m.resistence.toLowerCase().contains(r.toLowerCase()))
                : MagicsUtils.allResistencies.any((r) =>
                    m.resistence.toLowerCase().contains(r.toLowerCase()))),
      )
      .toList();

  bool _searchEnable = false;
  bool get searchEnable => _searchEnable;
  void changeSearchEnable(bool value) {
    _searchEnable = value;
    if (!value) {
      _searchFilter = '';
    }

    notifyListeners();
  }

  String _searchFilter = '';
  String get searchFilter => _searchFilter;
  void changeSearchFilter(String? value) {
    if (value == null) {
      return;
    }

    _searchFilter = value;
    notifyListeners();
  }

  void init() {
    _magics.addAll(_service.getAllMagics());
  }

  List<MagicType> _typesSelecteds = [];
  List<MagicSchool> _schoolsSelecteds = [];
  List<MagicRange> _rangesSelecteds = [];
  List<MagicCircle> _circlesSelecteds = [];
  List<MagicDuration> _durationsSelected = [];
  List<MagicExecution> _executionsSelecteds = [];
  List<String> _resistenciesSelecteds = [];

  bool get hasFilterAplied =>
      _typesSelecteds.isNotEmpty ||
      _schoolsSelecteds.isNotEmpty ||
      _rangesSelecteds.isNotEmpty ||
      _circlesSelecteds.isNotEmpty ||
      _durationsSelected.isNotEmpty ||
      _executionsSelecteds.isNotEmpty ||
      _resistenciesSelecteds.isNotEmpty;

  MagicFilterDto toFilterDto() {
    return MagicFilterDto(
      circles: _circlesSelecteds,
      schools: _schoolsSelecteds,
      ranges: _rangesSelecteds,
      types: _typesSelecteds,
      resistences: _resistenciesSelecteds,
      durations: _durationsSelected,
      executions: _executionsSelecteds,
    );
  }

  void changeFilters(MagicFilterDto dto) {
    _typesSelecteds.clear();
    _schoolsSelecteds.clear();
    _rangesSelecteds.clear();
    _circlesSelecteds.clear();
    _resistenciesSelecteds.clear();
    _durationsSelected.clear();
    _executionsSelecteds.clear();
    _typesSelecteds.addAll(dto.types);
    _schoolsSelecteds.addAll(dto.schools);
    _rangesSelecteds.addAll(dto.ranges);
    _circlesSelecteds.addAll(dto.circles);
    _resistenciesSelecteds.addAll(dto.resistences);
    _durationsSelected.addAll(dto.durations);
    _executionsSelecteds.addAll(dto.executions);
    notifyListeners();
  }
}
