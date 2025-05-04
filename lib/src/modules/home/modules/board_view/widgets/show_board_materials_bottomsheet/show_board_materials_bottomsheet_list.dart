import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_material_card.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet_store.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class ShowBoardMaterialsBottomsheetList extends StatelessWidget {
  const ShowBoardMaterialsBottomsheetList(
    this.store, {
    super.key,
  });

  final ShowBoardMaterialsBottomsheetStore store;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (_, __) {
        final materials = store.materials;

        if (materials.isEmpty) {
          return ScreenImageButton(
            imageAsset: Assets.images.pdf.path,
            borderRadius: BorderRadius.zero,
            background: palette.background,
            title: 'Materiais',
            subtitle:
                'Adicione arquivos de PDF e imagens para consultar rapidamente',
            onTap: store.addFiles,
          );
        }

        final mode = store.mode;
        final toDelete = store.materialToDelete;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            T20UI.spaceHeight,
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.screenContentSpaceSize,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: materials.length,
                itemExtent: 120 + T20UI.smallSpaceSize,
                itemBuilder: (_, index) {
                  return BoardViewMaterialCard(
                    material: materials[index],
                    mode: mode,
                    toDelete: toDelete,
                    onDelete: store.addMaterialToDelete,
                  );
                },
              ),
            ),
            T20UI.spaceHeight,
          ],
        );
      },
    );
  }
}
