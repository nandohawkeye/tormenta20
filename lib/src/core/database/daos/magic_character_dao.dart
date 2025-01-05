import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/magic_character_table.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_character_adapters.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

part 'magic_character_dao.g.dart';

@DriftAccessor(tables: [MagicCharacterTable])
class MagicCharacterDAO extends DatabaseAccessor<AppDatabase>
    with _$MagicCharacterDAOMixin {
  MagicCharacterDAO(super.db);

  Future<Failure?> insertMagic(MagicCharacter entity) async {
    try {
      await into(magicCharacterTable).insertOnConflictUpdate(
        MagicCharacterAdapters.toCompanion(entity),
      );

      return null;
    } catch (e) {
      print('erro: $e');
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteMagic(MagicCharacter entity) async {
    try {
      await (delete(magicCharacterTable)
            ..where((tbl) => tbl.uuid.equals(entity.uuid)))
          .go();

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<({Failure? failure, List<MagicCharacter> magics})>
      getAllMagics() async {
    final List<MagicCharacter> magics = [];
    try {
      final rows = await (select(magicCharacterTable)).get();

      for (var row in rows) {
        magics.add(MagicCharacterAdapters.fromDriftData(row));
      }

      return (failure: null, magics: magics);
    } catch (e) {
      return (failure: Failure(e.toString()), magics: magics);
    }
  }
}
