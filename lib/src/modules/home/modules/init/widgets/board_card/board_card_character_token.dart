import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class BoardCardCharacterToken extends StatelessWidget {
  const BoardCardCharacterToken({
    super.key,
    required this.character,
    required this.width,
  });

  final CharacterBoard? character;
  final double width;

  @override
  Widget build(BuildContext context) {
    final minusSize = (38 * context.realTextScale);
    final defaultSize = (40 * context.realTextScale);

    if (character == null) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 8, left: 4, right: 4),
        child: Text(
          'Adicione um personagem para começar a jogar nesta mesa',
          maxLines: 2,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.only(bottom: T20UI.smallSpaceSize),
            child: SizedBox(
              height: (40 * context.realTextScale),
              child: SizedBox(
                height: defaultSize,
                width: defaultSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: defaultSize,
                      width: defaultSize,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.backgroundLevelTwo,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 1, bottom: 2),
                          child: Icon(
                            FontAwesomeIcons.solidUser,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                    if (character?.imagePath != null)
                      ClipOval(
                        child: Image.file(
                          File(character!.imagePath!),
                          height: minusSize,
                          width: minusSize,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                        ),
                      ),
                    if (character?.imageAsset != null)
                      Image.asset(
                        character!.imageAsset!,
                        height: minusSize,
                        width: minusSize,
                        fit: BoxFit.cover,
                      ),
                    Assets.images.bordaToken.image(
                      height: defaultSize,
                      width: defaultSize,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        T20UI.smallSpaceWidth,
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${character?.name}'),
            const SizedBox(height: 2),
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
                const Icon(FontAwesomeIcons.shieldHalved, size: 12),
                const SizedBox(width: 4),
                Text(
                  character!.defense.toString().padLeft(2, '0'),
                  maxLines: 2,
                  style: const TextStyle(fontSize: 12),
                ),
                T20UI.spaceWidth,
                const Icon(FontAwesomeIcons.solidHeart, size: 12),
                const SizedBox(width: 4),
                Text(
                  character!.currentLife.toString().padLeft(2, '0'),
                  maxLines: 2,
                  style: const TextStyle(fontSize: 12),
                ),
                T20UI.spaceWidth,
                const Icon(FontAwesomeIcons.handSparkles, size: 12),
                const SizedBox(width: 4),
                Text(
                  character!.currentMana.toString().padLeft(2, '0'),
                  maxLines: 2,
                  style: const TextStyle(fontSize: 12),
                ),
                T20UI.spaceWidth,
                if (character?.perception != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(FontAwesomeIcons.solidEye, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        character!.perception.toString().padLeft(2, '0'),
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )
              ],
            ),
            const SizedBox(height: 6),
          ],
        )
      ],
    );
  }
}
