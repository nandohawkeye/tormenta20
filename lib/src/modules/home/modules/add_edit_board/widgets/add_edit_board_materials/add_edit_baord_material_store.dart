import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';
import 'package:tormenta20/src/shared/utils/file_utils.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class AddEditBaordMaterialStore {
  AddEditBaordMaterialStore(this._controller) {
    materials = ValueNotifier<List<BoardMaterial>?>(_controller.materials);
  }

  final AddEditBoardController _controller;
  late final ValueNotifier<List<BoardMaterial>?> materials;

  void addMaterials(List<String?> values) {
    List<BoardMaterial> oldMaterials = materials.value ?? [];
    List<BoardMaterial> newsMaterials = [];

    for (var path in values) {
      if (path != null) {
        final extension = p.extension(path).toLowerCase().replaceAll('.', '');

        final material = BoardMaterial(
          boardUuid: _controller.boardUuid,
          uuid: const Uuid().v4(),
          path: path,
          type: extension == 'pdf'
              ? BoardMaterialTypes.pdf
              : BoardMaterialTypes.image,
        );

        newsMaterials.add(material);
      }
    }

    materials.value = null;
    materials.value = [...oldMaterials, ...newsMaterials];
    _controller.addMaterials(newsMaterials);
  }

  void onRemove(BoardMaterial value) {
    _controller.removeMaterials(value);
    List<BoardMaterial> oldMaterials = materials.value ?? [];
    oldMaterials.removeWhere((od) => od.uuid == value.uuid);
    materials.value = null;
    materials.value = oldMaterials;
  }

  void onSelectFiles() async {
    FilePickerResult? result = await GetIt.I<FilePicker>().pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: FileUtils.avalaibleExtensions,
    );

    final paths = result?.paths;

    if (paths != null) {
      addMaterials(paths);
    }
  }

  dispose() => materials.dispose();
}
