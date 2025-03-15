import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/config_table.dart';

part 'config_dao.g.dart';

@DriftAccessor(tables: [ConfigTable])
class ConfigDAO extends DatabaseAccessor<AppDatabase> with _$ConfigDAOMixin {
  ConfigDAO(super.db);
}
