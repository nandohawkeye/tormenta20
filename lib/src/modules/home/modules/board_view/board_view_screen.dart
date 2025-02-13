// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_store.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_banner.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_bottom_widgets.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_materials_field.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_notes_field.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_options_button.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_players_field.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_sessions.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_text_fields.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

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
    return AnimatedBuilder(
      animation: _store,
      builder: (_, __) {
        final board = _store.board;

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
                    BoardViewSessions(board),
                    BoardViewNotesField(board),
                    BoardViewPlayersField(board),
                    BoardViewMaterialsField(board),
                    const SizedBox(height: 300)
                  ],
                ),
              ),
              BoardViewBottomWidgets(
                board,
                createCloseSession: _store.createCloseSession,
                createCombat: _store.createCloseCombat,
                showCombat: () {},
              ),
              BoardViewOptionsButton(board),
            ],
          ),
        );
      },
    );
  }
}
