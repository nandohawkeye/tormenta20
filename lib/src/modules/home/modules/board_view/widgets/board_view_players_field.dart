import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/add_edit_player_character.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_player_card.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_player_options/board_view_player_options.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_screen_button.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';

class BoardViewPlayersField extends StatelessWidget {
  const BoardViewPlayersField(this.board, {super.key});

  final Board board;

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
          GetIt.I<AppDatabase>().boardDAO.saveBoardPlayer(result);
        }
      });
    }

    void playerOptions(BoardPlayer player) async {
      await showModalBottomSheet<PlayerOptionsType?>(
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const BoardViewPlayerOptions(),
        ),
      ).then((result) {
        if (result == PlayerOptionsType.edit) {
          addEditPlayer(player);
        }

        if (result == PlayerOptionsType.delete) {
          GetIt.I<AppDatabase>().boardDAO.deleteBoardPlayer(player);
        }
      });
    }

    final players = board.players;
    players.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Personagens'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleButton(
                    icon: FontAwesomeIcons.plus,
                    onTap: () => addEditPlayer(null),
                  ),
                  T20UI.spaceWidth,
                  SimpleButton(
                    icon: FontAwesomeIcons.solidFileCode,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        players.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  bottom: T20UI.spaceSize,
                  right: T20UI.spaceSize - 4,
                  left: T20UI.spaceSize - 4,
                ),
                child: CharacterScreenButton(
                  subtitle:
                      'Crie ou adicione um personagem via arquivo para começar a jogar!',
                  onTap: () => addEditPlayer(null),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: T20UI.spaceSize - 4),
                    itemCount: players.length,
                    separatorBuilder: T20UI.separatorBuilderVertical,
                    itemBuilder: (_, index) {
                      return BoardViewPlayerCard(
                        player: players[index],
                        onTap: playerOptions,
                      );
                    },
                  ),
                ),
              )
      ],
    );
  }
}
