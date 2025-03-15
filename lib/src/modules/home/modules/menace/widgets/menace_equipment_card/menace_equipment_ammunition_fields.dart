import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/ammunition.dart';
import 'package:tormenta20/src/shared/extensions/double_ext.dart';

List<Widget> ammunitionFields(Ammunition equipment) {
  return [
    Text(' - ${equipment.quantity.toString().padLeft(2, '0')}'),
    if (equipment.price != null)
      Text(' - T\$ ${equipment.price?.reduceFormatted}'),
    if (equipment.desc != null)
      Text(
        ' - ${equipment.desc ?? ''}',
        maxLines: 2000,
      ),
  ];
}

class EquipmentAmmunitionTypeUtils {}
