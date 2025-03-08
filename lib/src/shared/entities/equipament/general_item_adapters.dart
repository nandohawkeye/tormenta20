import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_type_adapter.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';

abstract class GeneralItemAdapters {
  static GeneralItem fromDriftData(GeneralItemTableData data) {
    final specialMaterial = data.specialMaterialIndex == null
        ? null
        : SpecialMaterialTypes.values[data.specialMaterialIndex!];
    return GeneralItem(
      uuid: data.uuid,
      spaceOcuped: data.ocupedSpace,
      type: GeneralItemType.values[data.typeIndex],
      parentUuid: data.parentUuid,
      price: data.price,
      name: data.name,
      desc: data.desc,
      improvements: ImprovementTypeAdapter.fromString(data.improvements),
      specialMaterial: specialMaterial,
      storedIn: data.storedIn,
    );
  }

  static GeneralItemTableCompanion toDriftCompanion(GeneralItem entity) {
    return GeneralItemTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      price: Value(entity.price),
      desc: Value(entity.desc),
      ocupedSpace: Value(entity.spaceOcuped),
      typeIndex: Value(entity.type.index),
      improvements:
          Value(ImprovementTypeAdapter.toStringValue(entity.improvements)),
      specialMaterialIndex: Value(entity.specialMaterial?.index),
      storedIn: Value(entity.storedIn),
    );
  }
}
