// These imports are only needed to open the database
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:tormenta20/src/core/database/daos/config_dao.dart';
import 'package:tormenta20/src/core/database/daos/grimoire_dao.dart';
import 'package:tormenta20/src/core/database/daos/magic_character_dao.dart';
import 'package:tormenta20/src/core/database/daos/menace_dao.dart';
import 'package:tormenta20/src/core/database/tables/action_distance_attack_table.dart';
import 'package:tormenta20/src/core/database/tables/action_hand_to_hand_table.dart';
import 'package:tormenta20/src/core/database/tables/action_table.dart';
import 'package:tormenta20/src/core/database/tables/adventure_backpack_table.dart';
import 'package:tormenta20/src/core/database/tables/ammunition_table.dart';
import 'package:tormenta20/src/core/database/tables/armor_table.dart';
import 'package:tormenta20/src/core/database/tables/backpack_table.dart';
import 'package:tormenta20/src/core/database/tables/board_character_table.dart';
import 'package:tormenta20/src/core/database/tables/board_combat_table.dart';
import 'package:tormenta20/src/core/database/tables/board_note_table.dart';
import 'package:tormenta20/src/core/database/tables/board_player_table.dart';
import 'package:tormenta20/src/core/database/tables/config_table.dart';
import 'package:tormenta20/src/core/database/tables/equipment_table.dart';
import 'package:tormenta20/src/core/database/tables/expertise_table.dart';
import 'package:tormenta20/src/core/database/tables/general_item_table.dart';
import 'package:tormenta20/src/core/database/tables/general_skill_table.dart';
import 'package:tormenta20/src/core/database/tables/grimoire_table.dart';
import 'package:tormenta20/src/core/database/tables/magic_character_table.dart';
import 'package:tormenta20/src/core/database/tables/magic_menace_table.dart';
import 'package:tormenta20/src/core/database/tables/menace_link_board_table.dart';
import 'package:tormenta20/src/core/database/tables/menace_table.dart';
import 'package:tormenta20/src/core/database/tables/saddlebag_table.dart';
import 'package:tormenta20/src/core/database/tables/shield_table.dart';
import 'package:tormenta20/src/core/database/tables/tibars_table.dart';
import 'package:tormenta20/src/core/database/tables/weapon_table.dart';
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
    MenaceTable,
    AdventureBackpackTable,
    EquipmentTable,
    AmmunitionTable,
    ArmorTable,
    BackpackTable,
    GeneralItemTable,
    GeneralSkillTable,
    MagicMenaceTable,
    SaddlebagTable,
    ShieldTable,
    TibarsTable,
    WeaponTable,
    ActionTable,
    ActionHandToHandTable,
    ActionDistanceAttackTable,
    ExpertiseTable,
    MenaceLinkBoardTable,
    ConfigTable,
  ],
  daos: [
    GrimoireDAO,
    BoardDAO,
    MagicCharacterDAO,
    MenaceDAO,
    ConfigDAO,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 12;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        print('Migrating from $from to $to');
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(
          () async {
            if (from < 3) {
              for (var table in allTables) {
                await m.deleteTable(table.actualTableName);
                await m.createTable(table);
              }
            }

            if (from < 4) {
              await m.addColumn(boardCombatTable, boardCombatTable.turn);
            }

            if (from < 5) {
              await m.addColumn(boardPlayerTable, boardPlayerTable.initiative);
            }

            if (from < 6) {
              await m.alterTable(TableMigration(grimoireTable));
            }

            if (from < 7) {
              await m.alterTable(TableMigration(boardSessionTable));
            }

            if (from < 8) {
              await m.addColumn(
                  boardSessionTable, boardSessionTable.environmentIndex);
            }

            if (from < 9) {
              await m.createTable(actionDistanceAttackTable);
              await m.createTable(actionHandToHandTable);
              await m.createTable(actionTable);
              await m.createTable(adventureBackpackTable);
              await m.createTable(ammunitionTable);
              await m.createTable(armorTable);
              await m.createTable(backpackTable);
              await m.createTable(equipmentTable);
              await m.createTable(expertiseTable);
              await m.createTable(generalItemTable);
              await m.createTable(generalSkillTable);
              await m.createTable(magicMenaceTable);
              await m.createTable(menaceLinkBoardTable);
              await m.createTable(menaceTable);
              await m.createTable(saddlebagTable);
              await m.createTable(shieldTable);
              await m.createTable(tibarsTable);
              await m.createTable(weaponTable);
            }

            if (from < 10) {
              await m.addColumn(magicCharacterTable, magicCharacterTable.pm);
              await m.addColumn(magicCharacterTable, magicCharacterTable.cd);
              await m.addColumn(
                  magicCharacterTable, magicCharacterTable.mediumDamageValue);
              await m.addColumn(
                  magicCharacterTable, magicCharacterTable.damageDices);
              await m.addColumn(
                  magicCharacterTable, magicCharacterTable.extraDamageDices);
            }

            if (from < 11) {
              await m.addColumn(menaceTable, menaceTable.createdAt);
              await m.addColumn(menaceTable, menaceTable.updatedAt);
              await m.alterTable(TableMigration(boardNoteTable));
              await m.alterTable(TableMigration(boardCharacterTable));
              await m.alterTable(TableMigration(boardPlayerTable));
              await m.alterTable(TableMigration(boardTable));
              await m.createTable(configTable);
            }

            if (from < 12) {
              await m.addColumn(
                  boardPlayerTable, boardPlayerTable.classeIndexes);
              await m.addColumn(
                  boardCharacterTable, boardCharacterTable.classeIndexes);
            }
          },
        );

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

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    },
  );
}
