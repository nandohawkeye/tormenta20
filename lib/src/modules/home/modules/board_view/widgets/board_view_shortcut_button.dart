// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_utils.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';
import 'package:tormenta20/src/shared/widgets/whatsapp_svg_icon.dart';

class BoardViewShortcutButton extends StatelessWidget {
  const BoardViewShortcutButton({
    super.key,
    this.url,
    required this.type,
  });

  final String? url;
  final BoardShortcutsType type;

  @override
  Widget build(BuildContext context) {
    final isEnable = url != null;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: T20UI.spaceSize / 2),
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
              onTap: !isEnable ? null : () async => await UrlUtils.lauch(url!),
              child: type == BoardShortcutsType.whats
                  ? WhatsappSvgIcon(
                      color: isEnable ? palette.icon : palette.iconDisable,
                    )
                  : Icon(
                      BoardShortcutsUtils.handleIcon(type, url ?? ''),
                      color: isEnable ? palette.icon : palette.iconDisable,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
