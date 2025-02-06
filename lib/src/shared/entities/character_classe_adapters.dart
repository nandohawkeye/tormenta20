import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/character_classe.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';

abstract class CharacterClasseAdapters {
  static BoardClasseCharacterTableCompanion toCompanion(
      CharacterClasse classe) {
    return BoardClasseCharacterTableCompanion(
      uuid: Value<String>(classe.uuid),
      playerUuid: Value<String>(classe.playerUuid),
      typeIndex: Value<int>(classe.type.index),
    );
  }

  static CharacterClasse fromDriftData(BoardClasseCharacterTableData data) {
    return CharacterClasse(
      uuid: data.uuid,
      playerUuid: data.playerUuid,
      type: ClasseType.values[data.typeIndex],
    );
  }
}
