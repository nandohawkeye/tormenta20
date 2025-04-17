import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card_banner.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card_character_token.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card_players_tokens.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';

class BoardCard extends StatelessWidget {
  const BoardCard({super.key, required this.board, this.width = 300});

  final Board board;
  final double width;

  @override
  Widget build(BuildContext context) {
    final players = board.players.where((bp) => bp.isAlive).toList();
    players.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    final character =
        board.characters.where((bc) => bc.isAlive).toList().firstOrNull;
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BoardViewScreen(initial: board),
            ),
          );
        },
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(T20UI.inputBorderRadius),
                  topRight: Radius.circular(T20UI.inputBorderRadius),
                ),
                child: BoardCardBanner(
                  width: width,
                  board: board,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      board.adventureName,
                      style: TextStyle(
                        fontFamily: FontFamily.tormenta,
                        fontSize: 18,
                        color: palette.accent,
                      ),
                    ),
                    Text(
                      board.name,
                      style: TextStyle(
                        fontFamily: FontFamily.tormenta,
                        fontSize: 14,
                        color: palette.textDisable,
                      ),
                    ),
                    const SizedBox(height: T20UI.smallSpaceSize),
                    if (board.mode == BoardModeType.player)
                      BoardCardCharacterToken(
                        character: character,
                        width: width,
                      ),
                    if (board.mode == BoardModeType.master)
                      BoardCardPlayersTokens(
                        players: players,
                        width: width,
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
