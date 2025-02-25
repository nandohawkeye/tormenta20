import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/rool_dice.dart';

class AddEditDicesFieldCard extends StatelessWidget {
  const AddEditDicesFieldCard({
    super.key,
    required this.dice,
    required this.onRemove,
  });

  final RoolDice dice;
  final Function(RoolDice) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: palette.backgroundLevelTwo,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onRemove(dice),
        child: Padding(
          padding: T20UI.horizontalPadding,
          child: Center(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(dice.toString()),
              T20UI.spaceWidth,
              Icon(
                FontAwesomeIcons.solidTrashCan,
                color: palette.accent,
              )
            ],
          )),
        ),
      ),
    );
  }
}
