import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/equipament/tibars.dart';

abstract class TibarsAdapters {
  static Tibars fromDriftData(TibarsTableData data) {
    return Tibars(
      uuid: data.uuid,
      bronze: data.bronze,
      gold: data.gold,
      silver: data.silver,
      parentUuid: data.parentUuid,
      storedIn: data.storedIn,
      hasInitialRoll: data.hasInitialRoll,
    );
  }

  static TibarsTableCompanion toDriftCompanion(Tibars entity) {
    return TibarsTableCompanion(
      uuid: Value(entity.uuid),
      parentUuid: Value(entity.parentUuid),
      storedIn: Value(entity.storedIn),
      bronze: Value(entity.bronze),
      gold: Value(entity.gold),
      silver: Value(entity.silver),
      hasInitialRoll: Value(entity.hasInitialRoll),
    );
  }
}
