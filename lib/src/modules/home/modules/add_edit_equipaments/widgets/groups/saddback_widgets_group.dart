import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipments_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_screen_item.dart';

import 'package:tormenta20/src/shared/widgets/price_textfield.dart';

class SaddbackWidgetsGroup extends StatelessWidget {
  const SaddbackWidgetsGroup(this.controller, this.hasInited, {super.key});

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
            child: PriceTextfield(
              initialValue: controller.price,
              onchange: controller.changePrice,
            ),
          ),
          T20UI.spaceHeight,
        ],
      ),
    );
  }
}
