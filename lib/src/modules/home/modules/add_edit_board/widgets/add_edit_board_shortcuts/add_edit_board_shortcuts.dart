import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_shortcuts/add_edit_board_shortcut_card.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_board_shortcut/bottom_sheet_board_shortcuts.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcuts_dto.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardShortcuts extends StatefulWidget {
  const AddEditBoardShortcuts(
    this.controller, {
    super.key,
    required this.scrollController,
  });

  final AddEditBoardController controller;
  final ScrollController scrollController;

  @override
  State<AddEditBoardShortcuts> createState() => _AddEditBoardShortcutsState();
}

class _AddEditBoardShortcutsState extends State<AddEditBoardShortcuts> {
  late final ValueNotifier<BoardShortcutsDto> _shortcuts;
  void _setShortCuts(BoardShortcutsDto? value) async {
    if (value != null) {
      _shortcuts.value = value;
      widget.controller.onChangeShortcuts(value);
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (_) => widget.scrollController.animateTo(
          widget.scrollController.position.maxScrollExtent,
          duration: T20UI.defaultDurationAnimation,
          curve: Curves.easeIn,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _shortcuts = ValueNotifier<BoardShortcutsDto>(
      BoardShortcutsDto(
        dicordLink: widget.controller.dicordLink,
        whatsLink: widget.controller.whatsLink,
        drivefilesLink: widget.controller.drivefilesLink,
        telegramLink: widget.controller.telegramLink,
      ),
    );
  }

  @override
  void dispose() {
    _shortcuts.dispose();
    super.dispose();
  }

  void _onChangeShortcuts() async {
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
          whatsLink: widget.controller.whatsLink,
          dicordLink: widget.controller.dicordLink,
          telegramLink: widget.controller.telegramLink,
          drivefilesLink: widget.controller.drivefilesLink,
        ),
      ),
    ).then(_setShortCuts);
  }

  @override
  Widget build(BuildContext context) {
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
                onTap: _onChangeShortcuts,
              )
            ],
          ),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
          valueListenable: _shortcuts,
          builder: (_, shortcuts, __) {
            if (shortcuts.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.spaceSize - 4,
                ),
                child: MainButton(
                  label: 'Adicionar atalhos',
                  backgroundColor: palette.cardBackground,
                  onTap: _onChangeShortcuts,
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (shortcuts.whatsLink != null)
                  AddEditBoardShortcutCard(
                    url: shortcuts.whatsLink!,
                    type: BoardShortcutsType.whats,
                    onTap: _onChangeShortcuts,
                  ),
                if (shortcuts.dicordLink != null)
                  AddEditBoardShortcutCard(
                    url: shortcuts.dicordLink!,
                    type: BoardShortcutsType.discord,
                    onTap: _onChangeShortcuts,
                  ),
                if (shortcuts.drivefilesLink != null)
                  AddEditBoardShortcutCard(
                    url: shortcuts.drivefilesLink!,
                    type: BoardShortcutsType.drive,
                    onTap: _onChangeShortcuts,
                  ),
                if (shortcuts.telegramLink != null)
                  AddEditBoardShortcutCard(
                    url: shortcuts.telegramLink!,
                    type: BoardShortcutsType.telegran,
                    onTap: _onChangeShortcuts,
                  ),
              ],
            );
          },
        )
      ],
    );
  }
}
