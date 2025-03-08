import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';

class MagicMenaceAdapters {
  static MagicMenace fromDriftData(MagicMenaceTableData data) {
    return MagicMenace(
      name: data.name,
      uuid: data.uuid,
      menaceUuid: data.menaceUuid,
      resumedDesc: data.resumedDesc,
      magicBaseId: data.magicBaseId,
      pm: data.pm,
      cd: data.cd,
      damageDices: data.damageDices,
      mediumDamageValue: data.mediumDamageValue,
      extraDamageDices: data.extraDamageDices,
    );
  }

  static MagicMenaceTableCompanion toDriftCompanion(MagicMenace entity) {
    return MagicMenaceTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      resumedDesc: Value(entity.resumedDesc),
      menaceUuid: Value(entity.menaceUuid),
      magicBaseId: Value(entity.magicBaseId),
      pm: Value(entity.pm),
      cd: Value(entity.cd),
      mediumDamageValue: Value(entity.mediumDamageValue),
      damageDices: Value(entity.damageDices),
      extraDamageDices: Value(entity.extraDamageDices),
    );
  }
}
