// These imports are only needed to open the database
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:tormenta20/src/core/database/daos/grimoire_dao.dart';
import 'package:tormenta20/src/core/database/daos/magic_character_dao.dart';
import 'package:tormenta20/src/core/database/tables/grimoire_table.dart';
import 'package:tormenta20/src/core/database/tables/magic_character_table.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/failures/unknown_failure.dart';

import 'package:uuid/uuid.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    GrimoireTable,
    MagicCharacterTable,
  ],
  daos: [
    GrimoireDAO,
    MagicCharacterDAO,
  ],
)
class AppDatabase extends _$AppDatabase {
  // AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(() async {
          if (from < 2) {
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
    return NativeDatabase.createInBackground(file);
  });
}
