import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class BoardCardPlayersRestCount extends StatelessWidget {
  const BoardCardPlayersRestCount({
    super.key,
    required this.index,
    required this.defaultSize,
    required this.minusSize,
    required this.allLength,
    required this.sublistLength,
  });

  final int index;
  final double defaultSize;
  final double minusSize;
  final int allLength;
  final int sublistLength;

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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 1, right: 2),
                  child: Center(
                      child: Text(
                    '+${allLength - sublistLength}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
              ),
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
