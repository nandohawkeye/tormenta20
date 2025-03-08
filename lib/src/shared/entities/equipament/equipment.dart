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

  Equipment({
    required this.uuid,
    required this.parentUuid,
    required this.name,
    this.storedIn,
    required this.improvements,
    this.specialMaterial,
  });

  @override
  bool operator ==(other) =>
      other is Equipment &&
      other.uuid == uuid &&
      other.parentUuid == parentUuid &&
      other.name == name &&
      other.storedIn == storedIn &&
      other.improvements == improvements &&
      other.specialMaterial == specialMaterial;

  @override
  int get hashCode =>
      uuid.hashCode ^
      parentUuid.hashCode ^
      name.hashCode ^
      storedIn.hashCode ^
      improvements.hashCode ^
      specialMaterial.hashCode;

  @override
  String get exibitionLabel => name;

  @override
  get primaryKey => uuid;
}
