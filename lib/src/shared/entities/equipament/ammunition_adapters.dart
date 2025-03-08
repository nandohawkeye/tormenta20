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
    );
  }
}
