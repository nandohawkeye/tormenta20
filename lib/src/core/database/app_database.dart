// These imports are only needed to open the database
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:tormenta20/src/core/database/daos/grimoire_dao.dart';
import 'package:tormenta20/src/core/database/daos/magic_character_dao.dart';
import 'package:tormenta20/src/core/database/tables/board_character_table.dart';
import 'package:tormenta20/src/core/database/tables/board_classe_caracter_table.dart';
import 'package:tormenta20/src/core/database/tables/board_combat_table.dart';
import 'package:tormenta20/src/core/database/tables/board_note_table.dart';
import 'package:tormenta20/src/core/database/tables/board_player_table.dart';
import 'package:tormenta20/src/core/database/tables/grimoire_table.dart';
import 'package:tormenta20/src/core/database/tables/magic_character_table.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/failures/unknown_failure.dart';

import 'package:uuid/uuid.dart';

import 'daos/board_dao.dart';
import 'tables/board_session_table.dart';
import 'tables/board_link_table.dart';
import 'tables/board_material_table.dart';
import 'tables/board_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    GrimoireTable,
    MagicCharacterTable,
    BoardTable,
    BoardMaterialTable,
    BoardSessionTable,
    BoardLinkTable,
    BoardPlayerTable,
    BoardCharacterTable,
    BoardNoteTable,
    BoardCombatTable,
    BoardClasseCharacterTable,
  ],
  daos: [
    GrimoireDAO,
    BoardDAO,
    MagicCharacterDAO,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(() async {
          if (from < 3) {
            for (var table in allTables) {
              await m.deleteTable(table.actualTableName);
              await m.createTable(table);
            }
          }
        });

        // Assert that the schema is valid after migrations
        if (kDebugMode) {
          final wrongForeignKeys =
              await customSelect('PRAGMA foreign_key_check').get();
          assert(
            wrongForeignKeys.isEmpty,
            '${wrongForeignKeys.map((e) => e.data)}',
          );
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<Failure?> deleteEverything() async {
    try {
      await customStatement('PRAGMA foreign_keys = OFF');
      return transaction(() async {
        await Future.wait(allTables.map((table) => table.deleteAll()));
        return null;
      });
    } catch (e) {
      return const UnknownFailure();
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }

  // This static function is here to be available to tables to use as clientDefault
  static String uuid() {
    return const Uuid().v4();
  }
}

Future<File> get getAsyncFile async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, 'db.sqlite'));
  return file;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
