import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_simple_link_button.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/coffee_bottomsheet/coffee_bottomsheet.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';

class AboutDeveloperCardLinks extends StatelessWidget {
  const AboutDeveloperCardLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.allPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AboutSimpleLinkButton(
            icon: const Icon(FontAwesomeIcons.googlePlay),
            onTap: () async => await UrlUtils.lauch(
                'https://play.google.com/store/apps/dev?id=7093741402026746463'),
          ),
          AboutSimpleLinkButton(
            icon: const Icon(FontAwesomeIcons.linkedinIn),
            onTap: () async => await UrlUtils.lauch(
                'https://www.linkedin.com/in/luizfernando-de-m-neves'),
          ),
          AboutSimpleLinkButton(
            icon: FittedBox(
              fit: BoxFit.scaleDown,
              child: Assets.images.instagram.image(
                height: 20,
                width: 20,
                color: palette.icon,
              ),
            ),
            onTap: () async => await UrlUtils.lauch(
                'https://www.instagram.com/nando_magalhaes_'),
          ),
          AboutSimpleLinkButton(
            icon: const Icon(FontAwesomeIcons.github),
            onTap: () async =>
                await UrlUtils.lauch('https://github.com/nandohawkeye'),
          ),
          AboutSimpleLinkButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 4),
              child: Icon(FontAwesomeIcons.mugHot),
            ),
            onTap: () async {
              await BottomsheetUtils.show(
                context: context,
                child: const CoffeeBottomsheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
