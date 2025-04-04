import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_type_adapter.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';

abstract class EquipmentAdapters {
  static Equipment fromDriftData(EquipmentTableData data) {
    final specialMaterial = data.specialMaterialIndex == null
        ? null
        : SpecialMaterialTypes.values[data.specialMaterialIndex!];
    return Equipment(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      name: data.name,
      improvements: ImprovementTypeAdapter.fromString(data.improvements),
      specialMaterial: specialMaterial,
      storedIn: data.storedIn,
    );
  }

  static EquipmentTableCompanion toDriftCompanion(Equipment entity) {
    return EquipmentTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      improvements:
          Value(ImprovementTypeAdapter.toStringValue(entity.improvements)),
      specialMaterialIndex: Value(entity.specialMaterial?.index),
      storedIn: Value(entity.storedIn),
    );
  }

  static Equipment fromJson(Map<String, dynamic> data) {
    SpecialMaterialTypes? specialMaterial;

    if (data['special_material_index'] != null) {
      specialMaterial =
          SpecialMaterialTypes.values[data['special_material_index']];
    }

    return Equipment(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      name: data['name'],
      improvements: ImprovementTypeAdapter.fromString(data['improvements']),
      specialMaterial: specialMaterial,
      storedIn: data['stored_in'],
    );
  }

  static Map<String, dynamic> toJson(Equipment entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'name': entity.name,
      'improvements': ImprovementTypeAdapter.toStringValue(entity.improvements),
      'special_material_index': entity.specialMaterial?.index,
      'stored_in': entity.storedIn,
    };
  }
}
