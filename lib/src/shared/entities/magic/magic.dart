import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

class Magic {
  final String name;
  final String desc;
  final MagicCircle circle;
  final MagicType type;
  final MagicSchool school;
  final MagicExecution execution;
  final MagicDuration duration;
  final MagicRange range;
  final String resistence;
  final String targetAreaEfect;
  final int id;

  Magic({
    required this.id,
    required this.name,
    required this.desc,
    required this.circle,
    required this.type,
    required this.school,
    required this.execution,
    required this.duration,
    required this.range,
    required this.resistence,
    required this.targetAreaEfect,
  });

  @override
  bool operator ==(other) =>
      other is Magic &&
      other.desc == desc &&
      other.name == name &&
      other.circle == circle &&
      other.type == type &&
      other.school == school &&
      other.execution == execution &&
      other.duration == duration &&
      other.range == range &&
      other.resistence == resistence &&
      other.targetAreaEfect == targetAreaEfect &&
      other.id == id;

  @override
  int get hashCode =>
      desc.hashCode ^
      name.hashCode ^
      circle.hashCode ^
      type.hashCode ^
      school.hashCode ^
      execution.hashCode ^
      duration.hashCode ^
      range.hashCode ^
      resistence.hashCode ^
      targetAreaEfect.hashCode ^
      id.hashCode;
}
