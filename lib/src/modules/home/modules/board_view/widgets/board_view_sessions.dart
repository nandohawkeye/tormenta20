import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_session_in_open_session_button.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:tormenta20/src/shared/extensions/data_ext.dart';
import 'package:tormenta20/src/shared/extensions/duration_ext.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class BoardViewSessions extends StatelessWidget {
  const BoardViewSessions(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    final sessions = board.sessions;
    if (board.mode == BoardModeType.player || sessions.isEmpty) {
      return const SizedBox.shrink();
    }

    final combats = board.combats.where((c) => c.isOpen).toList();
    combats.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));

    final currentSession = sessions.first;

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
              Labels(combats.isNotEmpty
                  ? 'Em combate'
                  : currentSession.isOpen
                      ? 'Sessão atual'
                      : 'Ultima sessão: ${currentSession.startedAt.formatted}'),
              // SimpleButton(
              //   icon: FontAwesomeIcons.plus,
              //   onTap: addEditNote,
              // ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.only(
            bottom: T20UI.spaceSize,
            right: T20UI.spaceSize - 4,
            left: T20UI.spaceSize - 4,
          ),
          child: currentSession.isOpen
              ? BoardViewSessionInOpenSessionButton(
                  startedAt: currentSession.startedAt,
                  inCombat: combats.isNotEmpty,
                )
              : ScreenImageButton(
                  imageAsset: Assets.images.knight.path,
                  title:
                      '${currentSession.isOpen ? 'Jogando há' : 'Tempo jogado'} ${currentSession.duration.toFormattedStringWithHours()}',
                  subtitle:
                      'Sua última sessão ${combats.isNotEmpty ? 'teve ${combats.length.toString().padLeft(2, '0')} combates' : 'não teve combates'}, clique aqui para ver todas as sessões',
                  onTap: () {},
                ),
        )
      ],
    );
  }
}
