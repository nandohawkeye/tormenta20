import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/atribute_item.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';

class BoardViewCharacterAtributesField extends StatelessWidget {
  const BoardViewCharacterAtributesField(this.character, {super.key});

  final CharacterBoard character;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: palette.backgroundLevelThree.withValues(alpha: .3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: T20UI.spaceSize,
          vertical: T20UI.smallSpaceSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AtributeItem(
              value: character.strength ?? 0,
              label: 'FOR',
              fontSize: 20,
            ),
            AtributeItem(
              value: character.dexterity ?? 0,
              label: 'DES',
              fontSize: 20,
            ),
            AtributeItem(
              value: character.constitution ?? 0,
              label: 'CON',
              fontSize: 20,
            ),
            AtributeItem(
              value: character.intelligence ?? 0,
              label: 'INT',
              fontSize: 20,
            ),
            AtributeItem(
              value: character.wisdom ?? 0,
              label: 'SAB',
              fontSize: 20,
            ),
            AtributeItem(
              value: character.charisma ?? 0,
              label: 'CAR',
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
