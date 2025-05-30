import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';

class BoardViewPlayerCard extends StatelessWidget {
  const BoardViewPlayerCard({
    super.key,
    required this.player,
    required this.onTap,
  });

  final BoardPlayer player;
  final Function(BoardPlayer) onTap;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 54;
    return AnimatedOpacity(
      opacity: player.isAlive ? 1 : 0.2,
      duration: T20UI.defaultDurationAnimation,
      child: Card(
        color: palette.cardBackground,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () => onTap(player),
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
                      if (player.imagePath != null)
                        ClipOval(
                          child: Image.file(
                            File(player.imagePath!),
                            height: imageSize,
                            width: imageSize,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const SizedBox.shrink(),
                          ),
                        ),
                      if (player.imageAsset != null)
                        ClipOval(
                          child: Image.asset(
                            player.imageAsset!,
                            height: imageSize,
                            width: imageSize,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Assets.images.bordaToken.image(
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
                        '${player.playerName} - ${player.characterName}',
                        maxLines: 2,
                        style: const TextStyle(fontFamily: FontFamily.tormenta),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${CharacterUtils.handleBroodTitle(player.brood.name)} - ${CharacterUtils.handleAllClassesTypeTitle(player.classes)}',
                        maxLines: 2,
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
                            player.defense.toString().padLeft(2, '0'),
                            maxLines: 2,
                            style: const TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          const Icon(FontAwesomeIcons.solidHeart, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            player.life.toString().padLeft(2, '0'),
                            maxLines: 2,
                            style: const TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          const Icon(FontAwesomeIcons.handSparkles, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            player.mana.toString().padLeft(2, '0'),
                            maxLines: 2,
                            style: const TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          const Icon(FontAwesomeIcons.personRunning, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            player.initiative.toString().padLeft(2, '0'),
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
      ),
    );
  }
}
