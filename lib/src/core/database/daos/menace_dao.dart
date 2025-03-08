import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/action_distance_attack_table.dart';
import 'package:tormenta20/src/core/database/tables/action_hand_to_hand_table.dart';
import 'package:tormenta20/src/core/database/tables/action_table.dart';
import 'package:tormenta20/src/core/database/tables/adventure_backpack_table.dart';
import 'package:tormenta20/src/core/database/tables/ammunition_table.dart';
import 'package:tormenta20/src/core/database/tables/armor_table.dart';
import 'package:tormenta20/src/core/database/tables/backpack_table.dart';
import 'package:tormenta20/src/core/database/tables/equipment_table.dart';
import 'package:tormenta20/src/core/database/tables/expertise_table.dart';
import 'package:tormenta20/src/core/database/tables/general_item_table.dart';
import 'package:tormenta20/src/core/database/tables/general_skill_table.dart';
import 'package:tormenta20/src/core/database/tables/magic_menace_table.dart';
import 'package:tormenta20/src/core/database/tables/menace_link_board_table.dart';
import 'package:tormenta20/src/core/database/tables/menace_table.dart';
import 'package:tormenta20/src/core/database/tables/saddlebag_table.dart';
import 'package:tormenta20/src/core/database/tables/shield_table.dart';
import 'package:tormenta20/src/core/database/tables/weapon_table.dart';

part 'menace_dao.g.dart';

@DriftAccessor(tables: [
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
  WeaponTable,
  ActionTable,
  ActionHandToHandTable,
  ActionDistanceAttackTable,
  ExpertiseTable,
  MenaceLinkBoardTable,
])
class MenaceDAO extends DatabaseAccessor<AppDatabase> with _$MenaceDAOMixin {
  MenaceDAO(super.db);
}
