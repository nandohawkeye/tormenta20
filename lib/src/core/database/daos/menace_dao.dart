import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/action_distance_attack_table.dart';
import 'package:tormenta20/src/core/database/tables/action_hand_to_hand_table.dart';
import 'package:tormenta20/src/core/database/tables/action_table.dart';
import 'package:tormenta20/src/core/database/tables/adventure_backpack_table.dart';
import 'package:tormenta20/src/core/database/tables/ammunition_table.dart';
import 'package:tormenta20/src/core/database/tables/armor_table.dart';
import 'package:tormenta20/src/core/database/tables/backpack_table.dart';
import 'package:tormenta20/src/core/database/tables/board_table.dart';
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
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventure_backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurer_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_adapters.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_adapters.dart';
import 'package:tormenta20/src/shared/entities/general_skill_adapters.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/menace_adapters.dart';
import 'package:tormenta20/src/shared/entities/menace_drift_dto.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board.dart';
import 'package:tormenta20/src/shared/entities/menace_link_board_adapters.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

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
  BoardTable,
])
class MenaceDAO extends DatabaseAccessor<AppDatabase> with _$MenaceDAOMixin {
  MenaceDAO(super.db);

  Future<({Failure? failure, Stream<Menace?>? menace})> watchMenace(
      String uuid) async {
    try {
      return (
        failure: null,
        menace: (select(menaceTable)
              ..where((tbl) => tbl.uuid.equals(uuid))
              ..limit(1))
            .join([
              leftOuterJoin(
                menaceLinkBoardTable,
                menaceTable.uuid.equalsExp(
                  menaceLinkBoardTable.menaceUuid,
                ),
              ),
            ])
            .watch()
            .map((rows) {
              Map<String, MenaceDriftDto> menacesDTO = {};

              for (var row in rows) {
                final menaceData = row.readTable(menaceTable);
                final linkData = row.readTableOrNull(menaceLinkBoardTable);
                final skillData = row.readTableOrNull(generalSkillTable);
                final magicData = row.readTableOrNull(magicMenaceTable);
                final expertiseData = row.readTableOrNull(expertiseTable);

                final actionData = row.readTableOrNull(actionTable);
                final handToHandData =
                    row.readTableOrNull(actionHandToHandTable);
                final actionDistance =
                    row.readTableOrNull(actionDistanceAttackTable);

                final equipmentData = row.readTableOrNull(equipmentTable);
                final adventureBackpackData =
                    row.readTableOrNull(adventureBackpackTable);
                final backpackData = row.readTableOrNull(backpackTable);
                final ammunitionData = row.readTableOrNull(ammunitionTable);
                final armorData = row.readTableOrNull(armorTable);
                final generalItemData = row.readTableOrNull(generalItemTable);
                final saddlebagData = row.readTableOrNull(saddlebagTable);
                final shieldData = row.readTableOrNull(shieldTable);
                final weaponData = row.readTableOrNull(weaponTable);

                if (!(menacesDTO.containsKey(menaceData.uuid))) {
                  menacesDTO
                      .addAll({menaceData.uuid: MenaceDriftDto(menaceData)});
                }

                if (linkData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .boardsLinkeds
                        .any((item) => item.uuid == linkData.uuid))) {
                  menacesDTO[menaceData.uuid]!.boardsLinkeds.add(linkData);
                }

                if (skillData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .generalSkills
                        .any((item) => item.uuid == skillData.uuid))) {
                  menacesDTO[menaceData.uuid]!.generalSkills.add(skillData);
                }

                if (magicData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .magics
                        .any((item) => item.uuid == magicData.uuid))) {
                  menacesDTO[menaceData.uuid]!.magics.add(magicData);
                }

                if (expertiseData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .expertises
                        .any((item) => item.uuid == expertiseData.uuid))) {
                  menacesDTO[menaceData.uuid]!.expertises.add(expertiseData);
                }

                if (actionData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .actions
                        .any((item) => item.uuid == actionData.uuid))) {
                  menacesDTO[menaceData.uuid]!.actions.add(actionData);
                }

                if (handToHandData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .handToHands
                        .any((item) => item.uuid == handToHandData.uuid))) {
                  menacesDTO[menaceData.uuid]!.handToHands.add(handToHandData);
                }

