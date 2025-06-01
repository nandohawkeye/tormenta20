import 'package:tormenta20/src/shared/entities/entity_base.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_types.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';

class Equipment extends EntityBase {
  final String uuid;
  final String parentUuid;
  final String name;
  final String? storedIn;
  final List<ImprovementTypes> improvements;
  final SpecialMaterialTypes? specialMaterial;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Equipment({
    required this.uuid,
    required this.parentUuid,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.storedIn,
    required this.improvements,
    this.specialMaterial,
  });

  Equipment cloneWith({
    required String uuid,
    required String parentUuid,
  }) {
    final now = DateTime.now();
    return Equipment(
      uuid: uuid,
      parentUuid: parentUuid,
      name: name,
      storedIn: storedIn,
      improvements: improvements,
      specialMaterial: specialMaterial,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  bool operator ==(other) =>
      other is Equipment &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
