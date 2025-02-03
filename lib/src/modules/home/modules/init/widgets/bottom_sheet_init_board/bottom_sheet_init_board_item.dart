import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class BottomSheetInitBoardItem extends StatelessWidget {
  const BottomSheetInitBoardItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.titleSize = 16,
    this.iconSize = 30,
    this.subtitleSize = 12,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Function() onTap;
  final double titleSize;
  final double iconSize;
  final double subtitleSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: T20UI.borderRadius,
            color: palette.onBottomsheet,
          ),
          child: Padding(
            padding: T20UI.allPadding,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: iconSize,
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: palette.primary,
                          fontFamily: FontFamily.tormenta,
                          fontSize: titleSize,
                        ),
                      ),
                      Text(
                        subtitle,
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: subtitleSize,
                          color: palette.textSecundary,
                        ),
                      )
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
