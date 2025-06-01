import 'package:tormenta20/src/shared/entities/entity_base.dart';

class MenaceExpertise extends EntityBase {
  final String uuid;
  final String name;
  final String menaceUuid;
  final int expertiseParentId;
  final int value;
  final DateTime createdAt;
  final DateTime updatedAt;

  MenaceExpertise({
    required this.uuid,
    required this.name,
    required this.menaceUuid,
    required this.expertiseParentId,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(other) =>
      other is MenaceExpertise &&
      other.uuid == uuid &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.menaceUuid == menaceUuid &&
      other.expertiseParentId == expertiseParentId &&
      other.value == value;

  @override
  int get hashCode =>
      uuid.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      menaceUuid.hashCode ^
      expertiseParentId.hashCode ^
      value.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
