import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_expertise_field.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_action_field/add_edit_action_field.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_equipament_field/add_edit_equipment_field.dart';
import 'package:tormenta20/src/shared/widgets/textfields/desc_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/extra_infos_textfield.dart';

class AddEditMenaceScreenStageFour extends StatelessWidget {
  const AddEditMenaceScreenStageFour({
    super.key,
    required this.controller,
  });

  final AddEditMenaceController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: DescTextfield(
              initialDesc: controller.desc,
              onchange: controller.changeDesc,
              isObrigatory: false,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: ExtraInfosTextfield(
              isObrigatory: false,
              initialValue: controller.extraInfos,
              onchange: controller.changeExtraInfos,
            ),
          ),
          T20UI.spaceHeight,
          AddEditEquipamentField(
            store: controller.equipmentsStore,
            onAddDeleteList: controller.addEquipmentToDelete,
            menaceUuid: controller.menaceUuid,
          ),
          T20UI.spaceHeight,
          AddEditActionField(
            store: controller.actionsStore,
            getEquipaments: controller.getEquipaments,
            onAddDeleteList: controller.addActionsToDelete,
            menaceUuid: controller.menaceUuid,
          ),
          T20UI.spaceHeight,
          AddEditMenaceExpertiseField(
            controller.expertisesStore,
            menaceUuid: controller.menaceUuid,
            onAddDeleteList: controller.addToDeleteExpertise,
          ),
          T20UI.spaceHeight,
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
