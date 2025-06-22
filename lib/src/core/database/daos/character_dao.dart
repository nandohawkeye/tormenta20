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
import 'package:tormenta20/src/core/database/tables/character_board_table.dart';
import 'package:tormenta20/src/core/database/tables/character_condition_table.dart';
import 'package:tormenta20/src/core/database/tables/character_table.dart';
import 'package:tormenta20/src/core/database/tables/classe_character_table.dart';
import 'package:tormenta20/src/core/database/tables/equipment_table.dart';
import 'package:tormenta20/src/core/database/tables/expertise_table.dart';
import 'package:tormenta20/src/core/database/tables/general_item_table.dart';
import 'package:tormenta20/src/core/database/tables/general_skill_table.dart';
import 'package:tormenta20/src/core/database/tables/global_modifier_table.dart';
import 'package:tormenta20/src/core/database/tables/grimoire_table.dart';
import 'package:tormenta20/src/core/database/tables/magic_menace_table.dart';
import 'package:tormenta20/src/core/database/tables/origin_table.dart';
import 'package:tormenta20/src/core/database/tables/power_table.dart';
import 'package:tormenta20/src/core/database/tables/saddlebag_table.dart';
import 'package:tormenta20/src/core/database/tables/shield_table.dart';
import 'package:tormenta20/src/core/database/tables/tibars_table.dart';
import 'package:tormenta20/src/core/database/tables/weapon_table.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/action_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack_adapters.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand_adapters.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/character_adapters.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/character_board_adapters.dart';
import 'package:tormenta20/src/shared/entities/character_board_dto.dart';
import 'package:tormenta20/src/shared/entities/character_dto.dart';
import 'package:tormenta20/src/shared/entities/classe_character_type_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventure_backpack_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurere_backpack.dart';
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
import 'package:tormenta20/src/shared/entities/equipament/tibars.dart';
import 'package:tormenta20/src/shared/entities/equipament/tibars_adapters.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_adapters.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise_adapters.dart';
import 'package:tormenta20/src/shared/entities/global_modifiers_adapters.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/origin_adapters.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/entities/power_adapaters.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

part 'character_dao.g.dart';

