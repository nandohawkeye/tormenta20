import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';
import 'package:tormenta20/src/shared/utils/treasure_type_utils.dart';

class BoardViewMenaneFieldCard extends StatelessWidget {
  const BoardViewMenaneFieldCard({
    super.key,
    required this.menace,
    required this.onTap,
  });

  final Menace menace;
  final Function(Menace) onTap;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 54;
    return Card(
      color: palette.cardBackground,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(menace),
        child: Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              SizedBox(
                height: imageSize + 6,
                width: imageSize + 6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Icon(
                        FontAwesomeIcons.solidUser,
                        color: palette.disable,
                      ),
                    ),
                    if (menace.imagePath != null)
                      ClipOval(
                        child: Image.file(
                          File(menace.imagePath!),
                          height: imageSize,
                          width: imageSize,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                        ),
                      ),
                    if (menace.imageAsset != null)
                      ClipOval(
                        child: Image.asset(
                          menace.imageAsset!,
                          height: imageSize,
                          width: imageSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Assets.images.bordaTokenAmeaca.image(
                      height: imageSize + 6,
                      width: imageSize + 6,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              T20UI.spaceWidth,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${menace.name} - ND ${menace.nd}',
                      maxLines: 2,
                      style: const TextStyle(fontFamily: FontFamily.tormenta),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${CombatRoleUtils.handleTitle(menace.combatRole.name)} - ${MenaceUtils.handleMenaceTitle(menace.type.name)} - ${CreatureSizeUtils.handleTitle(menace.creatureSize.name)}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(FontAwesomeIcons.shieldHalved, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          menace.defense.toString().padLeft(2, '0'),
                          maxLines: 2,
                          style: const TextStyle(fontSize: 12),
                        ),
                        T20UI.spaceWidth,
                        const Icon(FontAwesomeIcons.solidHeart, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          menace.life.toString().padLeft(2, '0'),
                          maxLines: 2,
                          style: const TextStyle(fontSize: 12),
                        ),
                        T20UI.spaceWidth,
                        const Icon(FontAwesomeIcons.handSparkles, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          menace.mana.toString().padLeft(2, '0'),
                          maxLines: 2,
                          style: const TextStyle(fontSize: 12),
                        ),
                        T20UI.spaceWidth,
                        const Icon(FontAwesomeIcons.personRunning, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          menace.initiative.toString().padLeft(2, '0'),
                          maxLines: 2,
                          style: const TextStyle(fontSize: 12),
                        ),
                        T20UI.spaceWidth,
                        const Icon(FontAwesomeIcons.solidGem, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          TreasureTypeUtils.handleMenaceTitle(
                              menace.treasures?.name ?? 'none'),
                          maxLines: 2,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
