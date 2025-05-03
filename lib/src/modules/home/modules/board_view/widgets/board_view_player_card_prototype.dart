import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class BoardViewPlayerCardPrototype extends StatelessWidget {
  const BoardViewPlayerCardPrototype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 54;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DividerLevelTwo(verticalPadding: 0),
        Card(
          color: palette.cardBackground,
          child: Padding(
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
                      Assets.images.bordaToken.image(
                        height: imageSize + 6,
                        width: imageSize + 6,
                        fit: BoxFit.cover,
                        cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                            context, imageSize + 6),
                        cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                            context, imageSize + 6),
                      ),
                    ],
                  ),
                ),
                T20UI.spaceWidth,
                const Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome - Personagem',
                        maxLines: 2,
                        style: TextStyle(fontFamily: FontFamily.tormenta),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Minotauro - Guerreiro',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.shieldHalved, size: 12),
                          SizedBox(width: 4),
                          Text(
                            '12',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          Icon(FontAwesomeIcons.solidHeart, size: 12),
                          SizedBox(width: 4),
                          Text(
                            '20',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          Icon(FontAwesomeIcons.handSparkles, size: 12),
                          SizedBox(width: 4),
                          Text(
                            '20',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          Icon(FontAwesomeIcons.personRunning, size: 12),
                          SizedBox(width: 2),
                          Text(
                            '01',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
