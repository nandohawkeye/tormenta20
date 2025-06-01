import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_type_adapter.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';

abstract class AmmunitionAdapters {
  static Ammunition fromDriftData(AmmunitionTableData data) {
    final specialMaterial = data.specialMaterialIndex == null
        ? null
        : SpecialMaterialTypes.values[data.specialMaterialIndex!];
    return Ammunition(
      uuid: data.uuid,
      parentUuid: data.parentUuid,
      price: data.price,
      name: data.name,
      quantity: data.quantity,
      desc: data.desc,
      improvements: ImprovementTypeAdapter.fromString(data.improvements),
      specialMaterial: specialMaterial,
      storedIn: data.storedIn,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data.updatedAt),
    );
  }

  static AmmunitionTableCompanion toDriftCompanion(Ammunition entity) {
    return AmmunitionTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      parentUuid: Value(entity.parentUuid),
      price: Value(entity.price),
      desc: Value(entity.desc),
      improvements:
          Value(ImprovementTypeAdapter.toStringValue(entity.improvements)),
      quantity: Value(entity.quantity),
      specialMaterialIndex: Value(entity.specialMaterial?.index),
      storedIn: Value(entity.storedIn),
      createdAt: Value(entity.createdAt.millisecondsSinceEpoch),
      updatedAt: Value(entity.updatedAt.millisecondsSinceEpoch),
    );
  }

  static Ammunition fromJson(Map<String, dynamic> data) {
    SpecialMaterialTypes? specialMaterial;

    if (data['special_material_index'] != null) {
      specialMaterial =
          SpecialMaterialTypes.values[data['special_material_index']];
    }

    return Ammunition(
      uuid: data['uuid'],
      parentUuid: data['parent_uuid'],
      price: (data['price'] as double?),
      name: data['name'],
      quantity: data['quantity'],
      desc: data['desc'],
      improvements: ImprovementTypeAdapter.fromString(data['improvements']),
      specialMaterial: specialMaterial,
      storedIn: data['stored_in'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updated_at']),
    );
  }

  static Map<String, dynamic> toJson(Ammunition entity) {
    return {
      'uuid': entity.uuid,
      'parent_uuid': entity.parentUuid,
      'price': entity.price,
      'name': entity.name,
      'quantity': entity.quantity,
      'desc': entity.desc,
      'improvements': ImprovementTypeAdapter.toStringValue(entity.improvements),
      'special_material_index': entity.specialMaterial?.index,
      'stored_in': entity.storedIn,
      'created_at': entity.createdAt.millisecondsSinceEpoch,
      'updated_at': entity.updatedAt.millisecondsSinceEpoch,
    };
  }
}
