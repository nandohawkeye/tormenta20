import 'package:flutter/cupertino.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item.dart';
import 'package:tormenta20/src/shared/extensions/double_ext.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_general_item_type_utils.dart';

List<Widget> generalItensFields(GeneralItem equipment) {
  return [
    Text(
        ' - ${EquipmentGeneralItemTypeUtils.handleTitle(equipment.type.name)}'),
    if (equipment.price != null)
      Text(' - T\$ ${equipment.price?.reduceFormatted}'),
    if (equipment.desc != null)
      Text(
        ' - ${equipment.desc ?? ''}',
        maxLines: 2000,
      ),
  ];
}
