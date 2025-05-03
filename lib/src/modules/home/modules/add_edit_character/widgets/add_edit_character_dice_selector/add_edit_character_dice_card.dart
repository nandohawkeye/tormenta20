import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/dices/atribute_roll_dice.dart';
import 'package:tormenta20/src/shared/utils/atribute_utils.dart';

class AddEditCharacterDiceCard extends StatelessWidget {
  const AddEditCharacterDiceCard({
    super.key,
    required this.atributeRollDice,
    this.selected,
    required this.onTap,
  });

  final AtributeRollDice atributeRollDice;
  final AtributeRollDice? selected;
  final Function(AtributeRollDice) onTap;

  @override
  Widget build(BuildContext context) {
    final dices = atributeRollDice.rolledDicesValue;
    final isSelected = atributeRollDice.uuid == selected?.uuid;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Card(
            child: InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: () => onTap(atributeRollDice),
              child: Center(
                  child: Padding(
                padding: T20UI.horizontallScreenPadding,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (atributeRollDice.atribute != null)
                      Text(
                        AtributeUtils.resumedTitle(atributeRollDice.atribute!),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color:
                              isSelected ? palette.accent : palette.textPrimary,
                        ),
                      ),
                    ...List.generate(
                      dices.length,
                      (index) {
                        if (index + 1 == dices.length) {
                          return Text(
                            '${dices[index]} ',
                            style: TextStyle(color: palette.textDisable),
                          );
                        }

                        return Text(
                          '${dices[index]}, ',
                          style: TextStyle(
                            color: isSelected
                                ? palette.accent
                                : palette.textPrimary,
                          ),
                        );
                      },
                    ),
                    Text(
                      ' = ${atributeRollDice.atributeValue}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            isSelected ? palette.accent : palette.textPrimary,
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ),
        T20UI.smallSpaceWidth,
      ],
    );
  }
}
