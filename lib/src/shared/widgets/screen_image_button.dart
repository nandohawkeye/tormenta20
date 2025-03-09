import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class ScreenImageButton extends StatelessWidget {
  const ScreenImageButton({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.imageSize = 60,
    this.titleSize = 18,
    this.subtitleSize = 14,
    this.hasBorder = false,
    this.background,
    this.borderRadius,
  });

  final String imageAsset;
  final String title;
  final String subtitle;
  final Function() onTap;
  final double imageSize;
  final double titleSize;
  final double subtitleSize;
  final bool hasBorder;
  final Color? background;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: background ?? palette.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? T20UI.borderRadius,
        side: hasBorder
            ? BorderSide(
                color: palette.primary.withValues(alpha: .4),
                width: 2,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        borderRadius: borderRadius ?? T20UI.borderRadius,
        onTap: onTap,
        child: Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              Image.asset(
                height: imageSize,
                width: imageSize,
                imageAsset,
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
                        color: palette.accent,
                        fontFamily: FontFamily.tormenta,
                        fontSize: titleSize,
                      ),
                    ),
                    const SizedBox(height: 6),
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
    );
  }
}
