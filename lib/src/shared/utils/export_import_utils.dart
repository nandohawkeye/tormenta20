import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/export_import_type.dart';
import 'package:tormenta20/src/shared/utils/crypto_utils.dart';

abstract class ExportImportUtils {
  static Map<String, dynamic>? toExportBase(ExportImportType type) {
    try {
      final dbVersion = GetIt.I<AppDatabase>().schemaVersion;
      const key = String.fromEnvironment("INDENTIFIER_KEY");
      final indentifier = CryptoUtils.generateSha256(key);
      final appversion = GetIt.I<PackageInfo>().version;

      return {
        'db_schema_version': dbVersion,
        'sha_256': indentifier,
        'app_version': appversion,
        'type': type.index,
      };
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }

      return null;
    }
  }
}
