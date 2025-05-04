import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/board_sessions_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/board_sessions_card.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';

class BoardSessionsList extends StatelessWidget {
  const BoardSessionsList({
    super.key,
    required this.store,
    required this.createCloseSession,
    required this.updatedSession,
  });

  final BoardSessionsStore store;
  final Function() createCloseSession;
  final Function(BoardSession) updatedSession;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RepaintBoundary(
        child: ListenableBuilder(
          listenable: store,
          builder: (_, __) {
            final sessions = store.sessions;
            sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: T20UI.screenContentSpaceSize,
                right: T20UI.screenContentSpaceSize,
                bottom: T20UI.spaceSize + MediaQuery.of(context).padding.bottom,
                top: T20UI.spaceSize,
              ),
              child: Column(
                children: [
                  ...sessions.map(
                    (session) => BoardSessionsCard(
                      session,
                      updatedSession: updatedSession,
                      createCloseSession: createCloseSession,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
