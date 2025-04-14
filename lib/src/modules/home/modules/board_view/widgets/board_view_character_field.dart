import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_card.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_screen_button.dart';
import 'package:tormenta20/src/modules/home/modules/select_character/select_character_screen.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';

class BoardViewCharacterField extends StatelessWidget {
  const BoardViewCharacterField(
    this.board, {
    super.key,
    required this.saveBoardCharacter,
    required this.deleteBoardCharacter,
  });

  final Board board;
  final Future<void> Function(CharacterBoard character) saveBoardCharacter;
  final Future<void> Function(CharacterBoard character) deleteBoardCharacter;

  @override
  Widget build(BuildContext context) {
    void addEditPlayer(CharacterBoard? character) async {
      // await Navigator.push<BoardPlayer?>(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => AddEditBoardPlayerCharacter(
      //       character: character,
      //       boardUuid: board.uuid,
      //     ),
      //   ),
      // ).then((result) {
      //   if (result != null) {
      //     saveBoardPlayer(result);
      //   }
      // });
    }

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

    void playerOptions(CharacterBoard character) async {
      // await BottomsheetUtils.show<PlayerOptionsType?>(
      //   context: context,
      //   child: BoardViewPlayerOptions(character),
      // ).then(
      //   (result) {
      //     if (result == PlayerOptionsType.edit) {
      //       addEditPlayer(character);
      //     }

      //     if (result == PlayerOptionsType.delete) {
      //       deleteBoardPlayer(character);
      //     }

      //     if (result == PlayerOptionsType.alive) {
      //       saveBoardPlayer(
      //         character.copyWithChangeAlive(isAlive: !player.isAlive),
      //       );
      //     }
      //   },
      // );
    }

    final character = board.characters.firstWhereOrNull((c) => c.isAlive);

    print('character: $character');

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
                if (character == null)
                  CharacterScreenButton(
                    title: 'Personagem',
                    subtitle:
                        'Adicione ou crie um personagem para comeãr a jogar',
                    onTap: addCharacter,
                  )
                else
                  BoardViewCharacterCard(
                    character: character,
                    onTap: addEditPlayer,
                  )
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     const DividerLevelTwo(verticalPadding: 0),
                //     SizedBox(
                //       width: double.infinity,
                //       child: ListView.separated(
                //         shrinkWrap: true,
                //         primary: false,
                //         padding: EdgeInsets.zero,
                //         physics: const NeverScrollableScrollPhysics(),
                //         itemCount: players.length,
                //         separatorBuilder: (_, __) =>
                //             const DividerLevelTwo(verticalPadding: 0),
                //         itemBuilder: (_, index) {
                //           return BoardViewPlayerCard(
                //             player: players[index],
                //             onTap: playerOptions,
                //           );
                //         },
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
