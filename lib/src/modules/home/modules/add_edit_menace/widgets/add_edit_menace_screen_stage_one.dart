import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_selector.dart';
import 'package:tormenta20/src/shared/widgets/defense_textfield.dart';

import 'package:tormenta20/src/shared/widgets/initiative_textfield.dart';
import 'package:tormenta20/src/shared/widgets/life_textfield.dart';
import 'package:tormenta20/src/shared/widgets/mana_textfield.dart';
import 'package:tormenta20/src/shared/widgets/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/nd_textfield.dart';
import 'package:tormenta20/src/shared/widgets/perception_textfield.dart';
import 'package:tormenta20/src/shared/widgets/resis_fort_textfield.dart';
import 'package:tormenta20/src/shared/widgets/resis_ref_textfield.dart';
import 'package:tormenta20/src/shared/widgets/resis_von_textfield.dart';
import 'package:tormenta20/src/shared/widgets/senses_textfield.dart';

class AddEditMenaceScreenStageOne extends StatelessWidget {
  const AddEditMenaceScreenStageOne({
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
          TokenSelector(
            allTokens: Assets.tokens.values.map((t) => t.path).toList(),
            changeAsset: controller.changeAsset,
            changePath: controller.changePath,
            initalImageAsset: controller.imageAsset,
            initialImagePath: controller.imagePath,
            size: 80,
          ),
          T20UI.spaceHeight,
          Form(
            key: formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: T20UI.spaceSize - 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NameTextField(
                          onchange: controller.changeName,
                          initialName: controller.name,
                        ),
                      ),
                    ],
                  ),
                  T20UI.spaceHeight,
                  Row(
                    children: [
                      Expanded(
                        child: LifeTextField(
                          onchange: controller.changeLife,
                          initialLife: controller.life,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: ManaTextField(
                          onchange: controller.changeMana,
                          initialMana: controller.mana,
                        ),
                      ),
                    ],
                  ),
                  T20UI.spaceHeight,
                  Row(
                    children: [
                      Expanded(
                        child: InitiativeTextfield(
                          onchange: controller.changeInitiative,
                          initialInitiative: controller.initiative,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: DefenseTextField(
                          onchange: controller.changeDefense,
                          initialDefense: controller.defense,
                        ),
                      ),
                    ],
                  ),
                  T20UI.spaceHeight,
                  Row(
                    children: [
                      Expanded(
                        child: PerceptionTextfield(
                          onchange: controller.changePerception,
                          initialPerception: controller.perception,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: NDTextField(
                          onchange: controller.changeND,
                          initialND: controller.nd,
                        ),
                      ),
                    ],
                  ),
                  T20UI.spaceHeight,
                  SensesTextfield(
                    onchange: controller.changeSenses,
                    initialValue: controller.senses,
                  ),
                  T20UI.spaceHeight,
                  Row(
                    children: [
                      Expanded(
                        child: ResisFortTextfield(
                          onchange: controller.changeResisFort,
                          initialValue: controller.resisFort,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: ResisRefTextfield(
                          onchange: controller.changeResisRef,
                          initialValue: controller.resisRef,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Expanded(
                        child: ResisVonTextfield(
                          onchange: controller.changeResisVon,
                          initialValue: controller.resisVon,
                        ),
                      ),
                    ],
                  ),
                  T20UI.spaceHeight,
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
