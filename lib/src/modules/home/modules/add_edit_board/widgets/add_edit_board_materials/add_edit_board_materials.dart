import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_materials/add_edit_board_material_card.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

class AddEditBoardMaterials extends StatefulWidget {
  const AddEditBoardMaterials(this.controller, {super.key});

  final AddEditBoardController controller;

  @override
  State<AddEditBoardMaterials> createState() => _AddEditBoardMaterialsState();
}

class _AddEditBoardMaterialsState extends State<AddEditBoardMaterials> {
  late final ValueNotifier<List<BoardMaterial>?> _materials;

  @override
  void initState() {
    super.initState();
    _materials =
        ValueNotifier<List<BoardMaterial>?>(widget.controller.materials);
  }

  @override
  void dispose() {
    _materials.dispose();
    super.dispose();
  }

  void _addMaterials(List<String?> values) {
    List<BoardMaterial> oldMaterials = _materials.value ?? [];
    List<BoardMaterial> newsMaterials = [];

    for (var path in values) {
      if (path != null) {
        final extension = p.extension(path).toLowerCase().replaceAll('.', '');

        final material = BoardMaterial(
          boardUuid: widget.controller.boardUuid,
          uuid: const Uuid().v4(),
          path: path,
          type: extension == 'pdf'
              ? BoardMaterialTypes.pdf
              : BoardMaterialTypes.image,
        );

        newsMaterials.add(material);
      }
    }

    _materials.value = null;
    _materials.value = [...oldMaterials, ...newsMaterials];
    widget.controller.addMaterials(newsMaterials);
  }

  void _onRemove(BoardMaterial value) {
    List<BoardMaterial> oldMaterials = _materials.value ?? [];
    oldMaterials.removeWhere((od) => od.uuid == value.uuid);
    _materials.value = null;
    _materials.value = oldMaterials;
  }

  void _onSelectFiles() async {
    FilePickerResult? result = await GetIt.I<FilePicker>().pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'jpeg',
        'pdf',
        'png',
        'webp',
      ],
    );

    final paths = result?.paths;

    if (paths != null) {
      _addMaterials(paths);
    }
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
              const Labels('Materiais'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: _onSelectFiles,
              )
            ],
          ),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
          valueListenable: _materials,
          builder: (_, materials, __) {
            final list = materials ?? [];
            if (list.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: T20UI.spaceSize - 4,
                ),
                child: MainButton(
                  label: 'Adicionar material',
                  backgroundColor: palette.cardBackground,
                  onTap: _onSelectFiles,
                ),
              );
            }

            return Padding(
              padding: T20UI.verticalPadding,
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  itemCount: list.length,
                  padding: T20UI.horizontalPadding,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => T20UI.spaceWidth,
                  itemBuilder: (_, index) => AddEditBoardMaterialCard(
                    material: list[index],
                    onTap: _onRemove,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
