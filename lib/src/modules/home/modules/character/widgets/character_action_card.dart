import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/action/distance_attack.dart';
import 'package:tormenta20/src/shared/entities/action/hand_to_hand.dart';
import 'package:tormenta20/src/shared/extensions/string_ext.dart';
import 'package:tormenta20/src/shared/utils/action_type_utils.dart';

class CharacterActionCard extends StatelessWidget {
  const CharacterActionCard(this.action, {super.key});

  final ActionEnt action;

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
              if (action is DistanceAttack)
                Text(
                  'Ataque á distância',
                  style: TextStyle(
                    color: palette.selected,
                    fontFamily: FontFamily.tormenta,
                    fontSize: 20,
                  ),
                ),
              if (action is HandToHand)
                Text(
                  'Corpo-a-Corpo',
                  style: TextStyle(
                    color: palette.selected,
                    fontFamily: FontFamily.tormenta,
                    fontSize: 20,
                  ),
                ),
              if ((action is! HandToHand) && (action is! DistanceAttack))
                Text(
                  '${action.name.capitalize()} (${ActionTypeUtils.handleTitle(action.type.name)})',
                  style: TextStyle(
                    color: palette.selected,
                    fontFamily: FontFamily.tormenta,
                    fontSize: 20,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                '${((action is HandToHand) || (action is DistanceAttack)) ? '${action.name} - ' : ''}${action.desc}',
                maxLines: 2000,
              ),
              if ((action.damageDices != null) ||
                  (action.extraDamageDices != null) ||
                  (action.pm != null) ||
                  (action.cd != null))
                const SizedBox(height: 4),
              if ((action.damageDices != null) ||
                  (action.extraDamageDices != null))
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      if (action.damageDices != null)
                        Text(
                          '(${action.damageDices}+${action.mediumDamageValue ?? 0}, ${action.critical ?? 20}*${action.criticalMultiplier ?? 1})',
                          style: TextStyle(color: palette.textSecundary),
                        ),
                      if (action.extraDamageDices != null)
                        Text(
                          ' +${action.extraDamageDices}',
                          style: TextStyle(color: palette.textSecundary),
                        ),
                    ],
                  ),
                ),
              Row(
                children: [
                  if (action.pm != null)
                    Text(
                      'PM: ${action.pm}',
                      style: TextStyle(color: palette.textSecundary),
                    ),
                  if ((action.pm != null) && (action.cd != null))
                    const SizedBox(width: 4),
                  if (action.cd != null)
                    Text(
                      'CD: ${action.cd}',
                      style: TextStyle(color: palette.textSecundary),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
