import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board_player.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class BoardCardPlayerImage extends StatelessWidget {
  const BoardCardPlayerImage({
    super.key,
    required this.index,
    required this.player,
    required this.defaultSize,
    required this.minusSize,
  });

  final int index;
  final BoardPlayer player;
  final double defaultSize;
  final double minusSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: index * 35,
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
            if (player.imagePath != null)
              ClipOval(
                child: Image.file(
                  File(player.imagePath!),
                  height: minusSize,
                  width: minusSize,
                  fit: BoxFit.cover,
                  cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                      context, minusSize),
                  cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                      context, minusSize),
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            if (player.imageAsset != null)
              Image.asset(
                player.imageAsset!,
                height: minusSize,
                width: minusSize,
                fit: BoxFit.cover,
                cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                    context, minusSize),
                cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                    context, minusSize),
              ),
            Assets.images.bordaToken.image(
              height: defaultSize,
              width: defaultSize,
              cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                  context, defaultSize),
              cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                  context, defaultSize),
            )
          ],
        ),
      ),
    );
  }
}
