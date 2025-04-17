import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/character_card/character_card_image.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  final Character character;
  final Function(Character) onTap;

  @override
  Widget build(BuildContext context) {
    final inBoards = character.characterBoards;
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(character),
        child: Padding(
          padding: T20UI.allSmallPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CharacterCardImage(character),
              T20UI.smallSpaceWidth,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: TextStyle(
                      color: palette.accent,
                      fontFamily: FontFamily.tormenta,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                      'Em ${inBoards.isEmpty ? 'nenhuma mesa' : inBoards.length == 1 ? 'uma mesa' : '${inBoards.length.toString().padLeft(2, '0')} mesas'}'),
                  const SizedBox(height: 4),
                  Text(
                    '${CharacterUtils.handleClasseTypeTitle(character.classe?.type.name ?? '')} - ${CharacterUtils.handleBroodTitle(character.brood.name)} - ${CreatureSizeUtils.handleTitle(character.creatureSize.name)}',
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
                        character.defense.toString().padLeft(2, '0'),
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
                        character.life.toString().padLeft(2, '0'),
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
                        character.mana.toString().padLeft(2, '0'),
                        maxLines: 2,
                        style: TextStyle(
                            color: palette.textSecundary, fontSize: 12),
                      ),
                      if (character.perception != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            T20UI.spaceWidth,
                            Icon(
                              FontAwesomeIcons.solidEye,
                              size: 12,
                              color: palette.textSecundary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              character.perception.toString().padLeft(2, '0'),
                              maxLines: 2,
                              style: TextStyle(
                                  color: palette.textSecundary, fontSize: 12),
                            ),
                          ],
                        )
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
