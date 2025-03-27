import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:path_provider/path_provider.dart';

abstract class BackupUtils {
  static const String _backupFolder = 'backup';
  static const String _bindFolder = 'binds';
  static const String _backupExt = '.t20';
  static Future<void> export(Map<String, dynamic> data, String fileName) async {
    String path = (await getApplicationDocumentsDirectory()).path;
    Directory customDir = Directory('$path/$_backupFolder');

    if (!await customDir.exists()) {
      await customDir.create(recursive: true);
    }

    File file = File('${customDir.path}/$fileName$_backupExt');

    String jsonString = jsonEncode(data);
    await file.writeAsString(jsonString);
  }

  static Future<File?> createTempJson(
      Map<String, dynamic> data, String fileName) async {
    try {
      String path = (await getTemporaryDirectory()).path;
      Directory customDir = Directory('$path/$_bindFolder');

      if (!await customDir.exists()) {
        await customDir.create(recursive: true);
      }

      File file = File('${customDir.path}/$fileName$_backupExt');

      String jsonString = jsonEncode(data);
      await file.writeAsString(jsonString);
      return file;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }

      return null;
    }
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
