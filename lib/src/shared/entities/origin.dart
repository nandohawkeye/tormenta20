import 'package:tormenta20/src/shared/entities/entity_base.dart';

class Origin extends EntityBase {
  final String uuid;
  final String name;
  final String desc;
  final String characterUuid;
  final DateTime createdAt;
  final DateTime updatedAt;

  Origin({
    required this.uuid,
    required this.name,
    required this.desc,
    required this.characterUuid,
    required this.createdAt,
    required this.updatedAt,
  });

  Origin copyWith({
    String? uuid,
    String? name,
    String? desc,
    String? characterUuid,
  }) {
    final now = DateTime.now();
    return Origin(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      createdAt: now,
      updatedAt: now,
      characterUuid: characterUuid ?? this.characterUuid,
    );
  }

  @override
  String get exibitionLabel => name;

  @override
  String get primaryKey => uuid;

  @override
  bool operator ==(other) =>
      other is Origin &&
      other.uuid == uuid &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.characterUuid == characterUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      characterUuid.hashCode;
}
