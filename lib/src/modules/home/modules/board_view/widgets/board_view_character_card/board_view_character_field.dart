import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_card/board_view_character_card.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_card/board_view_character_death_character_card.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_card/board_view_character_death_character_card_prototype.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_confirm_delete/board_view_character_confirm_delete_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_options_bottomsheet/board_view_character_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_screen_button.dart';
import 'package:tormenta20/src/modules/home/modules/select_character/select_character_screen.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class BoardViewCharacterField extends StatelessWidget {
  const BoardViewCharacterField(
    this.board, {
    super.key,
    required this.saveBoardCharacter,
    required this.deleteBoardCharacter,
    required this.characters,
  });

  final Board board;
  final List<CharacterBoard> characters;
  final Future<void> Function(CharacterBoard character) saveBoardCharacter;
  final Future<void> Function(CharacterBoard character) deleteBoardCharacter;

  @override
  Widget build(BuildContext context) {
    void addCharacter() async {
      await Navigator.push<CharacterBoard?>(
        context,
        MaterialPageRoute(
          builder: (_) => SelectCharacterScreen(
            boardUuid: board.uuid,
          ),
        ),
      ).then((result) {
        if (result != null) {
          saveBoardCharacter(result);
        }
      });
    }

    void onDelete(CharacterBoard character) async {
      await BottomsheetUtils.show<bool?>(
        context: context,
        child: BoardViewCharacterConfirmDeleteBottomsheet(
          characterName: character.name,
        ),
      ).then((result) {
        if (result == true) {
          deleteBoardCharacter(character);
        }
      });
    }

    void characterOptions(CharacterBoard character) async {
      await BottomsheetUtils.show<CharacterOptionsType?>(
        context: context,
        child: BoardViewCharacterOptionsBottomsheet(character),
      ).then(
        (result) {
          if (result == CharacterOptionsType.delete) {
            onDelete(character);
          }

          if (result == CharacterOptionsType.alive) {
            saveBoardCharacter(
              character.copyWith(isAlive: !character.isAlive),
            );
          }
        },
      );
    }

    final characterAlive = characters.firstWhereOrNull((c) => c.isAlive);
    final deathCharacters = characters.where((c) => !c.isAlive).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.only(
            right: T20UI.screenContentSpaceSize,
            left: T20UI.screenContentSpaceSize,
          ),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (characterAlive == null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CharacterScreenButton(
                        title: 'Personagem',
                        subtitle:
                            'Adicione ou crie um personagem para começar a jogar',
                        onTap: addCharacter,
                      ),
                      if (deathCharacters.isNotEmpty)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const DividerLevelTwo(verticalPadding: 0),
                            SizedBox(
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: deathCharacters.length,
                                prototypeItem:
                                    const BoardViewCharacterDeathCharacterCardPrototype(),
                                itemBuilder: (_, index) {
                                  return BoardViewCharacterDeathCharacterCard(
                                    character: deathCharacters[index],
                                    onTap: characterOptions,
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                    ],
                  )
                else
                  BoardViewCharacterCard(
                    character: characterAlive,
                    onTap: characterOptions,
                    onTapDeathCharacter: onDelete,
                    otherCharacters: deathCharacters,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
