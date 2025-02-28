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
  });

  final BoardSession session;
  final Function() createCloseSession;

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
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
      child: Card(
        color: palette.backgroundLevelOne,
        child: Padding(
          padding: T20UI.allPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    session.startedAt.formatted,
                    style: const TextStyle(
                      fontFamily: FontFamily.tormenta,
                      fontSize: 18,
                    ),
                  ),
                  if (session.endAt != null)
                    Icon(
                      FontAwesomeIcons.arrowsLeftRight,
                      color: palette.disable,
                    ),
                  if (session.endAt != null)
                    Text(
                      '${session.endAt?.formatted}',
                      style: const TextStyle(
                        fontFamily: FontFamily.tormenta,
                        fontSize: 18,
                      ),
                    )
                ],
              ),
              if (session.endAt != null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    Text(
                      'Duração: ${session.duration.toFormattedStringWithHours()}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              if (session.combats.isNotEmpty)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    T20UI.spaceHeight,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.sword,
                          color: palette.selected,
                          height: 22,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Combates',
                          style: TextStyle(
                            fontFamily: FontFamily.tormenta,
                            fontSize: 18,
                            color: palette.selected,
                          ),
                        ),
                        const SizedBox(width: T20UI.smallSpaceSize),
                        Icon(
                          FontAwesomeIcons.shieldHalved,
                          size: 16,
                          color: palette.selected,
                        )
                      ],
                    ),
                    T20UI.spaceHeight,
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: session.combats.length,
                      separatorBuilder: T20UI.separatorBuilderVertical,
                      itemBuilder: (_, index) {
                        return BoardSessionCombatCard(
                            combat: session.combats[index]);
                      },
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
