import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';

class MenaceMagicCard extends StatelessWidget {
  const MenaceMagicCard(this.magic, {super.key});

  final MagicMenace magic;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              if ((magic is! HandToHand) && (magic is! DistanceAttack))
                Text(
                  magic.name.capitalize(),
                  style: TextStyle(
                    color: palette.selected,
                    fontFamily: FontFamily.tormenta,
                    fontSize: 20,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                'Magia - ${magic.resumedDesc}',
                maxLines: 2000,
              ),
              if ((magic.damageDices != null) ||
                  (magic.extraDamageDices != null) ||
                  (magic.pm != null) ||
                  (magic.cd != null))
                const SizedBox(height: 4),
              if ((magic.damageDices != null) ||
                  (magic.extraDamageDices != null))
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      if (magic.damageDices != null)
                        Text(
                          '(${magic.damageDices}+${magic.mediumDamageValue ?? 0})',
                          style: TextStyle(color: palette.textSecundary),
                        ),
                      if (magic.extraDamageDices != null)
                        Text(
                          ' +${magic.extraDamageDices}',
                          style: TextStyle(color: palette.textSecundary),
                        ),
                    ],
                  ),
                ),
              Row(
                children: [
                  if (magic.pm != null)
                    Text(
                      'PM: ${magic.pm}',
                      style: TextStyle(color: palette.textSecundary),
                    ),
                  if ((magic.pm != null) && (magic.cd != null))
                    const SizedBox(width: 4),
                  if (magic.cd != null)
                    Text(
                      'CD: ${magic.cd}',
                      style: TextStyle(color: palette.textSecundary),
                    ),
                ],
              ),
              T20UI.spaceHeight,
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
