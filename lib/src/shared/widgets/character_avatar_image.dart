import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class CharacterAvatarImage extends StatelessWidget {
  const CharacterAvatarImage({
    super.key,
    required this.character,
    required this.imageSize,
    required this.imagePadding,
  });

  final CharacterBoard character;
  final double imageSize;
  final double imagePadding;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.uuid,
      child: SizedBox(
        height: imageSize + imagePadding,
        width: imageSize + imagePadding,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Icon(FontAwesomeIcons.solidUser, color: palette.disable),
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
                  cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
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
              height: imageSize + imagePadding,
              width: imageSize + imagePadding,
              fit: BoxFit.cover,
              cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                context,
                imageSize + imagePadding,
              ),
              cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                context,
                imageSize + imagePadding,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
