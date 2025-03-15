import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/add_edit_player_character.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_player_card.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_player_options/board_view_player_options.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_screen_button.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class BoardViewPlayersField extends StatelessWidget {
  const BoardViewPlayersField(
    this.board, {
    super.key,
    required this.saveBoardPlayer,
    required this.deleteBoardPlayer,
  });

  final Board board;
  final Future<void> Function(BoardPlayer player) saveBoardPlayer;
  final Future<void> Function(BoardPlayer player) deleteBoardPlayer;

  @override
  Widget build(BuildContext context) {
    void addEditPlayer(BoardPlayer? character) async {
      await Navigator.push<BoardPlayer?>(
        context,
        MaterialPageRoute(
          builder: (_) => AddEditBoardPlayerCharacter(
            character: character,
            boardUuid: board.uuid,
          ),
        ),
      ).then((result) {
        if (result != null) {
          saveBoardPlayer(result);
        }
      });
    }

    void playerOptions(BoardPlayer player) async {
      await BottomsheetUtils.show<PlayerOptionsType?>(
        context: context,
        child: BoardViewPlayerOptions(player),
      ).then(
        (result) {
          if (result == PlayerOptionsType.edit) {
            addEditPlayer(player);
          }

          if (result == PlayerOptionsType.delete) {
            deleteBoardPlayer(player);
          }

          if (result == PlayerOptionsType.alive) {
            saveBoardPlayer(
              player.copyWithChangeAlive(isAlive: !player.isAlive),
            );
          }
        },
      );
    }

    final players = board.players;
    players.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    players.sort((a, b) => (b.isAlive ? 1 : 0).compareTo((a.isAlive ? 1 : 0)));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        const Padding(
          padding: T20UI.horizontalPadding,
          child: Labels('Personagens'),
        ),
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
                CharacterScreenButton(
                  subtitle:
                      'Crie ou adicione um personagem via arquivo para começar a jogar!',
                  onTap: () => addEditPlayer(null),
                ),
                if (players.isNotEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DividerLevelTwo(verticalPadding: 0),
                      SizedBox(
                        width: double.infinity,
                        child: ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: players.length,
                          separatorBuilder: (_, __) =>
                              const DividerLevelTwo(verticalPadding: 0),
                          itemBuilder: (_, index) {
                            return BoardViewPlayerCard(
                              player: players[index],
                              onTap: playerOptions,
                            );
                          },
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
