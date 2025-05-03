import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_bord.dart';

class CharacterCardImage extends StatelessWidget {
  const CharacterCardImage(
    this.character, {
    super.key,
    this.size = 80,
    this.differenceSize = 10,
  });

  final Character character;
  final double size;
  final double differenceSize;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.uuid,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: size + differenceSize,
          width: size + differenceSize,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.5),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: size,
                    width: size,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: palette.backgroundLevelTwo,
                      ),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.ghost,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (character.imagePath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Image.file(
                        File(character.imagePath!),
                        height: size,
                        width: size,
                        fit: BoxFit.cover,
                        cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                            context, size),
                        cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                            context, size),
                        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
              if (character.imageAsset != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Image.asset(
                        character.imageAsset!,
                        height: size,
                        width: size,
                        fit: BoxFit.cover,
                        cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                            context, size),
                        cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                            context, size),
                        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
              TokenCardBord(
                size: size + differenceSize,
                isMenace: false,
                withAnimate: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
