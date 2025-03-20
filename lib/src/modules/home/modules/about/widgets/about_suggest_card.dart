import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';

class AboutSuggestCard extends StatelessWidget {
  const AboutSuggestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: T20UI.spaceSize),
      child: Card(
        color: palette.selected,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () async {
            await UrlUtils.lauch('https://forms.gle/LipFNrWc7Hv3oqZN6');
          },
          child: const Padding(
            padding: T20UI.allSmallPadding,
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.solidLightbulb,
                  size: 24,
                ),
                T20UI.smallSpaceWidth,
                Flexible(
                  child: Text(
                    'Para sugestões, criticas e idéias, por favor aperte aqui!',
                    maxLines: 10,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
