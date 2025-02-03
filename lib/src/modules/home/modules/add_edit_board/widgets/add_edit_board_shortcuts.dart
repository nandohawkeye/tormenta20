import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_board_shortcut/bottom_sheet_board_shortcuts.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_dto.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardShortcuts extends StatelessWidget {
  const AddEditBoardShortcuts(this.controller, {super.key});

  final AddEditBoardController controller;

  @override
  Widget build(BuildContext context) {
    void onChangeShortcuts() async {
      await showModalBottomSheet<BoardShortcutsDto?>(
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BottomSheetBoardShortcuts(
            whatsLink: controller.whatsLink,
            dicordLink: controller.dicordLink,
            telegramLink: controller.telegramLink,
            drivefilesLink: controller.drivefilesLink,
          ),
        ),
      ).then(controller.onChangeShortcuts);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Atalhos'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: onChangeShortcuts,
              )
            ],
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: T20UI.spaceSize - 4,
          ),
          child: MainButton(
            label: 'Adicionar atalhos',
            backgroundColor: palette.cardBackground,
            onTap: onChangeShortcuts,
          ),
        )
      ],
    );
  }
}
