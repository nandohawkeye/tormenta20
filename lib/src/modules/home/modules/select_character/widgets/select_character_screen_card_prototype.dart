import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectCharacterScreenCardPrototype extends StatelessWidget {
  const SelectCharacterScreenCardPrototype({super.key});

  @override
  Widget build(BuildContext context) {
    const double imageSize = 54;
    return Card(
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
                  Assets.images.bordaToken.image(
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
                    'Nome',
                    maxLines: 2,
                    style: TextStyle(fontFamily: FontFamily.tormenta),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Guerreiro - Minotauro - Enorme',
                    style:
                        TextStyle(fontSize: 12, color: palette.textSecundary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.shieldHalved,
                          size: 12, color: palette.textSecundary),
                      const SizedBox(width: 4),
                      Text(
                        '12',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12, color: palette.textSecundary),
                      ),
                      T20UI.spaceWidth,
                      Icon(FontAwesomeIcons.solidHeart,
                          size: 12, color: palette.textSecundary),
                      const SizedBox(width: 4),
                      Text(
                        '25',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12, color: palette.textSecundary),
                      ),
                      T20UI.spaceWidth,
                      Icon(FontAwesomeIcons.handSparkles,
                          size: 12, color: palette.textSecundary),
                      const SizedBox(width: 4),
                      Text(
                        '23',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12, color: palette.textSecundary),
                      ),
                      T20UI.spaceWidth,
                      Icon(FontAwesomeIcons.solidEye,
                          size: 12, color: palette.textSecundary),
                      const SizedBox(width: 4),
                      Text(
                        '02',
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12, color: palette.textSecundary),
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
    );
  }
}
