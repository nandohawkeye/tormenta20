import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/shared/utils/backup_utils.dart';
import 'package:tormenta20/src/shared/utils/crypto_utils.dart';

class ImportFileStore extends ChangeNotifier {
  ImportFileStore(File? initial) {
    if (initial != null) {
      _file = initial;
      _validate(initial);
    }
  }

  String _title = '';
  String get title => _title;

  File? _file;
  File? get file => _file;
  void getFile() async {
    FilePickerResult? result = await GetIt.I<FilePicker>().pickFiles(
      allowMultiple: false,
      type: FileType.any,
      // type: FileType.custom,
      // allowedExtensions: ['.t20'],
    );

    if (result?.paths.first != null) {
      _file = File(result!.paths.first!);
      notifyListeners();

      _validate(File(result.paths.first!));
    }
  }

  bool? _isValid;
  bool? get isValid => _isValid;

  void _validate(File file) async {
    final json = await BackupUtils.import(file);

    if (json == null) {
      _isValid = false;
      notifyListeners();
      return;
    }

    if (!json.containsKey('sha_256')) {
      _isValid = false;
      notifyListeners();
      return;
    }

    final sha256 = json['sha_256'];
    const key = String.fromEnvironment("INDENTIFIER_KEY");
    final indentifier = CryptoUtils.generateSha256(key);
    if (sha256 != indentifier) {
      _isValid = false;
      notifyListeners();
      return;
    }

    _title = 'Arquivo';

    if (json.containsKey('board')) {
      _title = 'Mesa';
    }

    if (json.containsKey('board') && json['type'] == 1) {
      _title = 'Convite para a mesa';
    }

    _isValid = true;
    notifyListeners();

    print('json: $json');
  }

  void import() {}
}
