import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/board_table.dart';
import 'package:tormenta20/src/core/database/tables/character_board_table.dart';
import 'package:tormenta20/src/core/database/tables/character_table.dart';
import 'package:tormenta20/src/core/database/tables/classe_character_table.dart';
import 'package:tormenta20/src/core/database/tables/grimoire_table.dart';
import 'package:tormenta20/src/core/database/tables/origin_table.dart';
import 'package:tormenta20/src/core/database/tables/power_table.dart';

part 'character_dao.g.dart';

@DriftAccessor(tables: [
  GrimoireTable,
  CharacterTable,
  ClasseCharacterTable,
  OriginTable,
  PowerTable,
  CharacterBoardTable,
  BoardTable,
])
class CharacterDAO extends DatabaseAccessor<AppDatabase>
    with _$CharacterDAOMixin {
  CharacterDAO(super.db);
}
