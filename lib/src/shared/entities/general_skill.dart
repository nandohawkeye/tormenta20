import 'package:tormenta20/src/shared/entities/entity_base.dart';

class GeneralSkill extends EntityBase {
  final String uuid;
  final String name;
  final String desc;
  final String parentUuid;
  final DateTime createdAt;
  final DateTime updatedAt;

  GeneralSkill({
    required this.uuid,
    required this.name,
    required this.desc,
    required this.parentUuid,
    required this.createdAt,
    required this.updatedAt,
  });

  GeneralSkill cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return GeneralSkill(
      uuid: uuid,
      name: name,
      desc: desc,
      parentUuid: parentUuid,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  bool operator ==(other) =>
      other is GeneralSkill &&
      other.uuid == uuid &&
      other.name == name &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.parentUuid == parentUuid;

  @override
  int get hashCode =>
      uuid.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      parentUuid.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
