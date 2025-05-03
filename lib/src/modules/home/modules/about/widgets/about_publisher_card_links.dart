import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_simple_link_button.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';

class AboutPublisherCardLinks extends StatelessWidget {
  const AboutPublisherCardLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.allSmallPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AboutSimpleLinkButton(
            icon: const Icon(FontAwesomeIcons.twitch),
            onTap: () async =>
                await UrlUtils.lauch('https://www.twitch.tv/jamboeditora'),
          ),
          T20UI.smallSpaceWidth,
          AboutSimpleLinkButton(
            icon: const Icon(FontAwesomeIcons.discord),
            onTap: () async =>
                await UrlUtils.lauch('https://discord.gg/9DcyWYXR'),
          ),
          T20UI.smallSpaceWidth,
          AboutSimpleLinkButton(
            icon: FittedBox(
              fit: BoxFit.scaleDown,
              child: Assets.images.instagram.image(
                height: 20,
                width: 20,
                color: palette.icon,
                cacheHeight:
                    PerformanceUtils.cacheImageSizeCalculated(context, 20),
                cacheWidth:
                    PerformanceUtils.cacheImageSizeCalculated(context, 20),
              ),
            ),
            onTap: () async =>
                await UrlUtils.lauch('https://www.instagram.com/jamboeditora/'),
          ),
          T20UI.smallSpaceWidth,
          AboutSimpleLinkButton(
            icon: const Icon(FontAwesomeIcons.facebookF),
            onTap: () async =>
                await UrlUtils.lauch('https://www.facebook.com/jamboeditora'),
          ),
          T20UI.smallSpaceWidth,
          AboutSimpleLinkButton(
            icon: const Icon(FontAwesomeIcons.youtube),
            onTap: () async => await UrlUtils.lauch(
                'https://www.youtube.com/user/jamboeditora'),
          ),
        ],
      ),
    );
  }
}
