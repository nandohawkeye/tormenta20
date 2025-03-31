import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_duration.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_execution.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_range.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_school.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_type.dart';

class Magic extends EntityBase {
  final String name;
  final String desc;
  final MagicCircle circle;
  final MagicType type;
  final MagicSchool school;
  final MagicExecution execution;
  final MagicDuration duration;
  final MagicRange range;
  final String resistence;
  final String targetAreaEffect;
  final int id;
  final String publication;

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
    required this.targetAreaEffect,
    required this.publication,
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
      other.targetAreaEffect == targetAreaEffect &&
      other.id == id &&
      other.publication == publication;

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
      targetAreaEffect.hashCode ^
      id.hashCode ^
      publication.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => id;
}
