import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat.dart';
import 'package:tormenta20/src/shared/entities/board/board_combat_ext.dart';
import 'package:tormenta20/src/shared/extensions/data_ext.dart';
import 'package:tormenta20/src/shared/extensions/duration_ext.dart';

class BoardSessionCombatCard extends StatelessWidget {
  const BoardSessionCombatCard({super.key, required this.combat});

  final BoardCombat combat;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: T20UI.borderRadius,
          side: BorderSide(color: palette.backgroundLevelTwo)),
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
                  combat.startedAt.formatted,
                  style: const TextStyle(
                    fontFamily: FontFamily.tormenta,
                    fontSize: 16,
                  ),
                ),
                if (combat.endAt != null)
                  Icon(
                    FontAwesomeIcons.arrowsLeftRight,
                    color: palette.disable,
                  ),
                if (combat.endAt != null)
                  Text(
                    '${combat.endAt?.formatted}',
                    style: const TextStyle(
                      fontFamily: FontFamily.tormenta,
                      fontSize: 16,
                    ),
                  )
              ],
            ),
            if (combat.endAt != null)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  T20UI.spaceHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Duração: ${combat.duration.toFormattedStringWithHours()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${combat.turn}º turno',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
