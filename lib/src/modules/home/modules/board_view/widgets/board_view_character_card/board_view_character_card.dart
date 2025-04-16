import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_atributes_field.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_character_card/board_view_character_field_death_character_avatar.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/utils/character_alignment_type_utils.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';

class BoardViewCharacterCard extends StatelessWidget {
  const BoardViewCharacterCard({
    super.key,
    required this.character,
    required this.onTap,
    required this.otherCharacters,
  });

  final CharacterBoard character;
  final List<CharacterBoard> otherCharacters;
  final Function(CharacterBoard) onTap;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 64;
    return AnimatedOpacity(
      opacity: character.isAlive ? 1 : 0.2,
      duration: T20UI.defaultDurationAnimation,
      child: Card(
        color: palette.cardBackground,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () => onTap(character),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                            '${character.name} ',
                            maxLines: 2,
                            style: const TextStyle(
                              fontFamily: FontFamily.tormenta,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${CharacterUtils.handleBroodTitle(character.brood.name)} - ${CreatureSizeUtils.handleTitle(character.creatureSize.name)}',
                            style: TextStyle(
                                color: palette.textSecundary, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.shieldHalved,
                                  color: palette.textSecundary, size: 12),
                              const SizedBox(width: 4),
                              Text(
                                character.defense.toString().padLeft(2, '0'),
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: palette.textSecundary,
                                ),
                              ),
                              T20UI.smallSpaceWidth,
                              Icon(
                                FontAwesomeIcons.personRays,
                                size: 12,
                                color: palette.textSecundary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                character.perception.toString().padLeft(2, '0'),
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: palette.textSecundary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              T20UI.smallSpaceWidth,
                              Icon(
                                CharacterAlignmentTypeUtils.handleIcon(
                                    character.alignmentType.name),
                                size: 12,
                                color: palette.textSecundary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                CharacterAlignmentTypeUtils.handleTitle(
                                    character.alignmentType.name),
                                maxLines: 2,
                                style: TextStyle(
                                    color: palette.textSecundary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: T20UI.horizontalPadding,
                child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.solidHeart, size: 16),
                    const SizedBox(width: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${character.currentLife.toString().padLeft(2, '0')} / ',
                            style: const TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: character.life.toString().padLeft(2, '0'),
                            style: TextStyle(
                              fontSize: 14,
                              color: palette.textDisable,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: T20UI.horizontalPadding,
                child: LinearProgressIndicator(
                  value:
                      (((character.currentLife * 100) / character.life) / 100),
                  backgroundColor: Colors.green.withValues(alpha: .2),
                  color: Colors.green,
                  minHeight: 4,
                  borderRadius: T20UI.borderRadius,
                  stopIndicatorRadius: T20UI.inputBorderRadius,
                ),
              ),
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.handSparkles, size: 16),
                    const SizedBox(width: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${character.currentMana.toString().padLeft(2, '0')} / ',
                            style: const TextStyle(fontSize: 16),
                          ),
                          TextSpan(
                            text: character.mana.toString().padLeft(2, '0'),
                            style: TextStyle(
                              fontSize: 14,
                              color: palette.textDisable,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: T20UI.horizontalPadding,
                child: LinearProgressIndicator(
                  value:
                      (((character.currentMana * 100) / character.mana) / 100),
                  backgroundColor: Colors.blue.withValues(alpha: .2),
                  color: Colors.blue,
                  minHeight: 4,
                  borderRadius: T20UI.borderRadius,
                  stopIndicatorRadius: T20UI.inputBorderRadius,
                ),
              ),
              Padding(
                padding: T20UI.allPadding,
                child: BoardViewCharacterAtributesField(character),
              ),
              if (otherCharacters.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    bottom: T20UI.smallSpaceSize,
                    left: T20UI.spaceSize,
                  ),
                  child: Row(
                    children: otherCharacters
                        .map(BoardViewCharacterFieldDeathCharacterAvatar.new)
                        .toList(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
