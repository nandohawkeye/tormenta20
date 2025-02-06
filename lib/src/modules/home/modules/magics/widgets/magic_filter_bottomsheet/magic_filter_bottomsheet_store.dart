// ignore_for_file: prefer_final_fields, unused_field
import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_utils.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_filter_dto.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

class MagicFilterBottomsheetStore extends ChangeNotifier {
  MagicFilterBottomsheetStore(MagicFilterDto dto) {
    _typesSelecteds.addAll(dto.types);
    _schoolsSelecteds.addAll(dto.schools);
    _rangesSelecteds.addAll(dto.ranges);
    _resistenciesSelecteds.addAll(dto.resistences);
    _durationsSelecteds.addAll(dto.durations);
    _executionsSelecteds.addAll(dto.executions);
  }

  List<MagicType> get types => MagicsUtils.allTypes;
  List<MagicType> _typesSelecteds = [];
  List<MagicType> get typesSelecteds => _typesSelecteds;

  void _onTapType(MagicType value) {
    if (_typesSelecteds.contains(value)) {
      _typesSelecteds.remove(value);
    } else {
      _typesSelecteds.add(value);
    }
  }

  List<MagicSchool> get schools => MagicsUtils.allSchools;
  List<MagicSchool> _schoolsSelecteds = [];
  List<MagicSchool> get schoolsSelecteds => _schoolsSelecteds;

  void _onTapSchool(MagicSchool value) {
    if (_schoolsSelecteds.contains(value)) {
      _schoolsSelecteds.remove(value);
    } else {
      _schoolsSelecteds.add(value);
    }
  }

  List<MagicRange> get ranges => MagicsUtils.allRanges;
  List<MagicRange> _rangesSelecteds = [];
  List<MagicRange> get rangesSelecteds => _rangesSelecteds;

  void _onTapRanges(MagicRange value) {
    if (_rangesSelecteds.contains(value)) {
      _rangesSelecteds.remove(value);
    } else {
      _rangesSelecteds.add(value);
    }
  }

  List<MagicCircle> get circles => MagicsUtils.allCircles;
  List<MagicCircle> _circlesSelecteds = [];
  List<MagicCircle> get circlesSelecteds => _circlesSelecteds;

  void _onTapCircle(MagicCircle value) {
    if (_circlesSelecteds.contains(value)) {
      _circlesSelecteds.remove(value);
    } else {
      _circlesSelecteds.add(value);
    }
  }

  List<MagicDuration> get durations => MagicsUtils.allDurations;
  List<MagicDuration> _durationsSelecteds = [];
  List<MagicDuration> get durationsSelecteds => _durationsSelecteds;

  void _onTapDuration(MagicDuration value) {
    if (durationsSelecteds.contains(value)) {
      durationsSelecteds.remove(value);
    } else {
      durationsSelecteds.add(value);
    }
  }

  List<MagicExecution> get executions => MagicsUtils.allExecutions;
  List<MagicExecution> _executionsSelecteds = [];
  List<MagicExecution> get executionsSelecteds => _executionsSelecteds;

  void _onTapExecution(MagicExecution value) {
    if (executionsSelecteds.contains(value)) {
      executionsSelecteds.remove(value);
    } else {
      executionsSelecteds.add(value);
    }
  }

  List<String> get resistencies => MagicsUtils.allResistencies;
  List<String> _resistenciesSelecteds = [];
  List<String> get resistenciesSelecteds => _resistenciesSelecteds;

  void _onTapResistence(String value) {
    if (resistenciesSelecteds.contains(value)) {
      resistenciesSelecteds.remove(value);
    } else {
      resistenciesSelecteds.add(value);
    }
  }

  void onTap(dynamic value) {
    if (value is MagicType) {
      _onTapType(value);
    } else if (value is MagicSchool) {
      _onTapSchool(value);
    } else if (value is MagicRange) {
      _onTapRanges(value);
    } else if (value is MagicCircle) {
      _onTapCircle(value);
    } else if (value is MagicDuration) {
      _onTapDuration(value);
    } else if (value is MagicExecution) {
      _onTapExecution(value);
    } else if (value is String) {
      _onTapResistence(value);
    } else {}

    notifyListeners();
  }

  MagicFilterDto onConfirmChanges() {
    return MagicFilterDto(
      types: _typesSelecteds,
      schools: _schoolsSelecteds,
      ranges: _rangesSelecteds,
      resistences: _resistenciesSelecteds,
      durations: _durationsSelecteds,
      executions: _executionsSelecteds,
    );
  }
}
