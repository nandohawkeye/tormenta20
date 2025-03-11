import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/menace_card/menace_card_image.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';

class MenaceCard extends StatelessWidget {
  const MenaceCard({
    super.key,
    required this.menace,
    required this.onTap,
  });

  final Menace menace;
  final Function(Menace) onTap;

  @override
  Widget build(BuildContext context) {
    final links = menace.boardsLinkeds;
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(menace),
        child: Padding(
          padding: T20UI.allSmallPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MenaceCardImage(menace),
              T20UI.smallSpaceWidth,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${menace.name} - ND ${menace.nd}',
                    style: TextStyle(
                      color: palette.accent,
                      fontFamily: FontFamily.tormenta,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                      'Em ${links.isEmpty ? 'nenhuma mesa' : links.length == 1 ? 'uma mesa' : '${links.length.toString().padLeft(2, '0')} mesas'}'),
                  const SizedBox(height: 4),
                  Text(
                    '${CombatRoleUtils.handleTitle(menace.combatRole.name)} - ${MenaceUtils.handleMenaceTitle(menace.type.name)} - ${CreatureSizeUtils.handleTitle(menace.creatureSize.name)}',
                    style:
                        TextStyle(color: palette.textSecundary, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.shieldHalved,
                        size: 12,
                        color: palette.textSecundary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        menace.defense.toString().padLeft(2, '0'),
                        maxLines: 2,
                        style: TextStyle(
                            color: palette.textSecundary, fontSize: 12),
                      ),
                      T20UI.spaceWidth,
                      Icon(
                        FontAwesomeIcons.solidHeart,
                        size: 12,
                        color: palette.textSecundary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        menace.life.toString().padLeft(2, '0'),
                        maxLines: 2,
                        style: TextStyle(
                            color: palette.textSecundary, fontSize: 12),
                      ),
                      T20UI.spaceWidth,
                      Icon(
                        FontAwesomeIcons.handSparkles,
                        size: 12,
                        color: palette.textSecundary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        menace.mana.toString().padLeft(2, '0'),
                        maxLines: 2,
                        style: TextStyle(
                            color: palette.textSecundary, fontSize: 12),
                      ),
                      T20UI.spaceWidth,
                      Icon(
                        FontAwesomeIcons.personRunning,
                        size: 12,
                        color: palette.textSecundary,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        menace.initiative.toString().padLeft(2, '0'),
                        maxLines: 2,
                        style: TextStyle(
                            color: palette.textSecundary, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
