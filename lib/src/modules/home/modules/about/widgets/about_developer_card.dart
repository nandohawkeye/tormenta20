import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_developer_card_links.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_suggest_card.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/coffee_bottomsheet/coffee_bottomsheet.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

class AboutDeveloperCard extends StatelessWidget {
  const AboutDeveloperCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: T20UI.screenContentSpaceSize),
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: () async {
                await BottomsheetUtils.show(
                  context: context,
                  child: const CoffeeBottomsheet(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(T20UI.smallSpaceSize),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipOval(
                            child: Assets.images.developer.image(
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
                    const SizedBox(width: T20UI.smallSpaceSize),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Olá meu nome é Nando!',
                            style: TextStyle(
                              color: palette.accent,
                              fontFamily: FontFamily.tormenta,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Contribua com esse projeto me pagando um cafezinho clicando aqui, e conheça  também minhas redes sociais abaixo.',
                            maxLines: 10,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const AboutDeveloperCardLinks(),
            T20UI.smallSpaceHeight,
            const AboutSuggestCard(),
            T20UI.smallSpaceHeight,
          ],
        ),
      ),
    );
  }
}
