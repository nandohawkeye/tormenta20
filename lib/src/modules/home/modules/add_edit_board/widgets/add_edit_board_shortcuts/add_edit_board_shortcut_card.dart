import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_utils.dart';
import 'package:tormenta20/src/shared/widgets/whatsapp_svg_icon.dart';

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
                type == BoardShortcutsType.whats
                    ? Padding(
                        padding: const EdgeInsets.only(right: 12, left: 6),
                        child: WhatsappSvgIcon(
                          size: 30,
                          color: palette.selected,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: T20UI.spaceSize),
                        child: Icon(
                          BoardShortcutsUtils.handleIcon(type, url),
                          size: 32,
                          color: palette.selected,
                        ),
                      ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        BoardShortcutsUtils.handleLabel(type),
                        style: TextStyle(
                          fontFamily: FontFamily.tormenta,
                          color: palette.selected,
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
                  backgroundColor: palette.selected,
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
