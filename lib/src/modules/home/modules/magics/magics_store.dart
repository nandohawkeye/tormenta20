// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_service.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circles.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class MagicsStore extends ChangeNotifier {
  final MagicsService _service = MagicsService();

  List<Magic> _magics = [];
  List<Magic> get magics => _magics
      .where(
        (m) =>
            (m.name.toLowerCase().replaceAllDiacritics().contains(
                    _searchFilter.toLowerCase().replaceAllDiacritics()) ||
                m.desc.toLowerCase().replaceAllDiacritics().contains(
                    _searchFilter.toLowerCase().replaceAllDiacritics()) ||
                m.targetAreaEfect.toLowerCase().replaceAllDiacritics().contains(
                    _searchFilter.toLowerCase().replaceAllDiacritics())) &&
            _typesSelecteds.contains(m.type) &&
            _schoolsSelecteds.contains(m.school) &&
            _rangesSelecteds.contains(m.range) &&
            _circlesSelecteds.contains(m.circle) &&
            _durationsSelected.contains(m.duration) &&
            _executionsSelecteds.contains(m.execution) &&
            _resistenciesSelecteds.any(
                (r) => m.resistence.toLowerCase().contains(r.toLowerCase())),
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

  List<MagicType> _typesSelecteds = [
    MagicType.Arcana,
    MagicType.Divina,
    MagicType.Universal
  ];

  List<MagicSchool> _schoolsSelecteds = [
    MagicSchool.Abjuracao,
    MagicSchool.Adivinhacao,
    MagicSchool.Convocacao,
    MagicSchool.Encantamento,
    MagicSchool.Evocacao,
    MagicSchool.Ilusao,
    MagicSchool.Necromancia,
    MagicSchool.Transmutacao,
  ];

  List<MagicRange> _rangesSelecteds = [
    MagicRange.Curto,
    MagicRange.Ilimitado,
    MagicRange.Longo,
    MagicRange.Medio,
    MagicRange.Pessoal,
    MagicRange.Toque,
  ];

  List<MagicCircle> _circlesSelecteds = [
    firstCircle,
    secondCircle,
    thirdCircle,
    fourthCircle,
    fifthCircle,
  ];

  List<MagicDuration> _durationsSelected = [
    MagicDuration.Cena,
    MagicDuration.Instantanea,
    MagicDuration.Sustentada,
  ];

  List<MagicExecution> _executionsSelecteds = [
    MagicExecution.Completa,
    MagicExecution.Livre,
    MagicExecution.Padrao,
    MagicExecution.Reacao,
  ];

  List<String> _resistenciesSelecteds = [
    'Fortitude',
    'Reflexos',
    'Vontade',
    'Nenhuma',
  ];

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
