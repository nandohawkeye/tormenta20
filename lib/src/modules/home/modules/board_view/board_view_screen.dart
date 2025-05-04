// ignore_for_file: use_build_context_synchronously

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_combat/board_combat_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_banner.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_bottom_widgets.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_card/board_view_character_field.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_menaces_field/board_view_menaces_field.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_players_field.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_sessions.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_text_fields.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';

class BoardViewScreen extends StatefulWidget {
  const BoardViewScreen({super.key, required this.initial});

  final Board initial;

  @override
  State<BoardViewScreen> createState() => _BoardViewScreenState();
}

class _BoardViewScreenState extends State<BoardViewScreen> {
  late final BoardViewStore _store;

  @override
  void initState() {
    _store = BoardViewStore(widget.initial);
    super.initState();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _store,
      builder: (_, __) {
        final board = _store.board;
        final menaces = board.menaces;
        final characters = _store.boardCharacters;
        final character = characters.firstWhereOrNull((e) => e.isAlive);

        return Material(
          color: palette.background,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoardViewBanner(board),
                    BoardViewTextFields(board),
                    const Divider(),
                    if (board.mode == BoardModeType.player)
                      BoardViewCharacterField(
                        board,
                        characters: characters,
                        saveBoardCharacter: _store.saveBaordCharacter,
                        deleteBoardCharacter: _store.deleteBoardCharacter,
                      ),
                    if (board.mode == BoardModeType.master)
                      BoardViewSessions(
                        board,
                        createCombat: _store.createCloseCombat,
                      ),
                    if (board.mode == BoardModeType.master)
                      BoardViewPlayersField(
                        board,
                        saveBoardPlayer: _store.saveBoardPlayer,
                        deleteBoardPlayer: _store.deleteBoardPlayer,
                      ),
                    if (board.mode == BoardModeType.master)
                      BoardViewMenacesField(
                        menaces,
                        boardUuid: board.uuid,
                        removeMenace: _store.removeLinkMenaceToBoard,
                      ),
                    const SizedBox(height: 240)
                  ],
                ),
              ),
              BoardViewBottomWidgets(
                board,
                deleteBoard: _store.deleteBoard,
                createCloseSession: _store.createCloseSession,
                character: character,
                showCharacterRecord: () {},
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
              ),
            ],
          ),
        );
      },
    );
  }
}
