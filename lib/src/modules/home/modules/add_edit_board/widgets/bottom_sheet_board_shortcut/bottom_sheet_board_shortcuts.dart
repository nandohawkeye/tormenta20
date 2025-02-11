import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_board_shortcut/bottom_sheet_board_shortcuts_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_board_shortcut/bottom_sheet_board_shortcut_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_board_shortcut/bottom_sheet_board_shortcuts_store.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BottomSheetBoardShortcuts extends StatefulWidget {
  const BottomSheetBoardShortcuts({
    super.key,
    this.whatsLink,
    this.dicordLink,
    this.drivefilesLink,
    this.telegramLink,
  });

  final String? whatsLink;
  final String? dicordLink;
  final String? drivefilesLink;
  final String? telegramLink;

  @override
  State<BottomSheetBoardShortcuts> createState() =>
      _BottomSheetBoardShortcutsState();
}

class _BottomSheetBoardShortcutsState extends State<BottomSheetBoardShortcuts> {
  late final BottomSheetBoardShortcutsStore _store;

  @override
  void initState() {
    super.initState();
    _store = BottomSheetBoardShortcutsStore(
      whatsLink: widget.whatsLink,
      dicordLink: widget.dicordLink,
      drivefilesLink: widget.drivefilesLink,
      telegramLink: widget.telegramLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
        child: Padding(
      padding: T20UI.allPaddingWithPaddingBottom(context),
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: palette.backgroundLevelOne,
              borderRadius: T20UI.borderRadius),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BottomSheetBoardShortcutsHeader(),
                const DividerLevelTwo(verticalPadding: 0),
                T20UI.spaceHeight,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BottomSheetBoardShortcutField(
                      type: BoardShortcutsType.whats,
                      initialValue: widget.whatsLink,
                      helperText: 'Esse é essencial',
                      onChange: _store.onChangeWhats,
                    ),
                    T20UI.spaceHeight,
                    BottomSheetBoardShortcutField(
                      type: BoardShortcutsType.discord,
                      initialValue: widget.dicordLink,
                      helperText: 'Barbo demais',
                      onChange: _store.onChangeDicordLink,
                    ),
                    T20UI.spaceHeight,
                    BottomSheetBoardShortcutField(
                      type: BoardShortcutsType.drive,
                      initialValue: widget.drivefilesLink,
                      helperText: 'Ajuda pra caramba',
                      onChange: _store.onChangeDrivefilesLink,
                    ),
                    T20UI.spaceHeight,
                    BottomSheetBoardShortcutField(
                      type: BoardShortcutsType.telegran,
                      helperText: 'Tem quem prefira...',
                      initialValue: widget.telegramLink,
                      onChange: _store.onChangeTelegramLink,
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DividerLevelTwo(verticalPadding: 0),
                    Padding(
                      padding: T20UI.allPadding,
                      child: Row(
                        children: [
                          Expanded(
                            child: MainButton(
                              label: 'Salvar',
                              onTap: () {
                                final dto = _store.toData();
                                Navigator.pop(context, dto);
                              },
                            ),
                          ),
                          T20UI.spaceWidth,
                          SimpleCloseButton(
                            backgroundColor: palette.backgroundLevelTwo,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
