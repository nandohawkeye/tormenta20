import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class MagicBottomsheetItem extends StatelessWidget {
  const MagicBottomsheetItem({
    super.key,
    required this.preffix,
    required this.text,
    required this.icon,
  });

  final String preffix;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: T20UI.borderRadius,
          color: palette.onBottomsheet.withOpacity(.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                icon,
                color: palette.primaryCTA,
                size: 14,
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text.rich(
                TextSpan(
                  text: preffix,
                  style: TextStyle(
                    color: palette.primaryCTA,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: text,
                      style: TextStyle(color: palette.textPrimary),
                    )
                  ],
                ),
                maxLines: 2000000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
