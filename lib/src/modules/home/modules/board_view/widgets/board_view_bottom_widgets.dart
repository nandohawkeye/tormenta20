// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_shortcuts.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/valid_create_close_session_bottomsheet/valid_create_close_session_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

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
      await showModalBottomSheet<bool?>(
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ValidCreateCloseSessionBottomsheet(hasInited: hasSessionOpen),
        ),
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
            Padding(
              padding: EdgeInsets.only(
                top: T20UI.spaceSize,
                left: T20UI.spaceSize,
                right: T20UI.spaceSize,
                bottom: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      label: hasCombatInOpen
                          ? 'Ver combate'
                          : hasSessionOpen
                              ? 'Encerrar sessão'
                              : 'Iníciar sessão',
                      onTap: hasCombatInOpen
                          ? showCombat
                          : createCloseSessionBottomsheet,
                    ),
                  ),
                  T20UI.spaceWidth,
                  const SimpleCloseButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
