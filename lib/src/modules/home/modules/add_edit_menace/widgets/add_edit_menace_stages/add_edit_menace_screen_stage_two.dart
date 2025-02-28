import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_combate_role_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_creature_size_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_type_selector.dart';
import 'package:tormenta20/src/shared/widgets/atribute_textfield.dart';

class AddEditMenaceScreenStageTwo extends StatelessWidget {
  const AddEditMenaceScreenStageTwo({
    super.key,
    required this.controller,
    required this.formKey,
  });

  final AddEditMenaceController controller;
  final GlobalKey<FormState> formKey;

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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AtributeTextfield(
                          label: 'Força',
                          onchange: controller.changeStrength,
                          initialValue: controller.strength,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: AtributeTextfield(
                          label: 'Destreza',
                          onchange: controller.changeDexterity,
                          initialValue: controller.dexterity,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: AtributeTextfield(
                          label: 'Constituição',
                          onchange: controller.changeConstitution,
                          initialValue: controller.constitution,
                        ),
                      ),
                    ],
                  ),
                  T20UI.spaceHeight,
                  Row(
                    children: [
                      Expanded(
                        child: AtributeTextfield(
                          label: 'Inteligencia',
                          onchange: controller.changeIntelligence,
                          initialValue: controller.intelligence,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: AtributeTextfield(
                          label: 'Sabedoria',
                          onchange: controller.changeWisdom,
                          initialValue: controller.wisdom,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: AtributeTextfield(
                          label: 'Carisma',
                          onchange: controller.changeCharisma,
                          initialValue: controller.charisma,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          T20UI.spaceHeight,
          AddEditMenaceScreenTypeSelector(
            controller: controller,
          ),
          T20UI.spaceHeight,
          AddEditMenaceScreenCreatureSizeSelector(
            controller: controller,
          ),
          T20UI.spaceHeight,
          AddEditMenaceScreenCombateRoleSelector(
            controller: controller,
          ),
          T20UI.spaceHeight,
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
