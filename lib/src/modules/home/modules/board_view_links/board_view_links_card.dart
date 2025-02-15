import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';

class BoardViewLinksCard extends StatelessWidget {
  const BoardViewLinksCard(this.site, {super.key});

  final BoardLink site;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
      child: Card(
        color: palette.backgroundLevelOne,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () async => await UrlUtils.lauch(site.link),
          child: Padding(
            padding: T20UI.allPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        site.title,
                        style: const TextStyle(
                          fontFamily: FontFamily.tormenta,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        site.link,
                        style: TextStyle(
                          color: palette.textDisable,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SimpleButton(
                  icon: FontAwesomeIcons.shareNodes,
                  backgroundColor: palette.selected,
                  iconColor: palette.indicator,
                  onTap: () => Share.share('*${site.title}* \n ${site.link}'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
