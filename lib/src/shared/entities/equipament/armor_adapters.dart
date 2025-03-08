import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_type_adapter.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';

abstract class ArmorAdapters {
  static Armor fromDriftData(ArmorTableData data) {
    final specialMaterial = data.specialMaterialIndex == null
        ? null
        : SpecialMaterialTypes.values[data.specialMaterialIndex!];
    return Armor(
      uuid: data.uuid,
      defenseBonus: data.defenseBonus,
      penalty: data.penalty,
      spaceOcuped: data.ocupedSpace,
      type: ArmorType.values[data.typeIndex],
      parentUuid: data.parentUuid,
      price: data.price,
      name: data.name,
      desc: data.desc,
      improvements: ImprovementTypeAdapter.fromString(data.improvements),
      specialMaterial: specialMaterial,
      storedIn: data.storedIn,
    );
  }

  static ArmorTableCompanion toDriftCompanion(Armor entity) {
    return ArmorTableCompanion(
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
