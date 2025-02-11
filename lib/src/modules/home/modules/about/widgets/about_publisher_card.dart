import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_publisher_card_links.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class AboutPublisherCard extends StatelessWidget {
  const AboutPublisherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: T20UI.spaceSize - 4),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: () async =>
                  await UrlUtils.lauch('https://jamboeditora.com.br'),
              child: Padding(
                padding: const EdgeInsets.all(T20UI.spaceSize / 2),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipOval(
                            child: Assets.images.jambo.image(
                              height: 75,
                              width: 75,
                            ),
                          ),
                          Assets.images.bordaToken.image(
                            height: 80,
                            width: 80,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: T20UI.spaceSize / 2),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Editora Jambô',
                            style: TextStyle(
                              color: palette.accent,
                              fontFamily: FontFamily.tormenta,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Conheça mais sobre a editora Jambô clicando aqui e conhecendo suas redes sociais abaixo',
                            maxLines: 10,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const DividerLevelTwo(verticalPadding: 0),
            const AboutPublisherCardLinks(),
          ],
        ),
      ),
    );
  }
}
