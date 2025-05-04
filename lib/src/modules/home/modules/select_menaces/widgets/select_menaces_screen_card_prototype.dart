import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/utils/treasure_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectMenacesScreenCardPrototype extends StatelessWidget {
  const SelectMenacesScreenCardPrototype({super.key});

  @override
  Widget build(BuildContext context) {
    const double imageSize = 54;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: palette.cardBackground,
          child: Padding(
            padding: T20UI.allSmallPadding,
            child: Row(
              children: [
                SizedBox(
                  height: imageSize + 2,
                  width: imageSize + 2,
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
                      Assets.images.bordaTokenAmeaca.image(
                        height: imageSize + 2,
                        width: imageSize + 2,
                        fit: BoxFit.cover,
                        cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                            context, imageSize + 2),
                        cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                            context, imageSize + 2),
                      ),
                    ],
                  ),
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Agellus - ND 1/4',
                        maxLines: 1,
                        style: TextStyle(fontFamily: FontFamily.tormenta),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Especial - Constructo - Enorme',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(FontAwesomeIcons.shieldHalved, size: 12),
                          const SizedBox(width: 4),
                          const Text(
                            '12',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          const Icon(FontAwesomeIcons.solidHeart, size: 12),
                          const SizedBox(width: 4),
                          const Text(
                            '20',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          const Icon(FontAwesomeIcons.handSparkles, size: 12),
                          const SizedBox(width: 4),
                          const Text(
                            '20',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          const Icon(FontAwesomeIcons.personRunning, size: 12),
                          const SizedBox(width: 2),
                          const Text(
                            '24',
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                          T20UI.spaceWidth,
                          const Icon(FontAwesomeIcons.solidGem, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            TreasureTypeUtils.handleMenaceTitle('none'),
                            maxLines: 2,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const CustomChecked(
                  value: true,
                  isEnabledToTap: false,
                ),
                T20UI.smallSpaceWidth,
              ],
            ),
          ),
        ),
        T20UI.smallSpaceHeight,
      ],
    );
  }
}
