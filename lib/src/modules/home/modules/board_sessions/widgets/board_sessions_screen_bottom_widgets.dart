// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_combat_button.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/valid_create_close_combat_bottomsheet/valid_create_close_combat_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/valid_create_close_session_bottomsheet/valid_create_close_session_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BoardSessionsScreenBottomWidgets extends StatelessWidget {
  const BoardSessionsScreenBottomWidgets(
    this.session, {
    super.key,
    required this.createCloseSession,
    required this.createCombat,
    required this.showCombat,
  });

  final BoardSession? session;
  final Function() createCloseSession;
  final Function() createCombat;
  final Function() showCombat;

  @override
  Widget build(BuildContext context) {
    final hasCombatInOpen = (session?.combats ?? []).any((cs) => cs.isOpen);
    final hasSessionOpen = session != null && session!.isOpen;

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

    void createCloseCombatBottomsheet() async {
      await showModalBottomSheet<bool?>(
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ValidCreateCloseCombatBottomsheet(hasInited: hasCombatInOpen),
        ),
      ).then((result) async {
        if (result != null && result) {
          createCombat();
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
                  if (hasSessionOpen && !hasCombatInOpen)
                    Padding(
                      padding: const EdgeInsets.only(left: T20UI.spaceSize),
                      child: BoardViewCombatButton(
                        createCombat: createCloseCombatBottomsheet,
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
