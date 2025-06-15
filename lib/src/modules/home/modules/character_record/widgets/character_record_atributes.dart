import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/character_record/widgets/character_atribute_button.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';

class CharacterRecordAtributes extends StatelessWidget {
  const CharacterRecordAtributes(this.characterBoard, {super.key});

  final ValueListenable<CharacterBoard> characterBoard;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: characterBoard,
        builder: (_, __) {
          final character = characterBoard.value;
          return Padding(
            padding: T20UI.horizontallScreenPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CharacterAtributeButton(
                  value: character.strength ?? 0,
                  label: 'FOR',
                ),
                CharacterAtributeButton(
                  value: character.dexterity ?? 0,
                  label: 'DES',
                ),
                CharacterAtributeButton(
                  value: character.constitution ?? 0,
                  label: 'CON',
                ),
                CharacterAtributeButton(
                  value: character.intelligence ?? 0,
                  label: 'INT',
                ),
                CharacterAtributeButton(
                  value: character.wisdom ?? 0,
                  label: 'SAB',
                ),
                CharacterAtributeButton(
                  value: character.charisma ?? 0,
                  label: 'CAR',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
