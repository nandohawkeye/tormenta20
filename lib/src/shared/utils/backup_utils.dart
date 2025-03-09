import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:path_provider/path_provider.dart';

abstract class BackupUtils {
  static const String _customFolder = 'backup';
  static const String _backupExt = '.json';
  static Future<void> export(Map<String, dynamic> data, String fileName) async {
    String path = (await getApplicationDocumentsDirectory()).path;
    Directory customDir = Directory('$path/$_customFolder');

    if (!await customDir.exists()) {
      await customDir.create(recursive: true);
    }

    File file = File('${customDir.path}/$fileName$_backupExt');

    String jsonString = jsonEncode(data);
    await file.writeAsString(jsonString);
  }

  static Future<Map<String, dynamic>?> import(File file) async {
    try {
      if (await file.exists()) {
        String contents = await file.readAsString();
        return jsonDecode(contents);
      }
      return null;
    } catch (e) {
      if (kDebugMode) print('Erro ao ler JSON: $e');

      return null;
    }
  }
}
