import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/edit_session_environment_bottomsheet/edit_session_environment_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/valid_create_close_combat_bottomsheet/valid_create_close_combat_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/session_environment.dart';
import 'package:tormenta20/src/shared/extensions/duration_ext.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/utils/session_environment_utils.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class BoardSessionCardSessionOpen extends StatefulWidget {
  const BoardSessionCardSessionOpen(
    this.session, {
    super.key,
    required this.createCloseSession,
    required this.updatedSession,
  });

  final BoardSession session;
  final Function() createCloseSession;
  final Function(BoardSession) updatedSession;

  @override
  State<BoardSessionCardSessionOpen> createState() =>
      _BoardSessionCardSessionOpenState();
}

class _BoardSessionCardSessionOpenState
    extends State<BoardSessionCardSessionOpen> {
  Timer? _timer;
  String _value = 'Jogando - 00Hs : 00Min : 00s';

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  void _initTimer() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() {
          _value =
              '${SessionEnvironmentUtils.handleTitle(widget.session.environment?.name ?? 'Jogando')} - ${DateTime.now().difference(widget.session.startedAt).toFormattedStringWithHours()}';
        });
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _createCloseSessionBottomsheet() async {
    await BottomsheetUtils.show<bool?>(
      context: context,
      child: const ValidCreateCloseCombatBottomsheet(hasInited: false),
    ).then((result) async {
      if (result != null && result) {
        widget.createCloseSession();
      }
    });
  }

  void _changeSessionEnvironment() async {
    await BottomsheetUtils.show<SessionEnvironment?>(
      context: context,
      child: EditSessionEnvironmentBottomsheet(session: widget.session),
    ).then((result) async {
      if (result != null) {
        final now = DateTime.now();
        final upSession = widget.session.copyWith(
          environment: result,
          updatedAt: now,
        );
        widget.updatedSession(upSession);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: T20UI.borderRadius,
            side: BorderSide(
                width: 2, color: palette.accent.withValues(alpha: .4))),
        color: palette.backgroundLevelOne,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: _changeSessionEnvironment,
          child: Padding(
            padding: T20UI.allPadding,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.diceD20, size: 16),
                      SizedBox(width: T20UI.smallSpaceSize),
                      Text(
                        'Sessão atual',
                        style: TextStyle(
                          fontFamily: FontFamily.tormenta,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: T20UI.smallSpaceSize),
                      Icon(FontAwesomeIcons.dice, size: 16)
                    ],
                  ),
                  T20UI.spaceHeight,
                  Text(
                    _value,
                    style: const TextStyle(
                      fontFamily: FontFamily.tormenta,
                      fontSize: 16,
                    ),
                  ),
                  T20UI.spaceHeight,
                  MainButton(
                    label: 'Iníciar combate',
                    onTap: _createCloseSessionBottomsheet,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
