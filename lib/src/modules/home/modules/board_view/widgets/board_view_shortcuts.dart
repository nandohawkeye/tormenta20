import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_links_button.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_notes_button.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_shortcut_button.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/bord_view_materials_button.dart';
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
          if (board.telegramGroupLink != null)
            BoardViewShortcutButton(
              type: BoardShortcutsType.telegran,
              url: board.telegramGroupLink,
            ),
          if (board.discordServerLink != null)
            BoardViewShortcutButton(
              type: BoardShortcutsType.discord,
              url: board.discordServerLink,
            ),
          if (board.driveFilesLink != null)
            BoardViewShortcutButton(
              type: BoardShortcutsType.drive,
              url: board.driveFilesLink,
            ),
          if (board.whatsGroupLink != null)
            BoardViewShortcutButton(
              type: BoardShortcutsType.whats,
              url: board.whatsGroupLink,
            ),
          BordViewMaterialsButton(board: board),
          const SizedBox(width: T20UI.spaceSize / 2),
          BoardViewNotesButton(board: board),
          const SizedBox(width: T20UI.spaceSize / 2),
          BoardViewLinksButton(board: board),
        ],
      ),
    );
  }
}
