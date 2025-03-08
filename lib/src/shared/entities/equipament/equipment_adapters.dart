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
}
