import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/character_record_store.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_ammunition_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_armor_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_general_item_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_shield_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_weapon_fields.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/has_space.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/tibars.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_improvement_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_special_materials_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_type_utils.dart';

class CharacterRecordEquipmentsStage extends StatelessWidget {
  const CharacterRecordEquipmentsStage(this.store, {super.key});

  final CharacterRecordStore store;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store.characterBoard,
      builder: (_, _) {
        final equipments = store.characterBoard.value.equipments;

        final equipmentsNotStored = equipments
            .where((eq) => eq.storedIn == null)
            .toList();

        equipmentsNotStored.sort(
          (a, b) => a is HasSpace && b is! HasSpace ? -1 : 1,
        );

        return ListView.separated(
          padding: T20UI.horizontallScreenPadding.copyWith(
            bottom: T20UI.spaceSize,
            top: T20UI.spaceSize,
          ),
          shrinkWrap: true,
          itemCount: equipmentsNotStored.length + 1,
          separatorBuilder: (_, index) => SizedBox(
            height: index == 0 ? T20UI.spaceSize : T20UI.smallSpaceSize,
          ),
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (_, index) {
            if (index == 0) {
              return const SizedBox(
                height: 48,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.shield),
                      T20UI.smallSpaceWidth,
                      Text(
                        'Adicionar equipamento',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }

            return _Card(
              equipment: equipmentsNotStored[index - 1],
              allEquipments: equipments,
            );
          },
        );
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.equipment, required this.allEquipments});

  final Equipment equipment;
  final List<Equipment> allEquipments;

  @override
  Widget build(BuildContext context) {
    print('all equipments: $allEquipments');

    final storedEquipments = allEquipments
        .where((eq) => eq.storedIn == equipment.uuid)
        .toList();

    return Card(
      child: Row(
        children: [
          if (storedEquipments.isEmpty)
            Padding(
              padding: const EdgeInsets.only(left: T20UI.spaceSize),
              child: Image.asset(
                EquipmentTypeUtils.handleImagePath(equipment),
                height: 50,
                width: 50,
              ),
            ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsGeometry.only(
                    top: T20UI.smallSpaceSize,
                    bottom: T20UI.spaceSize - 2,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: T20UI.spaceSize,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              equipment.name.capitalize(),
                              style: TextStyle(
                                color: palette.accent,
                                fontFamily: FontFamily.tormenta,
                                fontSize: 20,
                              ),
                            ),
                            if (equipment is HasSpace)
                              Text(
                                '${storedEquipments.length}/${(equipment as HasSpace).normalSpaces}',
                                style: const TextStyle(
                                  fontFamily: FontFamily.tormenta,
                                  fontSize: 20,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: (equipment is HasSpace)
                              ? T20UI.spaceSize - 2
                              : T20UI.spaceSize,
                        ),
                        child: Wrap(
                          children: [
                            if (equipment is! HasSpace)
                              Text(
                                EquipmentTypeUtils.handleTitle(
                                  equipment.toString(),
                                ),
                              )
                            else if (storedEquipments.isEmpty)
                              Text(
                                'Vazia',
                                style: TextStyle(color: palette.textDisable),
                              )
                            else
                              Column(
                                children: storedEquipments
                                    .map((eq) => _StoreInCard(equipment: eq))
                                    .toList(),
                              ),

                            if (equipment.specialMaterial != null)
                              Text(
                                ' - ${EquipmentSpecialMaterialsUtils.handleTitle(equipment.specialMaterial?.name ?? '')}',
                              ),
                            if (equipment.improvements.isNotEmpty)
                              for (var improvement in equipment.improvements)
                                Text(
                                  ' - ${EquipmentImprovementTypeUtils.handleTitle(improvement.name)}',
                                ),
                            if (equipment is Weapon)
                              ...weaponFiels(equipment as Weapon),
                            if (equipment is Shield)
                              ...shieldFiels(equipment as Shield),
                            if (equipment is Armor)
                              ...armorFields(equipment as Armor),
                            if (equipment is Ammunition)
                              ...ammunitionFields(equipment as Ammunition),
                            if (equipment is GeneralItem)
                              ...generalItensFields(equipment as GeneralItem),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StoreInCard extends StatelessWidget {
  const _StoreInCard({required this.equipment});

  final Equipment equipment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: T20UI.smallSpaceSize),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: T20UI.borderRadius,
          side: BorderSide(color: palette.backgroundLevelTwo),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: T20UI.smallSpaceSize,
            horizontal: T20UI.smallSpaceSize + 2,
          ),
          child: Row(
            children: [
              Assets.images.coin.image(height: 50, width: 50),
              T20UI.smallSpaceWidth,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(equipment.name),
                    const SizedBox(height: T20UI.smallSpaceSize),
                    if (equipment is Tibars)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bronze: ${(equipment as Tibars).bronze.toString().padLeft(2, "0")}',
                            style: TextStyle(color: palette.textSecundary),
                          ),
                          Text(
                            'Prata: ${(equipment as Tibars).silver.toString().padLeft(2, "0")}',
                            style: TextStyle(color: palette.textSecundary),
                          ),
                          Text(
                            'Ouro: ${(equipment as Tibars).gold.toString().padLeft(2, "0")}',
                            style: TextStyle(color: palette.textSecundary),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
