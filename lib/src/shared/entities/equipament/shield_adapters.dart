import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_type_adapter.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';

abstract class ShieldAdapters {
  static Shield fromDriftData(ShieldTableData data) {
    final specialMaterial = data.specialMaterialIndex == null
        ? null
        : SpecialMaterialTypes.values[data.specialMaterialIndex!];
    return Shield(
      uuid: data.uuid,
      spaceOcuped: data.ocupedSpace,
      type: ShieldType.values[data.typeIndex],
      parentUuid: data.parentUuid,
      price: data.price,
      name: data.name,
      defenseBonus: data.defenseBonus,
      penalty: data.penalty,
      desc: data.desc,
      improvements: ImprovementTypeAdapter.fromString(data.improvements),
      specialMaterial: specialMaterial,
      storedIn: data.storedIn,
    );
  }

  static ShieldTableCompanion toDriftCompanion(Shield entity) {
    return ShieldTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      price: Value(entity.price),
      desc: Value(entity.desc),
      defenseBonus: Value(entity.defenseBonus),
      ocupedSpace: Value(entity.spaceOcuped),
      penalty: Value(entity.penalty),
      typeIndex: Value(entity.type.index),
      improvements:
          Value(ImprovementTypeAdapter.toStringValue(entity.improvements)),
      specialMaterialIndex: Value(entity.specialMaterial?.index),
      storedIn: Value(entity.storedIn),
    );
  }
}
