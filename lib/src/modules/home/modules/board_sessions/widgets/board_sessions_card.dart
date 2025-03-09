// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/board_session_card_combat_open.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/board_session_card_session_open.dart';
import 'package:tormenta20/src/modules/home/modules/board_sessions/widgets/board_session_combat_card.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/entities/board/board_session.dart';
import 'package:tormenta20/src/shared/entities/board/board_session_ext.dart';
import 'package:tormenta20/src/shared/extensions/data_ext.dart';
import 'package:tormenta20/src/shared/extensions/duration_ext.dart';

class BoardSessionsCard extends StatelessWidget {
  const BoardSessionsCard(
    this.session, {
    super.key,
    required this.createCloseSession,
    required this.updatedSession,
  });

  final BoardSession session;
  final Function() createCloseSession;
  final Function(BoardSession) updatedSession;

  @override
  Widget build(BuildContext context) {
    final isOpen = session.isOpen;
    final isCombatOpen = session.combats.where((c) => c.isOpen).isNotEmpty;

    if (isCombatOpen) {
      final selectedCombat = session.combats.where((c) => c.isOpen).first;
      return BoardSessionCardCombatOpen(selectedCombat);
    }

    if (isOpen) {
      return BoardSessionCardSessionOpen(
        session,
        createCloseSession: createCloseSession,
        updatedSession: updatedSession,
      );
    }

    final isTheSameDay = session.startedAt.isTheSameDay(session.endAt);

    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
      child: Card(
        color: palette.backgroundLevelOne,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            T20UI.spaceHeight,
            if (session.combats.isNotEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.sword,
                        color: palette.accent,
                        height: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Combates',
                        style: TextStyle(
                          fontFamily: FontFamily.tormenta,
                          fontSize: 18,
                          color: palette.accent,
                        ),
                      ),
                      const SizedBox(width: T20UI.smallSpaceSize),
                      Icon(
                        FontAwesomeIcons.shieldHalved,
                        size: 16,
                        color: palette.accent,
                      )
                    ],
                  ),
                  T20UI.spaceHeight,
                  ListView.separated(
                    padding: T20UI.horizontallScreenPadding,
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: session.combats.length,
                    separatorBuilder: T20UI.separatorBuilderVertical,
                    itemBuilder: (_, index) {
                      return BoardSessionCombatCard(
                          combat: session.combats[index]);
                    },
                  ),
                  T20UI.spaceHeight,
                ],
              ),
            if (session.endAt != null)
              Padding(
                padding: T20UI.horizontalPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Duração: ${session.duration.toFormattedStringWithHours()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.tormenta,
                        fontSize: 18,
                      ),
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
              ),
            Padding(
              padding: T20UI.horizontalPadding,
              child: Row(
                children: [
                  Text(
                    session.startedAt.formatted,
                    style: const TextStyle(),
                  ),
                  if (session.endAt != null)
                    Text(
                      isTheSameDay
                          ? ' até ${session.endAt?.formattedHourAndMinute}'
                          : ' até ${session.endAt?.formatted}',
                      style: const TextStyle(),
                    )
                ],
              ),
            ),
            T20UI.spaceHeight,
          ],
        ),
      ),
    );
  }
}
