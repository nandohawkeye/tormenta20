import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_dice_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/atribute_dice_field.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddCharacterAtributesFields extends StatelessWidget {
  const AddCharacterAtributesFields(this.controller, {super.key});

  final AddEditCharacterController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: controller.atributeDicesStore,
          builder: (_, __) {
            final strengthDice =
                controller.atributeDicesStore.dices.firstWhereOrNull(
              (at) => at.atribute == Atribute.strength,
            );

            final dexterityDice =
                controller.atributeDicesStore.dices.firstWhereOrNull(
              (at) => at.atribute == Atribute.dexterity,
            );

            final constitutionDice =
                controller.atributeDicesStore.dices.firstWhereOrNull(
              (at) => at.atribute == Atribute.constitution,
            );

            return Padding(
              padding: T20UI.horizontallScreenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: AtributeDiceField(
                      atribute: Atribute.strength,
                      value: (strengthDice?.atributeValue ?? 0).abs(),
                      setAtribute: controller.atributeDicesStore.setAtribute,
                      isNegative: (strengthDice?.atributeValue ?? 0).isNegative,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: AtributeDiceField(
                      atribute: Atribute.dexterity,
                      value: (dexterityDice?.atributeValue ?? 0).abs(),
                      setAtribute: controller.atributeDicesStore.setAtribute,
                      isNegative:
                          (dexterityDice?.atributeValue ?? 0).isNegative,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: AtributeDiceField(
                      atribute: Atribute.constitution,
                      value: (constitutionDice?.atributeValue ?? 0).abs(),
                      setAtribute: controller.atributeDicesStore.setAtribute,
                      isNegative:
                          (constitutionDice?.atributeValue ?? 0).isNegative,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        T20UI.spaceHeight,
        AnimatedBuilder(
          animation: controller.atributeDicesStore,
          builder: (_, __) {
            final intelligenceDice =
                controller.atributeDicesStore.dices.firstWhereOrNull(
              (at) => at.atribute == Atribute.intelligence,
            );

            final wisdomDice =
                controller.atributeDicesStore.dices.firstWhereOrNull(
              (at) => at.atribute == Atribute.wisdom,
            );

            final charismaDice =
                controller.atributeDicesStore.dices.firstWhereOrNull(
              (at) => at.atribute == Atribute.charisma,
            );

            return Padding(
              padding: T20UI.horizontallScreenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: AtributeDiceField(
                      atribute: Atribute.intelligence,
                      value: (intelligenceDice?.atributeValue ?? 0).abs(),
                      setAtribute: controller.atributeDicesStore.setAtribute,
                      isNegative:
                          (intelligenceDice?.atributeValue ?? 0).isNegative,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: AtributeDiceField(
                      atribute: Atribute.wisdom,
                      value: (wisdomDice?.atributeValue ?? 0).abs(),
                      isNegative: (wisdomDice?.atributeValue ?? 0).isNegative,
                      setAtribute: controller.atributeDicesStore.setAtribute,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: AtributeDiceField(
                      atribute: Atribute.charisma,
                      value: (charismaDice?.atributeValue ?? 0).abs(),
                      setAtribute: controller.atributeDicesStore.setAtribute,
                      isNegative: (charismaDice?.atributeValue ?? 0).isNegative,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        AddEditCharacterDiceSelector(controller.atributeDicesStore),
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: MainButton(
            label: 'Rolar dados',
            icon: FontAwesomeIcons.dice,
            onTap: controller.createDices,
          ),
        ),
        AnimatedBuilder(
            animation: controller.atributeDicesStore,
            builder: (_, __) {
              final hasError = controller.atributeDicesStore.hasError;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.spaceSize + T20UI.spaceSize,
                ).copyWith(top: 8),
                child: Text(
                  hasError
                      ? 'Verifique se todos os atributos ja receberam um valor!'
                      : 'obrigatório, aperte em "🎲 Rolar dados", selecione o dado e depois o atributo.',
                  maxLines: 10,
                  style: TextStyle(
                    fontSize: 12,
                    color: hasError ? palette.accent : palette.textSecundary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
