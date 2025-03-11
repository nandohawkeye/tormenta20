import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';
import 'package:tormenta20/src/shared/utils/treasure_type_utils.dart';

class MenaceHeaderInfos extends StatelessWidget {
  const MenaceHeaderInfos(this.menace, {super.key});

  final Menace menace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          '${CombatRoleUtils.handleTitle(menace.combatRole.name)} - ${MenaceUtils.handleMenaceTitle(menace.type.name)} - ${CreatureSizeUtils.handleTitle(menace.creatureSize.name)}',
          style: TextStyle(
              color: palette.textSecundary, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              'FORT: ${menace.fortResistence} - REF: ${menace.refResistence} - VON: ${menace.vonResistence}',
              maxLines: 2,
              style: TextStyle(
                  color: palette.textSecundary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.shieldHalved,
              size: 14,
              color: palette.textSecundary,
            ),
            const SizedBox(width: 4),
            Text(
              menace.defense.toString().padLeft(2, '0'),
              maxLines: 2,
              style: TextStyle(
                  color: palette.textSecundary, fontWeight: FontWeight.w500),
            ),
            T20UI.spaceWidth,
            Icon(
              FontAwesomeIcons.solidHeart,
              size: 14,
              color: palette.textSecundary,
            ),
            const SizedBox(width: 4),
            Text(
              menace.life.toString().padLeft(2, '0'),
              maxLines: 2,
              style: TextStyle(
                  color: palette.textSecundary, fontWeight: FontWeight.w500),
            ),
            T20UI.spaceWidth,
            Icon(
              FontAwesomeIcons.handSparkles,
              size: 14,
              color: palette.textSecundary,
            ),
            const SizedBox(width: 4),
            Text(
              menace.mana.toString().padLeft(2, '0'),
              maxLines: 2,
              style: TextStyle(
                  color: palette.textSecundary, fontWeight: FontWeight.w500),
            ),
            T20UI.spaceWidth,
            Icon(
              FontAwesomeIcons.personRunning,
              size: 14,
              color: palette.textSecundary,
            ),
            const SizedBox(width: 2),
            Text(
              menace.initiative.toString().padLeft(2, '0'),
              maxLines: 2,
              style: TextStyle(
                  color: palette.textSecundary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.solidGem,
              size: 14,
              color: palette.textSecundary,
            ),
            const SizedBox(width: 4),
            Text(
              TreasureTypeUtils.handleMenaceTitle(
                  menace.treasures?.name ?? 'none'),
              maxLines: 2,
              style: TextStyle(
                  color: palette.textSecundary, fontWeight: FontWeight.w500),
            ),
            T20UI.spaceWidth,
            if (menace.displacement?.isNotEmpty ?? false)
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.personWalking,
                    size: 14,
                    color: palette.textSecundary,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    menace.displacement ?? '',
                    maxLines: 2,
                    style: TextStyle(
                        color: palette.textSecundary,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
          ],
        ),
        if (menace.senses?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.solidEye,
                  size: 14,
                  color: palette.textSecundary,
                ),
                const SizedBox(width: 4),
                Text(
                  menace.senses ?? '',
                  maxLines: 2,
                  style: TextStyle(
                      color: palette.textSecundary,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        if (menace.casterInfos?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.hatWizard,
                  size: 14,
                  color: palette.textSecundary,
                ),
                const SizedBox(width: 4),
                Text(
                  menace.casterInfos ?? '',
                  maxLines: 2,
                  style: TextStyle(
                      color: palette.textSecundary,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
