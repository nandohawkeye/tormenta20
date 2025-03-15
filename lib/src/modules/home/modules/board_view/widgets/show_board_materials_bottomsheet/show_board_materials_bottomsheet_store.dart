// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'package:path/path.dart' as p;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet_storage_service.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';
import 'package:tormenta20/src/shared/utils/file_utils.dart';
import 'package:uuid/uuid.dart';

class ShowBoardMaterialsBottomsheetStore extends ChangeNotifier {
  ShowBoardMaterialsBottomsheetStore(this._boardUuid) {
    _storageService.watchMaterials(_boardUuid).then((resp) {
      if (resp.materials != null) {
        _sub = resp.materials?.listen(_putMaterials);
      }
    });
  }

  late String _boardUuid;

  StreamSubscription? _sub;
  final _storageService = ShowBoardMaterialsBottomsheetStorageService();

  ShowBoardMaterialBottomSheetMode _mode = ShowBoardMaterialBottomSheetMode.add;
  ShowBoardMaterialBottomSheetMode get mode => _mode;
  void chageMode(ShowBoardMaterialBottomSheetMode value) {
    _mode = value;
    if (_mode == ShowBoardMaterialBottomSheetMode.add) {
      _materialToDelete.clear();
    }

    notifyListeners();
  }

  List<String> _materialToDelete = [];
  List<String> get materialToDelete => _materialToDelete;
  void addMaterialToDelete(String uuid) {
    if (_materialToDelete.contains(uuid)) {
      _materialToDelete.remove(uuid);
    } else {
      _materialToDelete.add(uuid);
    }

    notifyListeners();
  }

  List<BoardMaterial> _materials = [];
  List<BoardMaterial> get materials => _materials;
  void _putMaterials(List<BoardMaterial> values) {
    _materials.clear();
    _materials.addAll(values);
    notifyListeners();
  }

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
          final extension = p.extension(path).toLowerCase().replaceAll('.', '');

          final material = BoardMaterial(
            boardUuid: _boardUuid,
            uuid: const Uuid().v4(),
            path: path,
            type: extension == 'pdf'
                ? BoardMaterialTypes.pdf
                : BoardMaterialTypes.image,
          );

          newsMaterials.add(material);
        }
      }

      await _storageService.saveMaterials(newsMaterials);
    }
  }

  void deleteMaterials() async =>
      await _storageService.deleteMaterials(_materialToDelete);

  @override
  void dispose() {
    _sub?.cancel();
    _sub = null;
    super.dispose();
  }
}
