import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_material_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';
import 'package:tormenta20/src/shared/utils/file_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class BoardViewMaterialsField extends StatelessWidget {
  const BoardViewMaterialsField(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    void addFiles() async {
      FilePickerResult? result = await GetIt.I<FilePicker>().pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: FileUtils.avalaibleExtensions,
      );

      final paths = result?.paths;

      if (paths != null) {
        List<BoardMaterial> newsMaterials = [];

        for (var path in paths) {
          if (path != null) {
            final extension =
                p.extension(path).toLowerCase().replaceAll('.', '');

            final material = BoardMaterial(
              boardUuid: board.uuid,
              uuid: const Uuid().v4(),
              path: path,
              type: extension == 'pdf'
                  ? BoardMaterialTypes.pdf
                  : BoardMaterialTypes.image,
            );

            newsMaterials.add(material);
          }
        }

        await GetIt.I<AppDatabase>().boardDAO.saveMaterials(newsMaterials);
      }
    }

    final materials = board.materials;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Materiais'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: addFiles,
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,
        materials.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  bottom: T20UI.spaceSize,
                  right: T20UI.spaceSize - 4,
                  left: T20UI.spaceSize - 4,
                ),
                child: ScreenImageButton(
                    imageAsset: Assets.images.pdf.path,
                    title: 'Materiais',
                    subtitle:
                        'Adicione arquivos de PDF e imagens para consultar rapidamente',
                    onTap: addFiles),
              )
            : SizedBox(
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
                    );
                  },
                ),
              ),
      ],
    );
  }
}
