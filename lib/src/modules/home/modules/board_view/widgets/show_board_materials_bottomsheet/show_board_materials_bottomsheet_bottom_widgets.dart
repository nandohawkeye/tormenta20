import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet_store.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class ShowBoardMaterialsBottomsheetBottomWidgets extends StatelessWidget {
  const ShowBoardMaterialsBottomsheetBottomWidgets(
    this.store, {
    super.key,
  });

  final ShowBoardMaterialsBottomsheetStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DividerLevelTwo(verticalPadding: 0),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              Expanded(
                child: RepaintBoundary(
                  child: ListenableBuilder(
                      listenable: store,
                      builder: (_, __) {
                        final mode = store.mode;
                        final toDelete = store.materialToDelete;

                        return MainButton(
                          label: mode == ShowBoardMaterialBottomSheetMode.add
                              ? 'Adicionar'
                              : 'Deletar',
                          backgroundColor: (mode ==
                                      ShowBoardMaterialBottomSheetMode.delete &&
                                  toDelete.isEmpty)
                              ? palette.backgroundLevelTwo
                              : palette.selected,
                          onTap: () {
                            if (mode == ShowBoardMaterialBottomSheetMode.add) {
                              store.addFiles();
                            } else {
                              if (toDelete.isNotEmpty) {
                                store.deleteMaterials();
                              }
                            }
                          },
                        );
                      }),
                ),
              ),
              T20UI.spaceWidth,
              RepaintBoundary(
                child: ListenableBuilder(
                  listenable: store,
                  builder: (_, __) {
                    final mode = store.mode;
                    return SimpleButton(
                      icon: mode == ShowBoardMaterialBottomSheetMode.add
                          ? FontAwesomeIcons.solidTrashCan
                          : FontAwesomeIcons.plus,
                      iconColor: palette.onSelected,
                      backgroundColor: palette.selected,
                      onTap: () {
                        if (mode == ShowBoardMaterialBottomSheetMode.add) {
                          store.chageMode(
                              ShowBoardMaterialBottomSheetMode.delete);
                        } else {
                          store.chageMode(ShowBoardMaterialBottomSheetMode.add);
                        }
                      },
                    );
                  },
                ),
              ),
              const SimpleCloseButton()
            ],
          ),
        )
      ],
    );
  }
}
