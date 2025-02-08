import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';

class BoardViewLinksBottomsheetItem extends StatelessWidget {
  const BoardViewLinksBottomsheetItem(this.site, {super.key});

  final BoardLink site;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: T20UI.spaceSize),
      child: Card(
        color: palette.backgroundLevelTwo,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () => Navigator.pop(context, site.link),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
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
                          color: palette.selected,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
