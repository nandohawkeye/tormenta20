import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

class MagicFilterDto {
  final List<MagicType> types;
  final List<MagicSchool> schools;
  final List<MagicRange> ranges;
  final List<MagicCircle> circles;
  final List<MagicDuration> durations;
  final List<MagicExecution> executions;
  final List<String> resistences;

  MagicFilterDto({
    required this.types,
    required this.schools,
    required this.ranges,
    required this.circles,
    required this.durations,
    required this.executions,
    required this.resistences,
  });

  @override
  bool operator ==(other) =>
      other is MagicFilterDto &&
      other.types == types &&
      other.schools == schools &&
      other.ranges == ranges &&
      other.circles == circles &&
      other.durations == durations &&
      other.executions == executions &&
      other.resistences == resistences;

  @override
  int get hashCode =>
      types.hashCode ^
      schools.hashCode ^
      ranges.hashCode ^
      circles.hashCode ^
      durations.hashCode ^
      executions.hashCode ^
      resistences.hashCode;
}
