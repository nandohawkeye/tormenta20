import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class MagicBottomsheetDesc extends StatelessWidget {
  const MagicBottomsheetDesc(this.desc, {super.key});

  final String desc;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: T20UI.borderRadius,
          color: palette.onBottomsheet.withOpacity(.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    FontAwesomeIcons.scroll,
                    color: palette.primaryCTA,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'Descrição:',
                    style: TextStyle(
                      color: palette.primaryCTA,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              desc,
              maxLines: 2000000,
              style: TextStyle(
                color: palette.textPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
