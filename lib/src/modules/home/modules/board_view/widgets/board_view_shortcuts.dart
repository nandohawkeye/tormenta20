import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_links_button.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_shortcut_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';

class BoardViewShortcuts extends StatelessWidget {
  const BoardViewShortcuts(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoardViewShortcutButton(
            type: BoardShortcutsType.telegran,
            url: board.telegramGroupLink,
          ),
          T20UI.spaceWidth,
          BoardViewShortcutButton(
            type: BoardShortcutsType.discord,
            url: board.discordServerLink,
          ),
          T20UI.spaceWidth,
          BoardViewShortcutButton(
            type: BoardShortcutsType.drive,
            url: board.driveFilesLink,
          ),
          T20UI.spaceWidth,
          BoardViewShortcutButton(
            type: BoardShortcutsType.whats,
            url: board.whatsGroupLink,
          ),
          T20UI.spaceWidth,
          BoardViewLinksButton(
            links: board.links,
          ),
        ],
      ),
    );
  }
}
