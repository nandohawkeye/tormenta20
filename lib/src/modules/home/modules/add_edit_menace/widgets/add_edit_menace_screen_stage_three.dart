import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_general_skills_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_magics_field.dart';
import 'package:tormenta20/src/shared/widgets/caster_infos_textfield.dart';
import 'package:tormenta20/src/shared/widgets/divinity_selector/divinity_selector.dart';
import 'package:tormenta20/src/shared/widgets/displacements_textfield.dart';

class AddEditMenaceScreenStageThree extends StatelessWidget {
  const AddEditMenaceScreenStageThree({
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
          DivinitySelector(
            onSelectDivinity: controller.changeDivinityId,
            initialDivinityId: controller.divinityId,
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontalPadding,
            child: DisplacementsTextfield(
              onchange: controller.changeDisplacement,
              initialValue: controller.displacement,
            ),
          ),
          T20UI.spaceHeight,
          AddEditMenaceScreenGeneralSkillsField(
            controller: controller,
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontalPadding,
            child: CasterInfosTextfield(
              onchange: controller.changeCasterInfos,
              initialValue: controller.casterInfos,
            ),
          ),
          T20UI.spaceHeight,
          AddEditMenaceScreenMagicsField(
            controller: controller,
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
