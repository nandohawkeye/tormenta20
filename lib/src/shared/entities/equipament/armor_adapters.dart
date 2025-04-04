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

  static Armor fromJson(Map<String, dynamic> data) {
    SpecialMaterialTypes? specialMaterial;

    if (data['special_material_index'] != null) {
      specialMaterial =
          SpecialMaterialTypes.values[data['special_material_index']];
    }

    return Armor(
      uuid: data['uuid'],
      defenseBonus: data['defense_bonus'],
      penalty: data['penalty'],
      spaceOcuped: data['ocuped_space'],
      type: ArmorType.values[data['type_index']],
      parentUuid: data['parent_uuid'],
      price: (data['price'] as double?),
      name: data['name'],
      desc: data['desc'],
      improvements: ImprovementTypeAdapter.fromString(data['improvements']),
      specialMaterial: specialMaterial,
      storedIn: data['stored_in'],
    );
  }

  static Map<String, dynamic> toJson(Armor entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'price': entity.price,
      'name': entity.name,
      'desc': entity.desc,
      'defense_bonus': entity.defenseBonus,
      'ocuped_space': entity.spaceOcuped,
      'penalty': entity.penalty,
      'type_index': entity.type.index,
      'improvements': ImprovementTypeAdapter.toStringValue(entity.improvements),
      'special_material_index': entity.specialMaterial?.index,
      'stored_in': entity.storedIn,
    };
  }
}
