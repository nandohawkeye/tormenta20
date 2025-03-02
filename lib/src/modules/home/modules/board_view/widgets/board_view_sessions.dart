import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/board_sessions_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_session_in_open_session_button.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/valid_create_close_combat_bottomsheet/valid_create_close_combat_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:tormenta20/src/shared/extensions/data_ext.dart';
import 'package:tormenta20/src/shared/extensions/duration_ext.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class BoardViewSessions extends StatelessWidget {
  const BoardViewSessions(this.board, {super.key, required this.createCombat});

  final Board board;
  final Function() createCombat;

  @override
  Widget build(BuildContext context) {
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
          child: const ValidCreateCloseCombatBottomsheet(hasInited: false),
        ),
      ).then((result) async {
        if (result != null && result) {
          createCombat();
        }
      });
    }

    final sessions = board.sessions;
    if (board.mode == BoardModeType.player || sessions.isEmpty) {
      return const SizedBox.shrink();
    }

    void toSession() async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BoardSessionsScreen(
            boardUuid: board.uuid,
          ),
        ),
      );
    }

    final combats = board.combats.where((c) => c.isOpen).toList();
    combats.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));

    final currentSession = sessions.first;
    final combatsSessions = board.combats
        .where((cb) => cb.sessionUuid == currentSession.uuid)
        .toList();

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
              Labels(
                combats.isNotEmpty
                    ? 'Em combate'
                    : currentSession.isOpen
                        ? 'Sessão atual'
                        : 'Ultima sessão: ${currentSession.startedAt.formatted}',
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.only(
            bottom: T20UI.spaceSize,
            right: T20UI.screenContentSpaceSize,
            left: T20UI.screenContentSpaceSize,
          ),
          child: currentSession.isOpen
              ? BoardViewSessionInOpenSessionButton(
                  startedAt: currentSession.startedAt,
                  inCombat: combats.isNotEmpty,
                  onInitCombat: createCloseCombatBottomsheet,
                  onTap: toSession,
                )
              : ScreenImageButton(
                  imageAsset: Assets.images.knight.path,
                  title:
                      '${currentSession.isOpen ? 'Jogando há' : 'Duração'} ${currentSession.duration.toFormattedStringWithHours()}',
                  subtitle:
                      'Sua última sessão ${combatsSessions.isNotEmpty ? 'teve ${combatsSessions.length.toString().padLeft(2, '0')} combate${combatsSessions.length > 1 ? 's' : ''}' : 'não teve combates'}, clique aqui para ver todas as sessões',
                  onTap: toSession,
                ),
        )
      ],
    );
  }
}