@DriftAccessor(
  tables: [
    GrimoireTable,
    CharacterTable,
    ClasseCharacterTable,
    OriginTable,
    PowerTable,
    CharacterBoardTable,
    BoardTable,
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
    TibarsTable,
    ExpertiseTable,
    ActionHandToHandTable,
    ActionDistanceAttackTable,
    CharacterConditionTable,
    GlobalModifierTable,
  ],
)
class CharacterDAO extends DatabaseAccessor<AppDatabase>
    with _$CharacterDAOMixin {
  CharacterDAO(super.db);

  Future<({Failure? failure, Stream<List<Character>>? characters})>
  watchCharacters() async {
    try {
      return (
        failure: null,
        characters:
            (select(characterTable)
                  ..addColumns([
                    characterTable.name,
                    characterTable.uuid,
                    characterTable.defense,
                    characterTable.life,
                    characterTable.mana,
                    characterTable.createdAt,
                    characterTable.updatedAt,
                    characterTable.creatureSizeIndex,
                    characterTable.imageAsset,
                    characterTable.imagePath,
                    characterTable.aligmentIndex,
                  ])
                  ..orderBy([
                    (t) => OrderingTerm(
                      expression: characterTable.updatedAt,
                      mode: OrderingMode.desc,
                    ),
                  ]))
                .join([
                  leftOuterJoin(
                    classeCharacterTable,
                    characterTable.uuid.equalsExp(
                      classeCharacterTable.characterUuid,
                    ),
                  ),
                  leftOuterJoin(
                    characterBoardTable,
                    characterTable.uuid.equalsExp(
                      characterBoardTable.parentuuid,
                    ),
                  ),
                ])
                .watch()
                .map((rows) {
                  Map<String, CharacterDto> characterDTO = {};

                  for (var row in rows) {
                    final characterData = row.readTable(characterTable);
                    final classeData = row.readTable(classeCharacterTable);
                    final characterBoardData = row.readTableOrNull(
                      characterBoardTable,
                    );

                    if (!(characterDTO.containsKey(characterData.uuid))) {
                      characterDTO.addAll({
                        characterData.uuid: CharacterDto(characterData),
                      });
                    }

                    characterDTO[characterData.uuid]!.classe = classeData;

                    if (characterBoardData != null &&
                        !(characterDTO[characterData.uuid]!.characterBoardsData
                            .any(
                              (characterBoard) =>
                                  characterBoard.uuid ==
                                  characterBoardData.uuid,
                            ))) {
                      characterDTO[characterData.uuid]!.characterBoardsData.add(
                        characterBoardData,
                      );
                    }
                  }

                  return characterDTO.entries
                      .map(
                        (entry) => CharacterAdapters.fromDriftDto(entry.value),
                      )
                      .toList();
                }),
      );
    } catch (e) {
      return (failure: Failure(e.toString()), characters: null);
    }
  }

  Future<({Failure? failure, Character? character})> getCharacter(
    String uuid,
  ) async {
    try {
      return (
        failure: null,
        character:
            await (select(characterTable)
                  ..where((tbl) => tbl.uuid.equals(uuid)))
                .join([
                  leftOuterJoin(
                    classeCharacterTable,
                    characterTable.uuid.equalsExp(
                      classeCharacterTable.characterUuid,
                    ),
                  ),
                  leftOuterJoin(
                    characterBoardTable,
                    characterTable.uuid.equalsExp(
                      characterBoardTable.parentuuid,
                    ),
                  ),
                  leftOuterJoin(
                    grimoireTable,
                    characterTable.grimoireUuid.equalsExp(grimoireTable.uuid),
                  ),
                  leftOuterJoin(
                    actionTable,
                    characterTable.uuid.equalsExp(actionTable.parentUuid),
                  ),
                  leftOuterJoin(
                    actionHandToHandTable,
                    characterTable.uuid.equalsExp(
                      actionHandToHandTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    actionDistanceAttackTable,
                    characterTable.uuid.equalsExp(
                      actionDistanceAttackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    equipmentTable,
                    characterTable.uuid.equalsExp(equipmentTable.parentUuid),
                  ),
                  leftOuterJoin(
                    adventureBackpackTable,
                    characterTable.uuid.equalsExp(
                      adventureBackpackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    backpackTable,
                    characterTable.uuid.equalsExp(backpackTable.parentUuid),
                  ),
                  leftOuterJoin(
                    ammunitionTable,
                    characterTable.uuid.equalsExp(ammunitionTable.parentUuid),
                  ),
                  leftOuterJoin(
                    armorTable,
                    characterTable.uuid.equalsExp(armorTable.parentUuid),
                  ),
                  leftOuterJoin(
                    generalItemTable,
                    characterTable.uuid.equalsExp(generalItemTable.parentUuid),
                  ),
                  leftOuterJoin(
                    saddlebagTable,
                    characterTable.uuid.equalsExp(saddlebagTable.parentUuid),
                  ),
                  leftOuterJoin(
                    shieldTable,
                    characterTable.uuid.equalsExp(shieldTable.parentUuid),
                  ),
                  leftOuterJoin(
                    weaponTable,
                    characterTable.uuid.equalsExp(weaponTable.parentUuid),
                  ),
                  leftOuterJoin(
                    originTable,
                    characterTable.uuid.equalsExp(originTable.characterUuid),
                  ),
                  leftOuterJoin(
                    powerTable,
                    characterTable.uuid.equalsExp(powerTable.characterUuid),
                  ),
                ])
                .get()
                .then((rows) {
                  Map<String, CharacterDto> characterDTO = {};

                  for (var row in rows) {
                    final characterData = row.readTable(characterTable);
                    final classeData = row.readTable(classeCharacterTable);
                    final characterBoardData = row.readTableOrNull(
                      characterBoardTable,
                    );
                    final grimoireData = row.readTableOrNull(grimoireTable);
                    final actionData = row.readTableOrNull(actionTable);
                    final handToHandData = row.readTableOrNull(
                      actionHandToHandTable,
                    );
                    final actionDistance = row.readTableOrNull(
                      actionDistanceAttackTable,
                    );
                    final equipmentData = row.readTableOrNull(equipmentTable);
                    final adventureBackpackData = row.readTableOrNull(
                      adventureBackpackTable,
                    );
                    final backpackData = row.readTableOrNull(backpackTable);
                    final ammunitionData = row.readTableOrNull(ammunitionTable);
                    final armorData = row.readTableOrNull(armorTable);
                    final generalItemData = row.readTableOrNull(
                      generalItemTable,
                    );
                    final saddlebagData = row.readTableOrNull(saddlebagTable);
                    final shieldData = row.readTableOrNull(shieldTable);
                    final weaponData = row.readTableOrNull(weaponTable);
                    final originData = row.readTableOrNull(originTable);
                    final powerData = row.readTableOrNull(powerTable);

                    if (!(characterDTO.containsKey(characterData.uuid))) {
                      characterDTO.addAll({
                        characterData.uuid: CharacterDto(characterData),
                      });
                    }

                    characterDTO[characterData.uuid]!.classe = classeData;

                    if (characterBoardData != null &&
                        !(characterDTO[characterData.uuid]!.characterBoardsData
                            .any(
                              (characterBoard) =>
                                  characterBoard.uuid ==
                                  characterBoardData.uuid,
                            ))) {
                      characterDTO[characterData.uuid]!.characterBoardsData.add(
                        characterBoardData,
                      );
                    }

                    if (actionData != null &&
                        !(characterDTO[characterData.uuid]!.actions.any(
                          (item) => item.uuid == actionData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.actions.add(actionData);
                    }

                    if (handToHandData != null &&
                        !(characterDTO[characterData.uuid]!.handToHands.any(
                          (item) => item.uuid == handToHandData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.handToHands.add(
                        handToHandData,
                      );
                    }

                    if (actionDistance != null &&
                        !(characterDTO[characterData.uuid]!.distanceAttacks.any(
                          (item) => item.uuid == actionDistance.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.distanceAttacks.add(
                        actionDistance,
                      );
                    }

                    if (equipmentData != null &&
                        !(characterDTO[characterData.uuid]!.equipments.any(
                          (item) => item.uuid == equipmentData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.equipments.add(
                        equipmentData,
                      );
                    }

                    if (adventureBackpackData != null &&
                        !(characterDTO[characterData.uuid]!.equipments.any(
                          (item) => item.uuid == adventureBackpackData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.adventureBackpacks.add(
                        adventureBackpackData,
                      );
                    }

                    if (backpackData != null &&
                        !(characterDTO[characterData.uuid]!.backpacks.any(
                          (item) => item.uuid == backpackData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.backpacks.add(
                        backpackData,
                      );
                    }

                    if (ammunitionData != null &&
                        !(characterDTO[characterData.uuid]!.ammunitions.any(
                          (item) => item.uuid == ammunitionData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.ammunitions.add(
                        ammunitionData,
                      );
                    }

                    if (armorData != null &&
                        !(characterDTO[characterData.uuid]!.armors.any(
                          (item) => item.uuid == armorData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.armors.add(armorData);
                    }

                    if (generalItemData != null &&
                        !(characterDTO[characterData.uuid]!.generalItens.any(
                          (item) => item.uuid == generalItemData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.generalItens.add(
                        generalItemData,
                      );
                    }

                    if (saddlebagData != null &&
                        !(characterDTO[characterData.uuid]!.saddlebags.any(
                          (item) => item.uuid == saddlebagData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.saddlebags.add(
                        saddlebagData,
                      );
                    }

                    if (shieldData != null &&
                        !(characterDTO[characterData.uuid]!.shields.any(
                          (item) => item.uuid == shieldData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.shields.add(shieldData);
                    }

                    if (weaponData != null &&
                        !(characterDTO[characterData.uuid]!.weapons.any(
                          (item) => item.uuid == weaponData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.weapons.add(weaponData);
                    }

                    if (originData != null &&
                        !(characterDTO[characterData.uuid]!.origins.any(
                          (item) => item.uuid == originData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.origins.add(originData);
                    }

                    if (powerData != null &&
                        !(characterDTO[characterData.uuid]!.powers.any(
                          (item) => item.uuid == powerData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.powers.add(powerData);
                    }

                    if (grimoireData != null) {
                      characterDTO[characterData.uuid]!.grimoireData =
                          grimoireData;
                    }
                  }

                  final characters = characterDTO.entries
                      .map(
                        (entry) => CharacterAdapters.fromDriftDto(entry.value),
                      )
                      .toList();

                  return characters.isEmpty ? null : characters.first;
                }),
      );
    } catch (e) {
      return (failure: Failure(e.toString()), character: null);
    }
  }

  Future<({Failure? failure, Stream<Character?>? character})> watchCharacter(
    String uuid,
  ) async {
    try {
      return (
        failure: null,
        character:
            (select(characterTable)..where((tbl) => tbl.uuid.equals(uuid)))
                .join([
                  leftOuterJoin(
                    classeCharacterTable,
                    characterTable.uuid.equalsExp(
                      classeCharacterTable.characterUuid,
                    ),
                  ),
                  leftOuterJoin(
                    characterBoardTable,
                    characterTable.uuid.equalsExp(
                      characterBoardTable.parentuuid,
                    ),
                  ),
                  leftOuterJoin(
                    grimoireTable,
                    characterTable.grimoireUuid.equalsExp(grimoireTable.uuid),
                  ),
                  leftOuterJoin(
                    actionTable,
                    characterTable.uuid.equalsExp(actionTable.parentUuid),
                  ),
                  leftOuterJoin(
                    actionHandToHandTable,
                    characterTable.uuid.equalsExp(
                      actionHandToHandTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    actionDistanceAttackTable,
                    characterTable.uuid.equalsExp(
                      actionDistanceAttackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    equipmentTable,
                    characterTable.uuid.equalsExp(equipmentTable.parentUuid),
                  ),
                  leftOuterJoin(
                    adventureBackpackTable,
                    characterTable.uuid.equalsExp(
                      adventureBackpackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    backpackTable,
                    characterTable.uuid.equalsExp(backpackTable.parentUuid),
                  ),
                  leftOuterJoin(
                    ammunitionTable,
                    characterTable.uuid.equalsExp(ammunitionTable.parentUuid),
                  ),
                  leftOuterJoin(
                    armorTable,
                    characterTable.uuid.equalsExp(armorTable.parentUuid),
                  ),
                  leftOuterJoin(
                    generalItemTable,
                    characterTable.uuid.equalsExp(generalItemTable.parentUuid),
                  ),
                  leftOuterJoin(
                    saddlebagTable,
                    characterTable.uuid.equalsExp(saddlebagTable.parentUuid),
                  ),
                  leftOuterJoin(
                    shieldTable,
                    characterTable.uuid.equalsExp(shieldTable.parentUuid),
                  ),
                  leftOuterJoin(
                    weaponTable,
                    characterTable.uuid.equalsExp(weaponTable.parentUuid),
                  ),
                  leftOuterJoin(
                    originTable,
                    characterTable.uuid.equalsExp(originTable.characterUuid),
                  ),
                  leftOuterJoin(
                    powerTable,
                    characterTable.uuid.equalsExp(powerTable.characterUuid),
                  ),
                ])
                .watch()
                .map((rows) {
                  Map<String, CharacterDto> characterDTO = {};

                  for (var row in rows) {
                    final characterData = row.readTable(characterTable);
                    final classeData = row.readTable(classeCharacterTable);
                    final characterBoardData = row.readTableOrNull(
                      characterBoardTable,
                    );
                    final grimoireData = row.readTableOrNull(grimoireTable);
                    final actionData = row.readTableOrNull(actionTable);
                    final handToHandData = row.readTableOrNull(
                      actionHandToHandTable,
                    );
                    final actionDistance = row.readTableOrNull(
                      actionDistanceAttackTable,
                    );
                    final equipmentData = row.readTableOrNull(equipmentTable);
                    final adventureBackpackData = row.readTableOrNull(
                      adventureBackpackTable,
                    );
                    final backpackData = row.readTableOrNull(backpackTable);
                    final ammunitionData = row.readTableOrNull(ammunitionTable);
                    final armorData = row.readTableOrNull(armorTable);
                    final generalItemData = row.readTableOrNull(
                      generalItemTable,
                    );
                    final saddlebagData = row.readTableOrNull(saddlebagTable);
                    final shieldData = row.readTableOrNull(shieldTable);
                    final weaponData = row.readTableOrNull(weaponTable);
                    final originData = row.readTableOrNull(originTable);
                    final powerData = row.readTableOrNull(powerTable);

                    if (!(characterDTO.containsKey(characterData.uuid))) {
                      characterDTO.addAll({
                        characterData.uuid: CharacterDto(characterData),
                      });
                    }

                    characterDTO[characterData.uuid]!.classe = classeData;

                    if (characterBoardData != null &&
                        !(characterDTO[characterData.uuid]!.characterBoardsData
                            .any(
                              (characterBoard) =>
                                  characterBoard.uuid ==
                                  characterBoardData.uuid,
                            ))) {
                      characterDTO[characterData.uuid]!.characterBoardsData.add(
                        characterBoardData,
                      );
                    }

                    if (actionData != null &&
                        !(characterDTO[characterData.uuid]!.actions.any(
                          (item) => item.uuid == actionData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.actions.add(actionData);
                    }

                    if (handToHandData != null &&
                        !(characterDTO[characterData.uuid]!.handToHands.any(
                          (item) => item.uuid == handToHandData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.handToHands.add(
                        handToHandData,
                      );
                    }

                    if (actionDistance != null &&
                        !(characterDTO[characterData.uuid]!.distanceAttacks.any(
                          (item) => item.uuid == actionDistance.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.distanceAttacks.add(
                        actionDistance,
                      );
                    }

                    if (equipmentData != null &&
                        !(characterDTO[characterData.uuid]!.equipments.any(
                          (item) => item.uuid == equipmentData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.equipments.add(
                        equipmentData,
                      );
                    }

                    if (adventureBackpackData != null &&
                        !(characterDTO[characterData.uuid]!.equipments.any(
                          (item) => item.uuid == adventureBackpackData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.adventureBackpacks.add(
                        adventureBackpackData,
                      );
                    }

                    if (backpackData != null &&
                        !(characterDTO[characterData.uuid]!.backpacks.any(
                          (item) => item.uuid == backpackData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.backpacks.add(
                        backpackData,
                      );
                    }

                    if (ammunitionData != null &&
                        !(characterDTO[characterData.uuid]!.ammunitions.any(
                          (item) => item.uuid == ammunitionData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.ammunitions.add(
                        ammunitionData,
                      );
                    }

                    if (armorData != null &&
                        !(characterDTO[characterData.uuid]!.armors.any(
                          (item) => item.uuid == armorData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.armors.add(armorData);
                    }

                    if (generalItemData != null &&
                        !(characterDTO[characterData.uuid]!.generalItens.any(
                          (item) => item.uuid == generalItemData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.generalItens.add(
                        generalItemData,
                      );
                    }

                    if (saddlebagData != null &&
                        !(characterDTO[characterData.uuid]!.saddlebags.any(
                          (item) => item.uuid == saddlebagData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.saddlebags.add(
                        saddlebagData,
                      );
                    }

                    if (shieldData != null &&
                        !(characterDTO[characterData.uuid]!.shields.any(
                          (item) => item.uuid == shieldData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.shields.add(shieldData);
                    }

                    if (weaponData != null &&
                        !(characterDTO[characterData.uuid]!.weapons.any(
                          (item) => item.uuid == weaponData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.weapons.add(weaponData);
                    }

                    if (originData != null &&
                        !(characterDTO[characterData.uuid]!.origins.any(
                          (item) => item.uuid == originData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.origins.add(originData);
                    }

                    if (powerData != null &&
                        !(characterDTO[characterData.uuid]!.powers.any(
                          (item) => item.uuid == powerData.uuid,
                        ))) {
                      characterDTO[characterData.uuid]!.powers.add(powerData);
                    }

                    if (grimoireData != null) {
                      characterDTO[characterData.uuid]!.grimoireData =
                          grimoireData;
                    }
                  }

                  final characters = characterDTO.entries
                      .map(
                        (entry) => CharacterAdapters.fromDriftDto(entry.value),
                      )
                      .toList();

                  return characters.isEmpty ? null : characters.first;
                }),
      );
    } catch (e) {
      return (failure: Failure(e.toString()), character: null);
    }
  }

  Future<({Failure? failure, Stream<List<CharacterBoard>>? character})>
  watchCharactersBoardFromBoard(String boardUuid) async {
    try {
      return (
        failure: null,
        character:
            (select(characterBoardTable)
                  ..where((tbl) => tbl.boarduuid.equals(boardUuid)))
                .join([
                  leftOuterJoin(
                    classeCharacterTable,
                    characterBoardTable.uuid.equalsExp(
                      classeCharacterTable.characterUuid,
                    ),
                  ),
                  leftOuterJoin(
                    expertiseTable,
                    characterBoardTable.uuid.equalsExp(
                      expertiseTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    characterTable,
                    characterTable.uuid.equalsExp(
                      characterBoardTable.parentuuid,
                    ),
                  ),
                  leftOuterJoin(
                    characterConditionTable,
                    characterTable.uuid.equalsExp(
                      characterConditionTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    grimoireTable,
                    characterTable.grimoireUuid.equalsExp(grimoireTable.uuid),
                  ),
                  leftOuterJoin(
                    actionTable,
                    characterBoardTable.uuid.equalsExp(actionTable.parentUuid),
                  ),
                  leftOuterJoin(
                    actionHandToHandTable,
                    characterBoardTable.uuid.equalsExp(
                      actionHandToHandTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    actionDistanceAttackTable,
                    characterBoardTable.uuid.equalsExp(
                      actionDistanceAttackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    tibarsTable,
                    characterBoardTable.uuid.equalsExp(tibarsTable.parentUuid),
                  ),
                  leftOuterJoin(
                    globalModifierTable,
                    characterBoardTable.uuid.equalsExp(
                      globalModifierTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    equipmentTable,
                    characterBoardTable.uuid.equalsExp(
                      equipmentTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    adventureBackpackTable,
                    characterBoardTable.uuid.equalsExp(
                      adventureBackpackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    backpackTable,
                    characterBoardTable.uuid.equalsExp(
                      backpackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    ammunitionTable,
                    characterBoardTable.uuid.equalsExp(
                      ammunitionTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    armorTable,
                    characterBoardTable.uuid.equalsExp(armorTable.parentUuid),
                  ),
                  leftOuterJoin(
                    generalItemTable,
                    characterBoardTable.uuid.equalsExp(
                      generalItemTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    saddlebagTable,
                    characterBoardTable.uuid.equalsExp(
                      saddlebagTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    shieldTable,
                    characterBoardTable.uuid.equalsExp(shieldTable.parentUuid),
                  ),
                  leftOuterJoin(
                    weaponTable,
                    characterBoardTable.uuid.equalsExp(weaponTable.parentUuid),
                  ),
                  leftOuterJoin(
                    originTable,
                    characterBoardTable.uuid.equalsExp(
                      originTable.characterUuid,
                    ),
                  ),
                  leftOuterJoin(
                    powerTable,
                    characterBoardTable.uuid.equalsExp(
                      powerTable.characterUuid,
                    ),
                  ),
                ])
                .watch()
                .map((rows) {
                  Map<String, CharacterBoardDto> characterBoardDTO = {};

                  for (var row in rows) {
                    final classeData = row.readTableOrNull(
                      classeCharacterTable,
                    );
                    final expertiseData = row.readTableOrNull(expertiseTable);
                    final characterBoardData = row.readTable(
                      characterBoardTable,
                    );
                    final grimoireData = row.readTableOrNull(grimoireTable);
                    final actionData = row.readTableOrNull(actionTable);
                    final conditionData = row.readTableOrNull(
                      characterConditionTable,
                    );
                    final handToHandData = row.readTableOrNull(
                      actionHandToHandTable,
                    );
                    final actionDistance = row.readTableOrNull(
                      actionDistanceAttackTable,
                    );
                    final equipmentData = row.readTableOrNull(equipmentTable);
                    final tibarsData = row.readTableOrNull(tibarsTable);
                    final globlaModifierData = row.readTableOrNull(
                      globalModifierTable,
                    );
                    final adventureBackpackData = row.readTableOrNull(
                      adventureBackpackTable,
                    );
                    final backpackData = row.readTableOrNull(backpackTable);
                    final ammunitionData = row.readTableOrNull(ammunitionTable);
                    final armorData = row.readTableOrNull(armorTable);
                    final generalItemData = row.readTableOrNull(
                      generalItemTable,
                    );
                    final saddlebagData = row.readTableOrNull(saddlebagTable);
                    final shieldData = row.readTableOrNull(shieldTable);
                    final weaponData = row.readTableOrNull(weaponTable);
                    final originData = row.readTableOrNull(originTable);
                    final powerData = row.readTableOrNull(powerTable);

                    if (!(characterBoardDTO.containsKey(
                      characterBoardData.uuid,
                    ))) {
                      characterBoardDTO.addAll({
                        characterBoardData.uuid: CharacterBoardDto(
                          characterBoardsData: characterBoardData,
                          tibars: tibarsData,
                          globalModifiers: globlaModifierData,
                        ),
                      });
                    }

                    if (expertiseData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.expertises
                            .any(
                              (expertise) =>
                                  expertise.uuid == expertiseData.uuid,
                            ))) {
                      characterBoardDTO[characterBoardData.uuid]!.expertises
                          .add(expertiseData);
                    }

                    if (classeData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.classes
                            .any((classe) => classe.uuid == classeData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.classes.add(
                        classeData,
                      );
                    }

                    if (actionData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.actions
                            .any((item) => item.uuid == actionData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.actions.add(
                        actionData,
                      );
                    }

                    if (handToHandData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .handToHands
                            .any((item) => item.uuid == handToHandData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.handToHands
                          .add(handToHandData);
                    }

                    if (actionDistance != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .distanceAttacks
                            .any((item) => item.uuid == actionDistance.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!
                          .distanceAttacks
                          .add(actionDistance);
                    }

                    if (equipmentData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.equipments
                            .any((item) => item.uuid == equipmentData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.equipments
                          .add(equipmentData);
                    }

                    if (adventureBackpackData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.equipments
                            .any(
                              (item) => item.uuid == adventureBackpackData.uuid,
                            ))) {
                      characterBoardDTO[characterBoardData.uuid]!
                          .adventureBackpacks
                          .add(adventureBackpackData);
                    }

                    if (backpackData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.backpacks
                            .any((item) => item.uuid == backpackData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.backpacks.add(
                        backpackData,
                      );
                    }

                    if (ammunitionData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .ammunitions
                            .any((item) => item.uuid == ammunitionData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.ammunitions
                          .add(ammunitionData);
                    }

                    if (armorData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.armors
                            .any((item) => item.uuid == armorData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.armors.add(
                        armorData,
                      );
                    }

                    if (generalItemData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .generalItens
                            .any(
                              (item) => item.uuid == generalItemData.uuid,
                            ))) {
                      characterBoardDTO[characterBoardData.uuid]!.generalItens
                          .add(generalItemData);
                    }

                    if (saddlebagData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.saddlebags
                            .any((item) => item.uuid == saddlebagData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.saddlebags
                          .add(saddlebagData);
                    }

                    if (shieldData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.shields
                            .any((item) => item.uuid == shieldData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.shields.add(
                        shieldData,
                      );
                    }

                    if (weaponData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.weapons
                            .any((item) => item.uuid == weaponData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.weapons.add(
                        weaponData,
                      );
                    }

                    if (originData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.origins
                            .any((item) => item.uuid == originData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.origins.add(
                        originData,
                      );
                    }

                    if (powerData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.powers
                            .any((item) => item.uuid == powerData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.powers.add(
                        powerData,
                      );
                    }

                    if (conditionData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.conditions
                            .any((item) => item.uuid == conditionData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.conditions
                          .add(conditionData);
                    }

                    if (grimoireData != null) {
                      characterBoardDTO[characterBoardData.uuid]!.grimoireData =
                          grimoireData;
                    }
                  }

                  final characters = characterBoardDTO.entries
                      .map(
                        (entry) =>
                            CharacterBoardAdapters.fromDriftDto(entry.value),
                      )
                      .toList();

                  return characters;
                }),
      );
    } catch (e) {
      return (failure: Failure(e.toString()), character: null);
    }
  }

  Future<({Failure? failure, Stream<CharacterBoard>? character})>
  watchCharactersBoardFromUuid(String uuid) async {
    try {
      return (
        failure: null,
        character:
            (select(characterBoardTable)..where((tbl) => tbl.uuid.equals(uuid)))
                .join([
                  leftOuterJoin(
                    classeCharacterTable,
                    characterBoardTable.uuid.equalsExp(
                      classeCharacterTable.characterUuid,
                    ),
                  ),
                  leftOuterJoin(
                    expertiseTable,
                    characterBoardTable.uuid.equalsExp(
                      expertiseTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    characterTable,
                    characterTable.uuid.equalsExp(
                      characterBoardTable.parentuuid,
                    ),
                  ),
                  leftOuterJoin(
                    characterConditionTable,
                    characterTable.uuid.equalsExp(
                      characterConditionTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    grimoireTable,
                    characterTable.grimoireUuid.equalsExp(grimoireTable.uuid),
                  ),
                  leftOuterJoin(
                    actionTable,
                    characterBoardTable.uuid.equalsExp(actionTable.parentUuid),
                  ),
                  leftOuterJoin(
                    actionHandToHandTable,
                    characterBoardTable.uuid.equalsExp(
                      actionHandToHandTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    actionDistanceAttackTable,
                    characterBoardTable.uuid.equalsExp(
                      actionDistanceAttackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    tibarsTable,
                    characterBoardTable.uuid.equalsExp(tibarsTable.parentUuid),
                  ),
                  leftOuterJoin(
                    globalModifierTable,
                    characterBoardTable.uuid.equalsExp(
                      globalModifierTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    equipmentTable,
                    characterBoardTable.uuid.equalsExp(
                      equipmentTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    adventureBackpackTable,
                    characterBoardTable.uuid.equalsExp(
                      adventureBackpackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    backpackTable,
                    characterBoardTable.uuid.equalsExp(
                      backpackTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    ammunitionTable,
                    characterBoardTable.uuid.equalsExp(
                      ammunitionTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    armorTable,
                    characterBoardTable.uuid.equalsExp(armorTable.parentUuid),
                  ),
                  leftOuterJoin(
                    generalItemTable,
                    characterBoardTable.uuid.equalsExp(
                      generalItemTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    saddlebagTable,
                    characterBoardTable.uuid.equalsExp(
                      saddlebagTable.parentUuid,
                    ),
                  ),
                  leftOuterJoin(
                    shieldTable,
                    characterBoardTable.uuid.equalsExp(shieldTable.parentUuid),
                  ),
                  leftOuterJoin(
                    weaponTable,
                    characterBoardTable.uuid.equalsExp(weaponTable.parentUuid),
                  ),
                  leftOuterJoin(
                    originTable,
                    characterBoardTable.uuid.equalsExp(
                      originTable.characterUuid,
                    ),
                  ),
                  leftOuterJoin(
                    powerTable,
                    characterBoardTable.uuid.equalsExp(
                      powerTable.characterUuid,
                    ),
                  ),
                ])
                .watch()
                .map((rows) {
                  Map<String, CharacterBoardDto> characterBoardDTO = {};

                  for (var row in rows) {
                    final classeData = row.readTableOrNull(
                      classeCharacterTable,
                    );
                    final expertiseData = row.readTableOrNull(expertiseTable);
                    final characterBoardData = row.readTable(
                      characterBoardTable,
                    );
                    final grimoireData = row.readTableOrNull(grimoireTable);
                    final actionData = row.readTableOrNull(actionTable);
                    final conditionData = row.readTableOrNull(
                      characterConditionTable,
                    );
                    final handToHandData = row.readTableOrNull(
                      actionHandToHandTable,
                    );
                    final actionDistance = row.readTableOrNull(
                      actionDistanceAttackTable,
                    );
                    final equipmentData = row.readTableOrNull(equipmentTable);
                    final tibarsData = row.readTableOrNull(tibarsTable);
                    final globlaModifierData = row.readTableOrNull(
                      globalModifierTable,
                    );
                    final adventureBackpackData = row.readTableOrNull(
                      adventureBackpackTable,
                    );
                    final backpackData = row.readTableOrNull(backpackTable);
                    final ammunitionData = row.readTableOrNull(ammunitionTable);
                    final armorData = row.readTableOrNull(armorTable);
                    final generalItemData = row.readTableOrNull(
                      generalItemTable,
                    );
                    final saddlebagData = row.readTableOrNull(saddlebagTable);
                    final shieldData = row.readTableOrNull(shieldTable);
                    final weaponData = row.readTableOrNull(weaponTable);
                    final originData = row.readTableOrNull(originTable);
                    final powerData = row.readTableOrNull(powerTable);

                    if (!(characterBoardDTO.containsKey(
                      characterBoardData.uuid,
                    ))) {
                      characterBoardDTO.addAll({
                        characterBoardData.uuid: CharacterBoardDto(
                          characterBoardsData: characterBoardData,
                          tibars: tibarsData,
                          globalModifiers: globlaModifierData,
                        ),
                      });
                    }

                    if (expertiseData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.expertises
                            .any(
                              (expertise) =>
                                  expertise.uuid == expertiseData.uuid,
                            ))) {
                      characterBoardDTO[characterBoardData.uuid]!.expertises
                          .add(expertiseData);
                    }

                    if (classeData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.classes
                            .any((classe) => classe.uuid == classeData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.classes.add(
                        classeData,
                      );
                    }

                    if (actionData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.actions
                            .any((item) => item.uuid == actionData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.actions.add(
                        actionData,
                      );
                    }

                    if (handToHandData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .handToHands
                            .any((item) => item.uuid == handToHandData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.handToHands
                          .add(handToHandData);
                    }

                    if (actionDistance != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .distanceAttacks
                            .any((item) => item.uuid == actionDistance.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!
                          .distanceAttacks
                          .add(actionDistance);
                    }

                    if (equipmentData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.equipments
                            .any((item) => item.uuid == equipmentData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.equipments
                          .add(equipmentData);
                    }

                    if (adventureBackpackData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.equipments
                            .any(
                              (item) => item.uuid == adventureBackpackData.uuid,
                            ))) {
                      characterBoardDTO[characterBoardData.uuid]!
                          .adventureBackpacks
                          .add(adventureBackpackData);
                    }

                    if (backpackData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.backpacks
                            .any((item) => item.uuid == backpackData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.backpacks.add(
                        backpackData,
                      );
                    }

                    if (ammunitionData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .ammunitions
                            .any((item) => item.uuid == ammunitionData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.ammunitions
                          .add(ammunitionData);
                    }

                    if (armorData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.armors
                            .any((item) => item.uuid == armorData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.armors.add(
                        armorData,
                      );
                    }

                    if (generalItemData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!
                            .generalItens
                            .any(
                              (item) => item.uuid == generalItemData.uuid,
                            ))) {
                      characterBoardDTO[characterBoardData.uuid]!.generalItens
                          .add(generalItemData);
                    }

                    if (saddlebagData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.saddlebags
                            .any((item) => item.uuid == saddlebagData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.saddlebags
                          .add(saddlebagData);
                    }

                    if (shieldData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.shields
                            .any((item) => item.uuid == shieldData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.shields.add(
                        shieldData,
                      );
                    }

                    if (weaponData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.weapons
                            .any((item) => item.uuid == weaponData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.weapons.add(
                        weaponData,
                      );
                    }

                    if (originData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.origins
                            .any((item) => item.uuid == originData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.origins.add(
                        originData,
                      );
                    }

                    if (powerData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.powers
                            .any((item) => item.uuid == powerData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.powers.add(
                        powerData,
                      );
                    }

                    if (conditionData != null &&
                        !(characterBoardDTO[characterBoardData.uuid]!.conditions
                            .any((item) => item.uuid == conditionData.uuid))) {
                      characterBoardDTO[characterBoardData.uuid]!.conditions
                          .add(conditionData);
                    }

                    if (grimoireData != null) {
                      characterBoardDTO[characterBoardData.uuid]!.grimoireData =
                          grimoireData;
                    }
                  }

                  final characters = characterBoardDTO.entries
                      .map(
                        (entry) =>
                            CharacterBoardAdapters.fromDriftDto(entry.value),
                      )
                      .toList();

                  return characters.first;
                }),
      );
    } catch (e) {
      return (failure: Failure(e.toString()), character: null);
    }
  }

  Future<Failure?> updateOnlyCharacter({required Character entity}) async {
    try {
      await into(
        characterTable,
      ).insertOnConflictUpdate(CharacterAdapters.toDriftCompanion(entity));

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in update character: $e $st');
      }

      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteCharacter({required Character entity}) async {
    try {
      if (entity.origins.isNotEmpty) {
        await (delete(
          originTable,
        )..where((tbl) => tbl.characterUuid.equals(entity.uuid))).go();
      }

      if (entity.powers.isNotEmpty) {
        await (delete(
          powerTable,
        )..where((tbl) => tbl.characterUuid.equals(entity.uuid))).go();
      }

      if (entity.classe != null) {
        await (delete(
          classeCharacterTable,
        )..where((tbl) => tbl.characterUuid.equals(entity.uuid))).go();
      }

      if (entity.actions.isNotEmpty) {
        await (delete(
          actionHandToHandTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();
        await (delete(
          actionDistanceAttackTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();
        await (delete(
          actionTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();
      }

      if (entity.equipments.isNotEmpty) {
        await (delete(
          adventureBackpackTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          ammunitionTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          armorTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          backpackTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          generalItemTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          saddlebagTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          shieldTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          weaponTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();

        await (delete(
          equipmentTable,
        )..where((tbl) => tbl.parentUuid.equals(entity.uuid))).go();
      }

      await (delete(
        characterTable,
      )..where((tbl) => tbl.uuid.equals(entity.uuid))).go();

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in delete menace: $e $st');
      }

      return Failure(e.toString());
    }
  }

  Future<Failure?> saveCharacter({
    required Character entity,
    required List<Power> powerToDelete,
    required List<Origin> originToDelete,
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

      await batch((batch) {
        batch.insertAllOnConflictUpdate(characterTable, [
          CharacterAdapters.toDriftCompanion(entity),
        ]);

        if (entity.classe != null) {
          batch.insertAllOnConflictUpdate(classeCharacterTable, [
            ClasseCharacterTypeAdapters.toDriftCompanion(entity.classe!),
          ]);
        }

        if (entity.powers.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            powerTable,
            entity.powers.map(PowerAdapters.toDriftCompanion),
          );
        }

        if (entity.origins.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            originTable,
            entity.origins.map(OriginAdapters.toDriftCompanion),
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
            actionTable,
            actions.map(ActionAdapters.toDriftCompanion),
          );
        }

        if (adventuresBackPack.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            adventureBackpackTable,
            adventuresBackPack.map(AdventureBackpackAdapters.toDriftCompanion),
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
      });

      if (originToDelete.isNotEmpty) {
        Future.forEach(originToDelete, (origin) async {
          await (delete(
            originTable,
          )..where((tbl) => tbl.uuid.equals(origin.uuid))).go();
        });
      }

      if (powerToDelete.isNotEmpty) {
        Future.forEach(powerToDelete, (power) async {
          await (delete(
            powerTable,
          )..where((tbl) => tbl.uuid.equals(power.uuid))).go();
        });
      }

      if (actionsToDelete.isNotEmpty) {
        Future.forEach(actionsToDelete, (action) async {
          if (action is HandToHand) {
            await (delete(
              actionHandToHandTable,
            )..where((tbl) => tbl.uuid.equals(action.uuid))).go();
          } else if (action is DistanceAttack) {
            await (delete(
              actionDistanceAttackTable,
            )..where((tbl) => tbl.uuid.equals(action.uuid))).go();
          } else {
            await (delete(
              actionTable,
            )..where((tbl) => tbl.uuid.equals(action.uuid))).go();
          }
        });
      }

      if (equipmentsToDelete.isNotEmpty) {
        Future.forEach(equipmentsToDelete, (item) async {
          if (item is AdventureBackpack) {
            await (delete(
              adventureBackpackTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else if (item is Ammunition) {
            await (delete(
              ammunitionTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else if (item is Armor) {
            await (delete(
              armorTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else if (item is Backpack) {
            await (delete(
              backpackTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else if (item is GeneralItem) {
            await (delete(
              generalItemTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else if (item is Saddlebag) {
            await (delete(
              saddlebagTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else if (item is Shield) {
            await (delete(
              shieldTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else if (item is Weapon) {
            await (delete(
              weaponTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          } else {
            await (delete(
              equipmentTable,
            )..where((tbl) => tbl.uuid.equals(item.uuid))).go();
          }
        });
      }

      return null;
    } catch (e, st) {
      if (kDebugMode) {
        print('failure in save character: $e $st');
      }

      return Failure(e.toString());
    }
  }

  Future<Failure?> saveBoardCharacter(CharacterBoard character) async {
    List<HandToHand> handToHand = [];
    List<DistanceAttack> distanceAttacks = [];
    List<ActionEnt> actions = [];

    if (character.actions.isNotEmpty) {
      for (var item in character.actions) {
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
    Tibars? tibars;

    if (character.equipments.isNotEmpty) {
      for (var item in character.equipments) {
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
        } else if (item is Tibars) {
          tibars = item;
        } else {
          equipments.add(item);
        }
      }
    }

    try {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(characterBoardTable, [
          CharacterBoardAdapters.toDriftCompanion(character),
        ]);

        if (tibars != null) {
          batch.insertAllOnConflictUpdate(tibarsTable, [
            TibarsAdapters.toDriftCompanion(tibars),
          ]);
        }

        if (character.globalModifiers != null) {
          batch.insertAllOnConflictUpdate(globalModifierTable, [
            GlobalModifiersAdapters.toDriftCompanion(
              character.globalModifiers!,
            ),
          ]);
        }

        if (character.expertises.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            expertiseTable,
            character.expertises.map(
              (entity) => ExpertiseAdapters.toDriftCompanion(entity),
            ),
          );
        }

        if (character.classes.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            classeCharacterTable,
            character.classes.map(
              (entity) => ClasseCharacterTypeAdapters.toDriftCompanion(entity),
            ),
          );
        }

        if (character.powers.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            powerTable,
            character.powers.map(PowerAdapters.toDriftCompanion),
          );
        }

        if (character.origins.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            originTable,
            character.origins.map(OriginAdapters.toDriftCompanion),
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
            actionTable,
            actions.map(ActionAdapters.toDriftCompanion),
          );
        }

        if (adventuresBackPack.isNotEmpty) {
          batch.insertAllOnConflictUpdate(
            adventureBackpackTable,
            adventuresBackPack.map(AdventureBackpackAdapters.toDriftCompanion),
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
      });

      (update(boardTable)
        ..where((tbl) => tbl.uuid.equals(character.boardUuid))
        ..write(
          BoardTableCompanion(
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          ),
        ));

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Failure?> deleteBoardCharacter(CharacterBoard character) async {
    try {
      await (delete(
        characterBoardTable,
      )..where((tbl) => tbl.uuid.equals(character.uuid))).go();

      await (delete(
        originTable,
      )..where((tbl) => tbl.characterUuid.equals(character.uuid))).go();

      await (delete(
        powerTable,
      )..where((tbl) => tbl.characterUuid.equals(character.uuid))).go();

      await (delete(
        classeCharacterTable,
      )..where((tbl) => tbl.characterUuid.equals(character.uuid))).go();

      if (character.expertises.isNotEmpty) {
        await (delete(
          expertiseTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();
      }

      if (character.globalModifiers != null) {
        await (delete(
          generalItemTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();
      }

      if (character.actions.isNotEmpty) {
        await (delete(
          actionHandToHandTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();
        await (delete(
          actionDistanceAttackTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();
        await (delete(
          actionTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();
      }

      if (character.equipments.isNotEmpty) {
        await (delete(
          adventureBackpackTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          ammunitionTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          armorTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          backpackTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          generalItemTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          saddlebagTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          shieldTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          weaponTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          equipmentTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();

        await (delete(
          tibarsTable,
        )..where((tbl) => tbl.parentUuid.equals(character.uuid))).go();
      }

      (update(boardTable)
        ..where((tbl) => tbl.uuid.equals(character.boardUuid))
        ..write(
          BoardTableCompanion(
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          ),
        ));

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
