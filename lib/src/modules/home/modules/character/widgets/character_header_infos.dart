import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/utils/character_alignment_type_utils.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';

class CharacterHeaderInfos extends StatelessWidget {
  const CharacterHeaderInfos(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          '${CharacterUtils.handleAllClassesTypeTitle(character.classe != null ? [
              character.classe!.type
            ] : [])} - ${CharacterUtils.handleBroodTitle(character.brood.name)} - ${CreatureSizeUtils.handleTitle(character.creatureSize.name)}',
          style: TextStyle(
              color: palette.textSecundary, fontWeight: FontWeight.w500),
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
              character.defense.toString().padLeft(2, '0'),
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
              character.life.toString().padLeft(2, '0'),
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
              character.mana.toString().padLeft(2, '0'),
              maxLines: 2,
              style: TextStyle(
                  color: palette.textSecundary, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        if (character.senses?.isNotEmpty ?? false)
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
                  character.senses ?? '',
                  maxLines: 2,
                  style: TextStyle(
                      color: palette.textSecundary,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Icon(
                CharacterAlignmentTypeUtils.handleIcon(
                    character.alignmentType.name),
                size: 14,
                color: palette.textSecundary,
              ),
              const SizedBox(width: 4),
              Text(
                CharacterAlignmentTypeUtils.handleTitle(
                    character.alignmentType.name),
                maxLines: 2,
                style: TextStyle(
                    color: palette.textSecundary, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            if (character.displacement?.isNotEmpty ?? false)
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.personWalking,
                    size: 14,
                    color: palette.textSecundary,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    character.displacement ?? '',
                    maxLines: 2,
                    style: TextStyle(
                        color: palette.textSecundary,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
          ],
        ),
      ],
    );
  }
}
