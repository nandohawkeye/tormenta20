import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_utils.dart';

class AddEditBoardShortcutCard extends StatelessWidget {
  const AddEditBoardShortcutCard({
    super.key,
    required this.url,
    required this.type,
    required this.onTap,
  });

  final String url;
  final BoardShortcutsType type;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding.copyWith(
        bottom: T20UI.spaceSize,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: palette.cardBackground,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  BoardShortcutsUtils.handleIcon(type, url),
                  size: 32,
                  color: palette.accent.withOpacity(.6),
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        BoardShortcutsUtils.handleLabel(type),
                        style: TextStyle(
                          fontFamily: FontFamily.tormenta,
                          color: palette.accent.withOpacity(.6),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        url,
                        style: TextStyle(
                          color: palette.textDisable,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SimpleButton(
                  icon: FontAwesomeIcons.penToSquare,
                  backgroundColor: palette.accent.withOpacity(.6),
                  iconColor: palette.indicator.withOpacity(.6),
                  onTap: onTap,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
