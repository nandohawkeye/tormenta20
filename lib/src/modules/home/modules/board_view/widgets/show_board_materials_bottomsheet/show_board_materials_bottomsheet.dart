import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet_bottom_widgets.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet_list.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet_store.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';

class ShowBoardMaterialsBottomsheet extends StatefulWidget {
  const ShowBoardMaterialsBottomsheet({super.key, required this.boardUuid});

  final String boardUuid;

  @override
  State<ShowBoardMaterialsBottomsheet> createState() =>
      _ShowBoardMaterialsBottomsheetState();
}

class _ShowBoardMaterialsBottomsheetState
    extends State<ShowBoardMaterialsBottomsheet> {
  late final ShowBoardMaterialsBottomsheetStore _store;

  @override
  void initState() {
    super.initState();
    _store = ShowBoardMaterialsBottomsheetStore(widget.boardUuid);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RepaintBoundary(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                T20UI.spaceHeight,
                Padding(
                  padding: T20UI.horizontalPadding,
                  child: Text(
                    'Materiais',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: FontFamily.tormenta,
                    ),
                  ),
                ),
                T20UI.spaceHeight,
              ],
            ),
          ),
          const DividerLevelTwo(verticalPadding: 0),
          ShowBoardMaterialsBottomsheetList(_store),
          ShowBoardMaterialsBottomsheetBottomWidgets(_store)
        ],
      ),
    );
  }
}

enum ShowBoardMaterialBottomSheetMode { add, delete }
