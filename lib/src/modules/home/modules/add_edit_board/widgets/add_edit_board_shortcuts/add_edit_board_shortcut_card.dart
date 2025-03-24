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
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
              child: Row(
                children: [
                  type == BoardShortcutsType.whats
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12, left: 6),
                          child: WhatsappSvgIcon(
                            size: 30,
                            color: palette.icon,
                          ),
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(right: T20UI.spaceSize),
                          child: Icon(
                            BoardShortcutsUtils.handleIcon(type, url),
                            size: 30,
                            color: palette.icon,
                          ),
                        ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          BoardShortcutsUtils.handleLabel(type),
                          style: const TextStyle(
                              fontFamily: FontFamily.tormenta, fontSize: 18),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          url,
                          style: TextStyle(
                            color: palette.textDisable,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SimpleButton(
                    icon: FontAwesomeIcons.solidPenToSquare,
                    backgroundColor: palette.backgroundLevelOne,
                    iconColor: palette.selected,
                    onTap: onTap,
                    iconSize: 18,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
