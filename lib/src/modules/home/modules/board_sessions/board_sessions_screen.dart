import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/board_combat/board_combat_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/board_sessions_list.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/board_sessions_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/board_sessions_screen_bottom_widgets.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';

class BoardSessionsScreen extends StatefulWidget {
  const BoardSessionsScreen({super.key, required this.boardUuid});

  final String boardUuid;

  @override
  State<BoardSessionsScreen> createState() => _BoardSessionsScreenState();
}

class _BoardSessionsScreenState extends State<BoardSessionsScreen> {
  late final BoardSessionsStore _store;

  @override
  void initState() {
    super.initState();
    _store = BoardSessionsStore(widget.boardUuid);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenHeader(label: 'Sessões'),
          const Divider(),
          AnimatedBuilder(
            animation: _store,
            builder: (_, __) {
              return BoardSessionsList(
                sessions: _store.sessions,
                createCloseSession: _store.createCloseCombat,
                updatedSession: _store.updateSession,
              );
            },
          ),
          AnimatedBuilder(
            animation: _store,
            builder: (_, __) {
              return BoardSessionsScreenBottomWidgets(
                _store.currentSession,
                createCloseSession: _store.createCloseSession,
                createCombat: _store.createCloseCombat,
                showCombat: () {
                  final currentCombat = _store.getCurrentCombat();
                  if (currentCombat != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BoardCombatScreen(
                          combat: currentCombat,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
