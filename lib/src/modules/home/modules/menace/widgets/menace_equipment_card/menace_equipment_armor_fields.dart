import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor.dart';
import 'package:tormenta20/src/shared/extensions/double_ext.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_armor_type_utils.dart';

List<Widget> armorFields(Armor equipment) {
  return [
    Text(' - ${EquipmentArmorTypeUtils.handleTitle(equipment.type.name)}'),
    if (equipment.price != null)
      Text(' - T\$ ${equipment.price?.reduceFormatted}'),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(' - '),
        const Icon(FontAwesomeIcons.shieldHalved, size: 14),
        Text(' ${equipment.defenseBonus}'),
      ],
    ),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(' - '),
        const Icon(FontAwesomeIcons.weightHanging, size: 14),
        Text(' ${equipment.penalty}'),
      ],
    ),
    if (equipment.desc != null)
      Text(
        ' - ${equipment.desc ?? ''}',
        maxLines: 2000,
      ),
  ];
}
