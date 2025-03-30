import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view_links/board_view_links_screen.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

class BoardViewLinksButton extends StatelessWidget {
  const BoardViewLinksButton({super.key, required this.board});

  final Board board;

  @override
  Widget build(BuildContext context) {
    void openLinks() async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BoardViewLinks(boardUuid: board.uuid),
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: T20UI.smallSpaceSize),
        child: SizedBox(
          height: T20UI.inputHeight,
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: T20UI.borderRadius,
              side: BorderSide(
                color: palette.backgroundLevelOne,
                width: 2,
              ),
            ),
            child: InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: openLinks,
              child: const Icon(FontAwesomeIcons.link),
            ),
          ),
        ),
      ),
    );
  }
}
