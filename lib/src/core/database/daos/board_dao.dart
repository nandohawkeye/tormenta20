import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/board_game_pause_table.dart';
import 'package:tormenta20/src/core/database/tables/board_game_table.dart';
import 'package:tormenta20/src/core/database/tables/board_link_table.dart';
import 'package:tormenta20/src/core/database/tables/board_material_table.dart';
import 'package:tormenta20/src/core/database/tables/board_table.dart';

part 'board_dao.g.dart';

@DriftAccessor(tables: [
  BoardTable,
  BoardMaterialTable,
  BoardGameTable,
  BoardGamePauseTable,
  BoardLinkTable,
])
class BoardDAO extends DatabaseAccessor<AppDatabase> with _$BoardDAOMixin {
  BoardDAO(super.db);
}
