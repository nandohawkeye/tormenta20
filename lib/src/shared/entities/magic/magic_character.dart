import 'package:tormenta20/src/shared/entities/magic/magic.dart';

class MagicCharacter extends Magic {
  final String uuid;
  final String grimoireUUid;
  MagicCharacter({
    required this.uuid,
    required this.grimoireUUid,
    required super.id,
    required super.name,
    required super.desc,
    required super.circle,
    required super.type,
    required super.school,
    required super.execution,
    required super.duration,
    required super.range,
    required super.resistence,
    required super.targetAreaEfect,
    required super.publication,
  });

  @override
  bool operator ==(other) =>
      other is MagicCharacter &&
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
      other.uuid == uuid &&
      other.id == id &&
      other.grimoireUUid == grimoireUUid &&
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
      targetAreaEfect.hashCode ^
      id.hashCode ^
      uuid.hashCode ^
      grimoireUUid.hashCode ^
      publication.hashCode;
}
