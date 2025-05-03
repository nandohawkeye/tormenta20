import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/utils/character_alignment_type_utils.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class BoardViewCharacterDeathCharacterCard extends StatelessWidget {
  const BoardViewCharacterDeathCharacterCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  final CharacterBoard character;
  final Function(CharacterBoard) onTap;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 54;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DividerLevelTwo(verticalPadding: 0),
        AnimatedOpacity(
          opacity: 0.2,
          duration: T20UI.defaultDurationAnimation,
          child: Card(
            color: palette.cardBackground,
            child: InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: () => onTap(character),
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
                          if (character.imagePath != null)
                            ClipOval(
                              child: Image.file(
                                File(character.imagePath!),
                                height: imageSize,
                                width: imageSize,
                                fit: BoxFit.cover,
                                cacheHeight:
                                    PerformanceUtils.cacheImageSizeCalculated(
                                        context, imageSize),
                                cacheWidth:
                                    PerformanceUtils.cacheImageSizeCalculated(
                                        context, imageSize),
                                errorBuilder: (_, __, ___) =>
                                    const SizedBox.shrink(),
                              ),
                            ),
                          if (character.imageAsset != null)
                            ClipOval(
                              child: Image.asset(
                                character.imageAsset!,
                                height: imageSize,
                                width: imageSize,
                                fit: BoxFit.cover,
                                cacheHeight:
                                    PerformanceUtils.cacheImageSizeCalculated(
                                        context, imageSize),
                                cacheWidth:
                                    PerformanceUtils.cacheImageSizeCalculated(
                                        context, imageSize),
                              ),
                            ),
                          Assets.images.bordaToken.image(
                            height: imageSize + 6,
                            width: imageSize + 6,
                            fit: BoxFit.cover,
                            cacheHeight:
                                PerformanceUtils.cacheImageSizeCalculated(
                                    context, imageSize + 6),
                            cacheWidth:
                                PerformanceUtils.cacheImageSizeCalculated(
                                    context, imageSize + 6),
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
                            '${character.name} - ${CharacterUtils.handleBroodTitle(character.brood.name)}',
                            maxLines: 2,
                            style: const TextStyle(
                                fontFamily: FontFamily.tormenta),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.arrowUp, size: 12),
                              const SizedBox(width: 2),
                              Text(
                                1.toString().padLeft(2, '0'),
                                maxLines: 2,
                                style: const TextStyle(fontSize: 12),
                              ),
                              T20UI.spaceWidth,
                              const Icon(FontAwesomeIcons.shieldHalved,
                                  size: 12),
                              const SizedBox(width: 4),
                              Text(
                                character.defense.toString().padLeft(2, '0'),
                                maxLines: 2,
                                style: const TextStyle(fontSize: 12),
                              ),
                              T20UI.spaceWidth,
                              const Icon(FontAwesomeIcons.solidHeart, size: 12),
                              const SizedBox(width: 4),
                              Text(
                                character.life.toString().padLeft(2, '0'),
                                maxLines: 2,
                                style: const TextStyle(fontSize: 12),
                              ),
                              T20UI.spaceWidth,
                              const Icon(FontAwesomeIcons.handSparkles,
                                  size: 12),
                              const SizedBox(width: 4),
                              Text(
                                character.mana.toString().padLeft(2, '0'),
                                maxLines: 2,
                                style: const TextStyle(fontSize: 12),
                              ),
                              if (character.perception != null)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    T20UI.spaceWidth,
                                    const Icon(
                                      FontAwesomeIcons.solidEye,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      character.perception
                                          .toString()
                                          .padLeft(2, '0'),
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                CharacterAlignmentTypeUtils.handleIcon(
                                    character.alignmentType.name),
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                CharacterAlignmentTypeUtils.handleTitle(
                                    character.alignmentType.name),
                                maxLines: 2,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              )
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
        ),
      ],
    );
  }
}