                if (actionDistance != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .attackDistances
                        .any((item) => item.uuid == actionDistance.uuid))) {
                  menacesDTO[menaceData.uuid]!
                      .attackDistances
                      .add(actionDistance);
                }

                if (equipmentData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .equipments
                        .any((item) => item.uuid == equipmentData.uuid))) {
                  menacesDTO[menaceData.uuid]!.equipments.add(equipmentData);
                }

                if (adventureBackpackData != null &&
                    !(menacesDTO[menaceData.uuid]!.equipments.any(
                        (item) => item.uuid == adventureBackpackData.uuid))) {
                  menacesDTO[menaceData.uuid]!
                      .adventureBackpacks
                      .add(adventureBackpackData);
                }

                if (backpackData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .backpacks
                        .any((item) => item.uuid == backpackData.uuid))) {
                  menacesDTO[menaceData.uuid]!.backpacks.add(backpackData);
                }

                if (ammunitionData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .ammunitions
                        .any((item) => item.uuid == ammunitionData.uuid))) {
                  menacesDTO[menaceData.uuid]!.ammunitions.add(ammunitionData);
                }

                if (armorData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .armors
                        .any((item) => item.uuid == armorData.uuid))) {
                  menacesDTO[menaceData.uuid]!.armors.add(armorData);
                }

                if (generalItemData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .generalItens
                        .any((item) => item.uuid == generalItemData.uuid))) {
                  menacesDTO[menaceData.uuid]!
                      .generalItens
                      .add(generalItemData);
                }

                if (saddlebagData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .saddlebags
                        .any((item) => item.uuid == saddlebagData.uuid))) {
                  menacesDTO[menaceData.uuid]!.saddlebags.add(saddlebagData);
                }

                if (shieldData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .shields
                        .any((item) => item.uuid == shieldData.uuid))) {
                  menacesDTO[menaceData.uuid]!.shields.add(shieldData);
                }

                if (weaponData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .weapons
                        .any((item) => item.uuid == weaponData.uuid))) {
                  menacesDTO[menaceData.uuid]!.weapons.add(weaponData);
                }
              }

              final menaces = menacesDTO.entries
                  .map((entry) => MenaceAdapters.fromDriftDto(entry.value))
                  .toList();

              return menaces.isEmpty ? null : menaces.first;
            })
      );
    } catch (e) {
      return (failure: Failure(e.toString()), menace: null);
    }
  }

  Future<({Failure? failure, Stream<List<Menace>>? menaces})>
      watchMenaces() async {
    try {
      return (
        failure: null,
        menaces: (select(menaceTable))
            .join([
              leftOuterJoin(
                menaceLinkBoardTable,
                menaceTable.uuid.equalsExp(
                  menaceLinkBoardTable.menaceUuid,
                ),
              ),
            ])
            .watch()
            .map((rows) {
              Map<String, MenaceDriftDto> menacesDTO = {};

              for (var row in rows) {
                final menaceData = row.readTable(menaceTable);
                final linkData = row.readTableOrNull(menaceLinkBoardTable);

                if (!(menacesDTO.containsKey(menaceData.uuid))) {
                  menacesDTO
                      .addAll({menaceData.uuid: MenaceDriftDto(menaceData)});
                }

                if (linkData != null &&
                    !(menacesDTO[menaceData.uuid]!
                        .boardsLinkeds
                        .any((link) => link.uuid == linkData.uuid))) {
                  menacesDTO[menaceData.uuid]!.boardsLinkeds.add(linkData);
                }
              }

              return menacesDTO.entries
                  .map((entry) => MenaceAdapters.fromDriftDto(entry.value))
                  .toList();
            })
      );
    } catch (e) {
      return (failure: Failure(e.toString()), menaces: null);
    }
  }

  Future<Failure?> addLinkMenaceBoard({required MenaceLinkBoard entity}) async {
    try {
      into(menaceLinkBoardTable).insertOnConflictUpdate(
        MenaceLinkBoardAdapters.toDriftCompanion(entity),
      );

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in add link menace to board: $e $st');
      }

      return Failure(e.toString());
    }
  }

  Future<Failure?> removeLinkMenaceBoard(
      {required MenaceLinkBoard entity}) async {
    try {
      await (delete(menaceLinkBoardTable)
            ..where((tbl) => tbl.uuid.equals(entity.uuid)))
          .go();

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in remove link menace to board: $e $st');
      }

      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteMenace({required Menace entity}) async {
    try {
      if (entity.magics.isNotEmpty) {
        await (delete(magicMenaceTable)
              ..where((tbl) => tbl.menaceUuid.equals(entity.uuid)))
            .go();
      }

      if (entity.expertises.isNotEmpty) {
        await (delete(expertiseTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();
      }

      if (entity.generalSkills.isNotEmpty) {
        await (delete(generalSkillTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();
      }

      if (entity.actions.isNotEmpty) {
        await (delete(actionHandToHandTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();
        await (delete(actionDistanceAttackTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();
        await (delete(actionTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();
      }

      if (entity.equipments.isNotEmpty) {
        await (delete(adventureBackpackTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(ammunitionTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(armorTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(backpackTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(generalItemTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(saddlebagTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(shieldTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(weaponTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();

        await (delete(equipmentTable)
              ..where((tbl) => tbl.parentUuid.equals(entity.uuid)))
            .go();
      }

      await (delete(menaceTable)..where((tbl) => tbl.uuid.equals(entity.uuid)))
          .go();

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in delete menace: $e $st');
      }

      return Failure(e.toString());
    }
  }

  Future<Failure?> saveMenace({
    required Menace entity,
    required List<String> magicsToDelete,
    required List<String> skillsToDelete,
    required List<String> expertisesToDelete,
    required List<ActionEnt> actionsToDelete,
    required List<Equipment> equipmentsToDelete,
  }) async {
    try {
      List<HandToHand> handToHand = [];
      List<DistanceAttack> distanceAttacks = [];
      List<ActionEnt> actions = [];

      if (entity.actions.isNotEmpty) {
        for (var item in entity.actions) {
          if (item is HandToHand) {
            handToHand.add(item);
          } else if (item is DistanceAttack) {
            distanceAttacks.add(item);
          } else {
            actions.add(item);
          }
        }
      }

      List<AdventureBackpack> adventuresBackPack = [];
      List<Ammunition> ammunitions = [];
      List<Armor> armors = [];
      List<Backpack> backpacks = [];
      List<GeneralItem> generalItems = [];
      List<Saddlebag> saddlebags = [];
      List<Shield> shields = [];
      List<Weapon> weapons = [];
      List<Equipment> equipments = [];

      if (entity.equipments.isNotEmpty) {
        for (var item in entity.equipments) {
          if (item is AdventureBackpack) {
            adventuresBackPack.add(item);
          } else if (item is Ammunition) {
            ammunitions.add(item);
          } else if (item is Armor) {
            armors.add(item);
          } else if (item is Backpack) {
            backpacks.add(item);
          } else if (item is GeneralItem) {
            generalItems.add(item);
          } else if (item is Saddlebag) {
            saddlebags.add(item);
          } else if (item is Shield) {
            shields.add(item);
          } else if (item is Weapon) {
            weapons.add(item);
          } else {
            equipments.add(item);
          }
        }
      }

      await batch(
        (batch) {
          batch.insertAllOnConflictUpdate(
            menaceTable,
            [MenaceAdapters.toDriftCompanion(entity)],
          );

          if (entity.magics.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              magicMenaceTable,
              entity.magics.map(MagicMenaceAdapters.toDriftCompanion),
            );
          }

          if (entity.generalSkills.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              generalSkillTable,
              entity.generalSkills.map(GeneralSkillAdapters.toDriftCompanion),
            );
          }

          if (entity.expertises.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              expertiseTable,
              entity.expertises.map(ExpertiseAdapters.toDriftCompanion),
            );
          }

          if (handToHand.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              actionHandToHandTable,
              handToHand.map(HandToHandAdapters.toDriftCompanion),
            );
          }

          if (distanceAttacks.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              actionDistanceAttackTable,
              distanceAttacks.map(DistanceAttackAdapters.toDriftCompanion),
            );
          }

          if (actions.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              actionDistanceAttackTable,
              actions.map(ActionAdapters.toDriftCompanion),
            );
          }

          if (adventuresBackPack.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              adventureBackpackTable,
              adventuresBackPack
                  .map(AdventureBackpackAdapters.toDriftCompanion),
            );
          }

          if (ammunitions.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              ammunitionTable,
              ammunitions.map(AmmunitionAdapters.toDriftCompanion),
            );
          }

          if (armors.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              armorTable,
              armors.map(ArmorAdapters.toDriftCompanion),
            );
          }

          if (backpacks.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              backpackTable,
              backpacks.map(BackpackAdapters.toDriftCompanion),
            );
          }

          if (generalItems.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              generalItemTable,
              generalItems.map(GeneralItemAdapters.toDriftCompanion),
            );
          }

          if (saddlebags.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              saddlebagTable,
              saddlebags.map(SaddlebagAdapters.toDriftCompanion),
            );
          }

          if (saddlebags.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              saddlebagTable,
              saddlebags.map(SaddlebagAdapters.toDriftCompanion),
            );
          }

          if (shields.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              shieldTable,
              shields.map(ShieldAdapters.toDriftCompanion),
            );
          }

          if (weapons.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              weaponTable,
              weapons.map(WeaponAdapters.toDriftCompanion),
            );
          }

          if (equipments.isNotEmpty) {
            batch.insertAllOnConflictUpdate(
              equipmentTable,
              equipments.map(EquipmentAdapters.toDriftCompanion),
            );
          }
        },
      );

      if (magicsToDelete.isNotEmpty) {
        Future.forEach(magicsToDelete, (uuid) async {
          await (delete(magicMenaceTable)
                ..where((tbl) => tbl.uuid.equals(uuid)))
              .go();
        });
      }

      if (expertisesToDelete.isNotEmpty) {
        Future.forEach(expertisesToDelete, (uuid) async {
          await (delete(expertiseTable)..where((tbl) => tbl.uuid.equals(uuid)))
              .go();
        });
      }

      if (skillsToDelete.isNotEmpty) {
        Future.forEach(skillsToDelete, (uuid) async {
          await (delete(generalSkillTable)
                ..where((tbl) => tbl.uuid.equals(uuid)))
              .go();
        });
      }

      if (actionsToDelete.isNotEmpty) {
        Future.forEach(actionsToDelete, (action) async {
          if (action is HandToHand) {
            await (delete(actionHandToHandTable)
                  ..where((tbl) => tbl.uuid.equals(action.uuid)))
                .go();
          } else if (action is DistanceAttack) {
            await (delete(actionDistanceAttackTable)
                  ..where((tbl) => tbl.uuid.equals(action.uuid)))
                .go();
          } else {
            await (delete(actionTable)
                  ..where((tbl) => tbl.uuid.equals(action.uuid)))
                .go();
          }
        });
      }

      if (equipmentsToDelete.isNotEmpty) {
        Future.forEach(equipmentsToDelete, (item) async {
          if (item is AdventureBackpack) {
            await (delete(adventureBackpackTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else if (item is Ammunition) {
            await (delete(ammunitionTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else if (item is Armor) {
            await (delete(armorTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else if (item is Backpack) {
            await (delete(backpackTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else if (item is GeneralItem) {
            await (delete(generalItemTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else if (item is Saddlebag) {
            await (delete(saddlebagTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else if (item is Shield) {
            await (delete(shieldTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else if (item is Weapon) {
            await (delete(weaponTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          } else {
            await (delete(equipmentTable)
                  ..where((tbl) => tbl.uuid.equals(item.uuid)))
                .go();
          }
        });
      }

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in save menace: $e $st');
      }

      return Failure(e.toString());
    }
  }
}
