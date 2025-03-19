import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/entities/classe_type_character.dart';

abstract class ClasseCharacterTypeAdapters {
  static ClasseTypeCharacter fromDriftData(ClasseCharacterTableData data) {
    return ClasseTypeCharacter(
      uuid: data.uuid,
      level: data.level,
      type: ClasseType.values[data.typeIndex],
      characterUuid: data.characterUuid,
    );
  }

  static ClasseCharacterTableCompanion toDriftCompanion(
      ClasseTypeCharacter entity) {
    return ClasseCharacterTableCompanion(
      uuid: Value(entity.uuid),
      level: Value(entity.level),
      typeIndex: Value(entity.type.index),
      characterUuid: Value(entity.characterUuid),
    );
  }
}
