import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_links/bottom_sheet_add_edit_board_links.dart';

class BottomSheetAddEditFieldItem extends StatelessWidget {
  const BottomSheetAddEditFieldItem({super.key, required this.type});

  final BoardOptionsAcces type;

  @override
  Widget build(BuildContext context) {
    IconData handleIcon(BoardOptionsAcces type) {
      if (type == BoardOptionsAcces.whats) {
        return FontAwesomeIcons.whatsapp;
      } else if (type == BoardOptionsAcces.discord) {
        return FontAwesomeIcons.discord;
      } else if (type == BoardOptionsAcces.telegran) {
        return FontAwesomeIcons.solidPaperPlane;
      } else {
        return FontAwesomeIcons.googleDrive;
      }
    }

    String handleLabel(BoardOptionsAcces type) {
      if (type == BoardOptionsAcces.whats) {
        return 'Grupo do WhatsApp';
      } else if (type == BoardOptionsAcces.discord) {
        return 'Servidor do Discord';
      } else if (type == BoardOptionsAcces.telegran) {
        return 'Grupo do Telegram';
      } else {
        return 'Pasta de arquivos online';
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            children: [
              Icon(
                handleIcon(type),
                color: palette.accent.withOpacity(.8),
              ),
              T20UI.spaceWidth,
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    // name.value = value;
                    // errorName.value = validator(value);
                  },
                  // initialValue: name.value,
                  // validator: validator,
                  style: const TextStyle(fontSize: 16),

                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    labelText: handleLabel(type),
                    // errorText: error,
                    fillColor: palette.onBottomsheet,

                    hintStyle:
                        TextStyle(fontSize: 16, color: palette.textPrimary),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: T20UI.spaceSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
