import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view_links/board_view_links_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BoardViewLinks extends StatelessWidget {
  const BoardViewLinks({super.key, required this.links});

  final List<BoardLink> links;

  @override
  Widget build(BuildContext context) {
    links.sort((a, b) => a.title.compareTo(b.title));
    return Scaffold(
      floatingActionButton: SimpleCloseButton(
        backgroundColor: palette.backgroundLevelTwo,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: Labels('Sites'),
              ),
              T20UI.spaceHeight,
            ],
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: T20UI.spaceSize - 4,
                right: T20UI.spaceSize - 4,
                bottom: T20UI.spaceSize + MediaQuery.of(context).padding.bottom,
                top: T20UI.spaceSize,
              ),
              child: Column(
                children: [
                  ...links.map(BoardViewLinksCard.new),
                  T20UI.safeAreaBottom(context, additionalHeight: 40)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
