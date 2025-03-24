import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/options_bottomsheet_base/options_bottomsheet_entity.dart';

class OptionsBottomsheetCard<TOutput> extends StatelessWidget {
  const OptionsBottomsheetCard({
    super.key,
    this.titleSize = 18,
    this.iconSize = 30,
    this.subtitleSize = 14,
    required this.item,
  });

  final OptionsBottomsheetEntity<TOutput> item;
  final double titleSize;
  final double iconSize;
  final double subtitleSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => Navigator.pop(context, item.type),
        child: Padding(
          padding: T20UI.allSmallPadding,
          child: Row(
            children: [
              T20UI.smallSpaceWidth,
              Icon(
                item.icon,
                size: iconSize,
                color: palette.iconDisable,
              ),
              T20UI.spaceWidth,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.label,
                      style: TextStyle(
                        color: palette.accent,
                        fontFamily: FontFamily.tormenta,
                        fontSize: titleSize,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.mensage,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: subtitleSize,
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
