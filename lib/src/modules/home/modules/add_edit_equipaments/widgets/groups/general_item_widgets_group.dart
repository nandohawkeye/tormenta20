import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipments_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_general_item_type.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_improvement_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_screen_item.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_special_materials_type_field.dart';
import 'package:tormenta20/src/shared/widgets/textfields/desc_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/ocuped_spaces_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/price_textfield.dart';

class GeneralItemWidgetsGroup extends StatelessWidget {
  const GeneralItemWidgetsGroup(this.controller, this.hasInited, {super.key});

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
          AddEditEquipmentGeneralItemType(controller.generalItemTypeStore),
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
            child: OcupedSpacesTextfield(
              initialValue: controller.ocupadeSpace,
              onchange: controller.changeOcupadeSpace,
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
