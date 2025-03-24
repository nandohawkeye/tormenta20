import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/database/tables/config_table.dart';
import 'package:tormenta20/src/shared/entities/config.dart';
import 'package:tormenta20/src/shared/entities/config_adapters.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';

part 'config_dao.g.dart';

@DriftAccessor(tables: [ConfigTable])
class ConfigDAO extends DatabaseAccessor<AppDatabase> with _$ConfigDAOMixin {
  ConfigDAO(super.db);

  Future<Failure?> updateConfig(Config entity) async {
    try {
      await into(configTable)
          .insertOnConflictUpdate(ConfigAdapters.toDriftCompanion(entity));

      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<({Failure? failure, Config? config})> getConfig() async {
    try {
      final row = await (select(configTable)).getSingle();

      return (failure: null, config: ConfigAdapters.fromDriftData(row));
    } catch (e) {
      return (failure: Failure(e.toString()), config: null);
    }
  }
}
