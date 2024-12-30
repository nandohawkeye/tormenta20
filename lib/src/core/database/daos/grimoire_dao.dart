import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/grimoire_table.dart';
import 'package:tormenta20/src/core/database/tables/magic_character_table.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_adapters.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire_drift_dto.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

part 'grimoire_dao.g.dart';

@DriftAccessor(tables: [GrimoireTable, MagicCharacterTable])
class GrimoireDAO extends DatabaseAccessor<AppDatabase>
    with _$GrimoireDAOMixin {
  GrimoireDAO(super.db);

  Future<Failure?> insertGrimoire(Grimoire entity) async {
    try {
      await into(grimoireTable).insertOnConflictUpdate(
        GrimoiteAdapters.toCompanion(entity),
      );

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteGrimoire(Grimoire entity) async {
    try {
      await (delete(grimoireTable)
            ..where((tbl) => tbl.uuid.equals(entity.uuid)))
          .go();

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<({Failure? failure, List<Grimoire> grimoires})>
      getAllGrimoires() async {
    try {
      final rows = await (select(grimoireTable)).join([
        leftOuterJoin(
          magicCharacterTable,
          magicCharacterTable.uuid.equalsExp(
            magicCharacterTable.grimoireUUid,
          ),
        ),
      ]).get();

      Map<String, GrimoireDriftDto> grimoiresDTO = {};

      for (var row in rows) {
        final grimoireData = row.readTable(grimoireTable);
        final magicCharactersData = row.readTableOrNull(magicCharacterTable);

        if (!(grimoiresDTO.containsKey(grimoireData.uuid))) {
          grimoiresDTO.addAll({
            grimoireData.uuid: GrimoireDriftDto(grimoireData: grimoireData)
          });
        }

        if (magicCharactersData != null) {
          grimoiresDTO[grimoireData.uuid]!.magicsData.add(magicCharactersData);
        }
      }

      return (
        failure: null,
        grimoires: grimoiresDTO.values
            .map((g) => GrimoiteAdapters.fromDriftDto(g))
            .toList()
      );
    } catch (e) {
      return (failure: Failure(e.toString()), grimoires: <Grimoire>[]);
    }
  }
}
