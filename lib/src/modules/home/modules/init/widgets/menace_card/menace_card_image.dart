import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_bord.dart';

class MenaceCardImage extends StatelessWidget {
  const MenaceCardImage(this.menace, {super.key, this.size = 80});

  final Menace menace;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: menace.uuid,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: size + 10,
          width: size + 10,
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
              if (menace.imagePath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Image.file(
                        File(menace.imagePath!),
                        height: size,
                        width: size,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
              if (menace.imageAsset != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Image.asset(
                        menace.imageAsset!,
                        height: size,
                        width: size,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
              TokenCardBord(
                size: size + 10,
                isMenace: true,
                withAnimate: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
