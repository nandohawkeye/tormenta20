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

  static ClasseTypeCharacter fromJson(Map<String, dynamic> data) {
    return ClasseTypeCharacter(
      uuid: data['uuid'],
      level: data['level'],
      type: ClasseType.values[data['type_index']],
      characterUuid: data['character_uuid'],
    );
  }

  static Map<String, dynamic> toJson(ClasseTypeCharacter entity) {
    return {
      'uuid': entity.uuid,
      'level': entity.level,
      'type_index': entity.type.index,
      'character_uuid': entity.characterUuid,
    };
  }
}
