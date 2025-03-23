import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_ammunition_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_armor_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_general_item_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_shield_fields.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/menace_equipment_card/menace_equipment_weapon_fields.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_improvement_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_special_materials_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_type_utils.dart';

class CharacterEquipmentCard extends StatelessWidget {
  const CharacterEquipmentCard(this.equipment, {super.key});

  final Equipment equipment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Text(
                equipment.name.capitalize(),
                style: TextStyle(
                  color: palette.selected,
                  fontFamily: FontFamily.tormenta,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Wrap(
                children: [
                  Text(EquipmentTypeUtils.handleTitle(equipment.toString())),
                  if (equipment.specialMaterial != null)
                    Text(
                      ' - ${EquipmentSpecialMaterialsUtils.handleTitle(equipment.specialMaterial?.name ?? '')}',
                    ),
                  if (equipment.improvements.isNotEmpty)
                    for (var improvement in equipment.improvements)
                      Text(
                        ' - ${EquipmentImprovementTypeUtils.handleTitle(improvement.name)}',
                      ),
                  if (equipment is Weapon) ...weaponFiels(equipment as Weapon),
                  if (equipment is Shield) ...shieldFiels(equipment as Shield),
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
    );
  }
}
