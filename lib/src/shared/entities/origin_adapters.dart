import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';

abstract class OriginAdapters {
  static Origin fromDriftData(OriginTableData data) {
    return Origin(
      uuid: data.uuid,
      name: data.name,
      desc: data.desc,
      characterUuid: data.characterUuid,
    );
  }

  static OriginTableCompanion toDriftCompanion(Origin entity) {
    return OriginTableCompanion(
      uuid: Value(entity.uuid),
      name: Value(entity.name),
      desc: Value(entity.desc),
      characterUuid: Value(entity.characterUuid),
    );
  }
}
