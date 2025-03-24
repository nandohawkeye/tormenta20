import 'package:drift/drift.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/config.dart';
import 'package:tormenta20/src/shared/entities/play_mode.dart';

abstract class ConfigAdapters {
  static Config fromDriftData(ConfigTableData data) {
    return Config(
      id: data.id,
      mode: PlayMode.values[data.modeIndex],
      enableBottomBackButton: data.enableBottomBackButton,
      showApresetation: data.showApresetation,
    );
  }

  static ConfigTableCompanion toDriftCompanion(Config entity) {
    return ConfigTableCompanion(
      id: Value(entity.id),
      modeIndex: Value(entity.mode.index),
      enableBottomBackButton: Value(entity.enableBottomBackButton),
      showApresetation: Value(entity.showApresetation),
    );
  }
}
