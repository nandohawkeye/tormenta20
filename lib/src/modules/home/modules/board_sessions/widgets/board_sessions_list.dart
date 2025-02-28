import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/board_sessions_card.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';

class BoardSessionsList extends StatelessWidget {
  const BoardSessionsList({
    super.key,
    required this.sessions,
    required this.createCloseSession,
  });

  final List<BoardSession> sessions;
  final Function() createCloseSession;

  @override
  Widget build(BuildContext context) {
    sessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    return Expanded(
      child: SingleChildScrollView(
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
                createCloseSession: createCloseSession,
              ),
            )
          ],
        ),
      ),
    );
  }
}
