import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipments_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_improvement_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_screen_item.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_special_materials_type_field.dart';
import 'package:tormenta20/src/shared/widgets/desc_textfield.dart';
import 'package:tormenta20/src/shared/widgets/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/price_textfield.dart';
import 'package:tormenta20/src/shared/widgets/quantity_textfield.dart';

class AmmunitionWidgetsGroup extends StatelessWidget {
  const AmmunitionWidgetsGroup(this.controller, this.hasInited, {super.key});

  final AddEditEquipmentsController controller;
  final bool hasInited;

  @override
  Widget build(BuildContext context) {
    return AddEditEquipmentScreenItem(
      hasInited: hasInited,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: NameTextField(
              initialName: controller.name,
              onchange: controller.changeName,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: QuantityTextfield(
              initialValue: controller.quantity,
              onchange: controller.changeQuantity,
              isObrigatory: true,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: PriceTextfield(
              initialValue: controller.price,
              onchange: controller.changePrice,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: DescTextfield(
              initialDesc: controller.desc,
              isObrigatory: false,
              onchange: controller.changeDesc,
            ),
          ),
          T20UI.spaceHeight,
          AddEditEquipmentImprovementTypeField(controller.improvementTypeStore),
          T20UI.spaceHeight,
          AddEditEquipmentSpecialMaterialsTypeField(
              controller.materialTypeStore),
          T20UI.spaceHeight,
        ],
      ),
    );
  }
}
