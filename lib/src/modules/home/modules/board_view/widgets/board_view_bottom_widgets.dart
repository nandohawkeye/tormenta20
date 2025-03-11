// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_options_bottomsheet/board_view_options_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_shortcuts.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/confirm_delete_board_bottomsheet.dart/confirm_delete_board_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/valid_create_close_session_bottomsheet/valid_create_close_session_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_save_main_buttons.dart';

class BoardViewBottomWidgets extends StatelessWidget {
  const BoardViewBottomWidgets(
    this.board, {
    super.key,
    required this.createCloseSession,
    required this.showCombat,
  });

  final Board board;
  final Function() createCloseSession;
  final Function() showCombat;

  @override
  Widget build(BuildContext context) {
    final hasCombatInOpen = board.combats.any((cs) => cs.isOpen);
    final hasSessionOpen = board.sessions.any((ss) => ss.isOpen);

    void createCloseSessionBottomsheet() async {
      await BottomsheetUtils.show<bool?>(
        context: context,
        child: ValidCreateCloseSessionBottomsheet(hasInited: hasSessionOpen),
      ).then((result) async {
        if (result != null && result) {
          createCloseSession();
        }
      });
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: ColoredBox(
        color: palette.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            T20UI.spaceHeight,
            BoardViewShortcuts(board),
            T20UI.spaceHeight,
            ScreenSaveMainButtons(
              label: hasCombatInOpen
                  ? 'Ver combate'
                  : hasSessionOpen
                      ? 'Encerrar sessão'
                      : 'Iníciar sessão',
              extraRightWidgets: [
                SimpleButton(
                  icon: FontAwesomeIcons.bars,
                  iconColor: palette.icon,
                  onTap: () async {
                    BottomsheetUtils.show<BordViewOptionType?>(
                      context: context,
                      child: const BoardViewOptionsBottomsheet(),
                    ).then((result) async {
                      if (result == BordViewOptionType.edit) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                AddEditBoardScreen(initialBoard: board),
                          ),
                        );
                      }

                      if (result == BordViewOptionType.delete) {
                        await BottomsheetUtils.show<bool?>(
                          context: context,
                          child: const ConfirmDeleteBoardBottomsheet(),
                        ).then((result) async {
                          if (result != null) {
                            await GetIt.I<AppDatabase>()
                                .boardDAO
                                .deleteBoard(board)
                                .then((failure) {
                              if (failure == null) {
                                Navigator.pop(context);
                              }
                            });
                          }
                        });
                      }

                      if (result == BordViewOptionType.material) {
                        await Share.shareXFiles([
                          ...board.materials.map((m) => XFile(m.path)),
                          if (board.bannerPath != null) XFile(board.bannerPath!)
                        ]);
                      }
                    });
                  },
                ),
                T20UI.spaceWidth,
              ],
              onSave:
                  hasCombatInOpen ? showCombat : createCloseSessionBottomsheet,
            ),
          ],
        ),
      ),
    );
  }
}
