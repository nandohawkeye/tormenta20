import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield.dart';
import 'package:tormenta20/src/shared/extensions/double_ext.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_shield_type_utils.dart';

List<Widget> shieldFiels(Shield equipment) {
  return [
    Text(' - ${EquipmentShieldTypeUtils.handleTitle(equipment.type.name)}'),
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
