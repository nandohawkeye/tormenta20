import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_material_card.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet_store.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

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
      child: Padding(
        padding: T20UI.allPaddingWithPaddingBottom(context),
        child: SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: palette.backgroundLevelOne,
                borderRadius: T20UI.borderRadius),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
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
                const DividerLevelTwo(verticalPadding: 0),
                AnimatedBuilder(
                  animation: _store,
                  builder: (_, __) {
                    final materials = _store.materials;

                    if (materials.isEmpty) {
                      return ScreenImageButton(
                        imageAsset: Assets.images.pdf.path,
                        borderRadius: BorderRadius.zero,
                        title: 'Materiais',
                        subtitle:
                            'Adicione arquivos de PDF e imagens para consultar rapidamente',
                        onTap: _store.addFiles,
                      );
                    }

                    final mode = _store.mode;
                    final toDelete = _store.materialToDelete;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        T20UI.spaceHeight,
                        SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: T20UI.spaceSize - 4),
                            scrollDirection: Axis.horizontal,
                            itemCount: materials.length,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemBuilder: (_, index) {
                              return BoardViewMaterialCard(
                                material: materials[index],
                                mode: mode,
                                toDelete: toDelete,
                                onDelete: _store.addMaterialToDelete,
                              );
                            },
                          ),
                        ),
                        T20UI.spaceHeight,
                      ],
                    );
                  },
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
                            child: AnimatedBuilder(
                                animation: _store,
                                builder: (_, __) {
                                  final mode = _store.mode;
                                  final toDelete = _store.materialToDelete;

                                  return MainButton(
                                    label: mode ==
                                            ShowBoardMaterialBottomSheetMode.add
                                        ? 'Adicionar'
                                        : 'Deletar',
                                    backgroundColor: (mode ==
                                                ShowBoardMaterialBottomSheetMode
                                                    .delete &&
                                            toDelete.isEmpty)
                                        ? palette.backgroundLevelTwo
                                        : palette.selected,
                                    onTap: () {
                                      if (mode ==
                                          ShowBoardMaterialBottomSheetMode
                                              .add) {
                                        _store.addFiles();
                                      } else {
                                        if (toDelete.isNotEmpty) {
                                          _store.deleteMaterials();
                                        }
                                      }
                                    },
                                  );
                                }),
                          ),
                          T20UI.spaceWidth,
                          AnimatedBuilder(
                            animation: _store,
                            builder: (_, __) {
                              final mode = _store.mode;
                              return SimpleButton(
                                icon:
                                    mode == ShowBoardMaterialBottomSheetMode.add
                                        ? FontAwesomeIcons.solidTrashCan
                                        : FontAwesomeIcons.plus,
                                iconColor: palette.onSelected,
                                backgroundColor: palette.selected,
                                onTap: () {
                                  if (mode ==
                                      ShowBoardMaterialBottomSheetMode.add) {
                                    _store.chageMode(
                                        ShowBoardMaterialBottomSheetMode
                                            .delete);
                                  } else {
                                    _store.chageMode(
                                        ShowBoardMaterialBottomSheetMode.add);
                                  }
                                },
                              );
                            },
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
    );
  }
}

enum ShowBoardMaterialBottomSheetMode { add, delete }
