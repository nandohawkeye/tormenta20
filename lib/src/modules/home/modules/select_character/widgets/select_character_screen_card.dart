import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectCharacterScreenCard extends StatelessWidget {
  const SelectCharacterScreenCard({
    super.key,
    required this.character,
    required this.onTap,
    required this.selected,
  });

  final Character character;
  final Character? selected;
  final Function(Character) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = selected?.uuid == character.uuid;
    const double imageSize = 54;
    return Card(
      color: palette.cardBackground,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(character),
        child: Padding(
          padding: T20UI.allSmallPadding,
          child: Row(
            children: [
              SizedBox(
                height: imageSize + 2,
                width: imageSize + 2,
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
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
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
                                context,
                                imageSize,
                              ),
                          cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                            context,
                            imageSize,
                          ),
                        ),
                      ),
                    Assets.images.bordaToken.image(
                      height: imageSize + 2,
                      width: imageSize + 2,
                      fit: BoxFit.cover,
                      cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                        context,
                        imageSize + 2,
                      ),
                      cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                        context,
                        imageSize + 2,
                      ),
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
                      character.name,
                      maxLines: 2,
                      style: const TextStyle(fontFamily: FontFamily.tormenta),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${CharacterUtils.handleClasseTypeTitle(character.classe?.type.name ?? '')} - ${CharacterUtils.handleBroodTitle(character.brood.name)} - ${CreatureSizeUtils.handleTitle(character.creatureSize.name)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: palette.textSecundary,
                      ),
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
                          character.defense.toString().padLeft(2, '0'),
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: palette.textSecundary,
                          ),
                        ),
                        T20UI.spaceWidth,
                        Icon(
                          FontAwesomeIcons.solidHeart,
                          size: 12,
                          color: palette.textSecundary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          character.life.toString().padLeft(2, '0'),
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: palette.textSecundary,
                          ),
                        ),
                        T20UI.spaceWidth,
                        Icon(
                          FontAwesomeIcons.handSparkles,
                          size: 12,
                          color: palette.textSecundary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          character.mana.toString().padLeft(2, '0'),
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            color: palette.textSecundary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomChecked(value: isSelected, isEnabledToTap: false),
              T20UI.smallSpaceWidth,
            ],
          ),
        ),
      ),
    );
  }
}
