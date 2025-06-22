import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class BoardViewCharacterFieldDeathCharacterAvatar extends StatelessWidget {
  const BoardViewCharacterFieldDeathCharacterAvatar({
    super.key,
    required this.onTap,
    required this.character,
  });

  final CharacterBoard character;
  final Function(CharacterBoard) onTap;

  @override
  Widget build(BuildContext context) {
    const double imageSize = 40;
    return Padding(
      padding: const EdgeInsets.only(right: T20UI.smallSpaceSize),
      child: Opacity(
        opacity: .3,
        child: InkWell(
          borderRadius: BorderRadius.circular(200),
          onTap: () => onTap(character),
          child: SizedBox(
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
                  height: imageSize + 6,
                  width: imageSize + 6,
                  fit: BoxFit.cover,
                  cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                    context,
                    imageSize + 6,
                  ),
                  cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                    context,
                    imageSize + 6,
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
