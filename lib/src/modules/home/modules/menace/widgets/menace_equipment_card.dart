import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/equipament/adventurer_backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/entities/equipament/saddlebag.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/extensions/double_ext.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipament_weapon_purpose_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_armor_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_general_item_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_improvement_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_proficiency_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_shield_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_special_materials_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_weapon_range_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_weapon_skill_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_weapon_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_wieldable_type_utils.dart';

class MenaceEquipmentCard extends StatelessWidget {
  const MenaceEquipmentCard(this.equipment, {super.key});

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
              if ((equipment is! AdventureBackpack) &&
                  (equipment is! Backpack) &&
                  (equipment is! Saddlebag))
                const SizedBox(height: 4),
              Wrap(
                children: [
                  Text(EquipmentTypeUtils.handleTitle(equipment.toString())),
                  if (equipment is Weapon)
                    Text(
                        ' - ${EquipmentWeaponTypeUtils.handleTitle((equipment as Weapon).type.name)}'),
                  if (equipment is Weapon)
                    Text(
                        ' - ${EquipamentWeaponPurposeUtils.handleTitle((equipment as Weapon).purpose.name)}'),
                  if (equipment is Weapon)
                    Text(
                        ' - ${EquipmentProficiencyTypeUtils.handleTitle((equipment as Weapon).proficiency.name)}'),
                  if (equipment is Weapon &&
                      (equipment as Weapon).steps != null)
                    Text(
                        ' - Passos: ${(equipment as Weapon).steps.toString().padLeft(2, '0')}'),
                  if (equipment is Weapon && (equipment as Weapon).isUnarmed)
                    const Text(' - Arma natural'),
                  if (equipment is Weapon && (equipment as Weapon).isNatural)
                    const Text(' - Ataque desarmado'),
                  if (equipment is Weapon &&
                      (equipment as Weapon).skills.isNotEmpty)
                    for (var skill in (equipment as Weapon).skills)
                      Text(
                          ' - ${EquipmentWeaponSkillTypeUtils.handleTitle(skill.name)}'),
                  if (equipment is Weapon)
                    Text(
                        ' - ${EquipmentWeaponRangeTypeUtils.handleTitle((equipment as Weapon).range.name)}'),
                  if (equipment is Shield)
                    Text(
                        ' - ${EquipmentShieldTypeUtils.handleTitle((equipment as Shield).type.name)}'),
                  if (equipment is Armor)
                    Text(
                        ' - ${EquipmentArmorTypeUtils.handleTitle((equipment as Armor).type.name)}'),
                  if (equipment is GeneralItem)
                    Text(
                        ' - ${EquipmentGeneralItemTypeUtils.handleTitle((equipment as GeneralItem).type.name)}'),
                  if (equipment is Ammunition)
                    Text(
                        ' - ${(equipment as Ammunition).quantity.toString().padLeft(2, '0')}'),
                  if (equipment.specialMaterial != null)
                    Text(
                      ' - ${EquipmentSpecialMaterialsUtils.handleTitle(equipment.specialMaterial?.name ?? '')}',
                    ),
                  if (equipment.improvements.isNotEmpty)
                    for (var improvement in equipment.improvements)
                      Text(
                        ' - ${EquipmentImprovementTypeUtils.handleTitle(improvement.name)}',
                      ),
                  if (equipment is Armor)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(' - '),
                        const Icon(FontAwesomeIcons.shieldHalved, size: 14),
                        Text(' ${(equipment as Armor).defenseBonus}'),
                      ],
                    ),
                  if (equipment is Armor)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(' - '),
                        const Icon(FontAwesomeIcons.weightHanging, size: 14),
                        Text(' ${(equipment as Armor).penalty}'),
                      ],
                    ),
                  if (equipment is Weapon)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(' - '),
                        const Icon(FontAwesomeIcons.solidHand, size: 14),
                        Text(
                            ' ${EquipmentWieldableTypeUtils.handleTitle((equipment as Weapon).wieldableType.name)}'),
                      ],
                    ),
                  if (equipment is Shield)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(' - '),
                        const Icon(FontAwesomeIcons.shieldHalved, size: 14),
                        Text(' ${(equipment as Shield).defenseBonus}'),
                      ],
                    ),
                  if (equipment is Shield)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(' - '),
                        const Icon(FontAwesomeIcons.weightHanging, size: 14),
                        Text(' ${(equipment as Shield).penalty}'),
                      ],
                    ),
                  if (equipment is Ammunition &&
                      (equipment as Ammunition).price != null)
                    Text(
                        ' - T\$ ${(equipment as Ammunition).price?.reduceFormatted}'),
                  if (equipment is Armor && (equipment as Armor).price != null)
                    Text(
                        ' - T\$ ${(equipment as Armor).price?.reduceFormatted}'),
                  if (equipment is Shield &&
                      (equipment as Shield).price != null)
                    Text(
                        ' - T\$ ${(equipment as Shield).price?.reduceFormatted}'),
                  if (equipment is GeneralItem &&
                      (equipment as GeneralItem).price != null)
                    Text(
                        ' - T\$ ${(equipment as GeneralItem).price?.reduceFormatted}'),
                  if (equipment is Weapon &&
                      (equipment as Weapon).price != null)
                    Text(
                        ' - T\$ ${(equipment as Weapon).price?.reduceFormatted}'),
                  if (equipment is Weapon && (equipment as Weapon).desc != null)
                    Text(
                      ' - ${(equipment as Weapon).desc ?? ''}',
                      maxLines: 2000,
                    ),
                  if (equipment is Ammunition &&
                      (equipment as Ammunition).desc != null)
                    Text(
                      ' - ${(equipment as Ammunition).desc ?? ''}',
                      maxLines: 2000,
                    ),
                  if (equipment is Shield && (equipment as Shield).desc != null)
                    Text(
                      ' - ${(equipment as Shield).desc ?? ''}',
                      maxLines: 2000,
                    ),
                  if (equipment is Armor && (equipment as Armor).desc != null)
                    Text(
                      ' - ${(equipment as Armor).desc ?? ''}',
                      maxLines: 2000,
                    ),
                  if (equipment is GeneralItem &&
                      (equipment as GeneralItem).desc != null)
                    Text(
                      ' - ${(equipment as GeneralItem).desc ?? ''}',
                      maxLines: 2000,
                    ),
                  if (equipment is Weapon)
                    Text(
                      ' - (${(equipment as Weapon).dices}, ${(equipment as Weapon).critical}*${(equipment as Weapon).criticalMultiplier})',
                    ),
                ],
              ),
              T20UI.spaceHeight,
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
