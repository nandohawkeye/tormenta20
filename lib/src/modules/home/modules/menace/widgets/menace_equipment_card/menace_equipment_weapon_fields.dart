import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon.dart';
import 'package:tormenta20/src/shared/extensions/double_ext.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipament_weapon_purpose_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_proficiency_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_weapon_range_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_weapon_skill_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_weapon_type_utils.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_wieldable_type_utils.dart';

List<Widget> weaponFiels(Weapon equipment) {
  return [
    Text(' - ${EquipmentWeaponTypeUtils.handleTitle(equipment.type.name)}'),
    Text(
        ' - ${EquipamentWeaponPurposeUtils.handleTitle(equipment.purpose.name)}'),
    Text(
        ' - ${EquipmentProficiencyTypeUtils.handleTitle(equipment.proficiency.name)}'),
    if (equipment.steps != null)
      Text(' - Passos: ${equipment.steps.toString().padLeft(2, '0')}'),
    if (equipment.isUnarmed) const Text(' - Arma natural'),
    if (equipment.isNatural) const Text(' - Ataque desarmado'),
    if (equipment.skills.isNotEmpty)
      for (var skill in equipment.skills)
        Text(' - ${EquipmentWeaponSkillTypeUtils.handleTitle(skill.name)}'),
    Text(
        ' - ${EquipmentWeaponRangeTypeUtils.handleTitle(equipment.range.name)}'),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(' - '),
        const Icon(FontAwesomeIcons.solidHand, size: 14),
        Text(
            ' ${EquipmentWieldableTypeUtils.handleTitle(equipment.wieldableType.name)}'),
      ],
    ),
    if (equipment.price != null)
      Text(' - T\$ ${equipment.price?.reduceFormatted}'),
    if (equipment.desc != null)
      Text(
        ' - ${equipment.desc ?? ''}',
        maxLines: 2000,
      ),
    Text(
      ' - (${equipment.dices}, ${equipment.critical}*${equipment.criticalMultiplier})',
    ),
  ];
}
