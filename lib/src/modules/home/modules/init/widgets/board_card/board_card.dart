import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card_banner.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card_player_image.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class BoardCard extends StatelessWidget {
  const BoardCard({super.key, required this.board, this.width = 300});

  final Board board;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddEditBoardScreen(initialBoard: board),
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
                  bannerPath: board.bannerPath,
                  isVeryHeight: board.players.isEmpty,
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
                        color: palette.accent.withOpacity(.6),
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
                    const SizedBox(height: T20UI.spaceSize / 2),
                    if (board.players.isNotEmpty)
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: T20UI.spaceSize / 2),
                        child: SizedBox(
                          height: (40 * context.realTextScale),
                          width: width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: List.generate(
                              board.players.length,
                              (index) => BoardCardPlayerImage(
                                index: index,
                                player: board.players[index],
                                minusSize: (38 * context.realTextScale),
                                defaultSize: (40 * context.realTextScale),
                              ),
                            ),
                          ),
                        ),
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
