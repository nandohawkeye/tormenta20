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
  const BoardViewLinksCard(
    this.link, {
    super.key,
    required this.onSelected,
    required this.onDelete,
  });

  final BoardLink link;
  final Function(BoardLink) onSelected;
  final Function(BoardLink) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
      child: Card(
        color: palette.backgroundLevelOne,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () async => await UrlUtils.lauch(link.link),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              T20UI.smallSpaceHeight,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: T20UI.smallSpaceSize + 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            link.title,
                            style: const TextStyle(
                              fontFamily: FontFamily.tormenta,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            link.link,
                            style: TextStyle(
                              color: palette.accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: T20UI.allSmallPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: SimpleButton(
                        icon: FontAwesomeIcons.solidTrashCan,
                        backgroundColor: palette.backgroundLevelTwo,
                        iconColor: palette.indicator,
                        onTap: () => onDelete(link),
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: SimpleButton(
                        icon: FontAwesomeIcons.solidPenToSquare,
                        backgroundColor: palette.backgroundLevelTwo,
                        iconColor: palette.indicator,
                        onTap: () => onSelected(link),
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: SimpleButton(
                        icon: FontAwesomeIcons.shareNodes,
                        backgroundColor: palette.backgroundLevelTwo,
                        iconColor: palette.indicator,
                        onTap: () =>
                            Share.share('*${link.title}* \n ${link.link}'),
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: SimpleButton(
                        icon: FontAwesomeIcons.link,
                        backgroundColor: palette.backgroundLevelTwo,
                        iconColor: palette.indicator,
                        onTap: () async => await UrlUtils.lauch(link.link),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
