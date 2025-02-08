// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_shortcuts.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BoardViewBottomWidgets extends StatelessWidget {
  const BoardViewBottomWidgets(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Align(
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
                  bottom:
                      MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MainButton(label: 'Iníciar sessão', onTap: () {}),
                    ),
                    // T20UI.spaceWidth,
                    // const BoardViewCombatButton(),
                    T20UI.spaceWidth,
                    const SimpleCloseButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
