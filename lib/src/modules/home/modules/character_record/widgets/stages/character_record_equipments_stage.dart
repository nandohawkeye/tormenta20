import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

        if (equipments.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FontAwesomeIcons.ghost),
                  SizedBox(width: T20UI.smallSpaceSize),
                  Text('Nenhum equipamento', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        }

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
          itemCount: equipmentsNotStored.length,
          separatorBuilder: T20UI.separatorBuilderVertical,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (_, index) {
            return _Card(
              equipment: equipmentsNotStored[index],
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
    print('store in: ${equipment.storedIn}');
    final storedEquipments = allEquipments
        .where((eq) => eq.storedIn == eq.uuid)
        .toList();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: T20UI.spaceSize,
              vertical: T20UI.smallSpaceSize,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                const SizedBox(height: 4),
                Wrap(
                  children: [
                    if (equipment is! HasSpace)
                      Text(EquipmentTypeUtils.handleTitle(equipment.toString()))
                    else if (storedEquipments.isEmpty)
                      Text(
                        'Vazia',
                        style: TextStyle(color: palette.textDisable),
                      )
                    else
                      Text('itens: ${storedEquipments.length}'),

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
                    if (equipment is Armor) ...armorFields(equipment as Armor),
                    if (equipment is Ammunition)
                      ...ammunitionFields(equipment as Ammunition),
                    if (equipment is GeneralItem)
                      ...generalItensFields(equipment as GeneralItem),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
