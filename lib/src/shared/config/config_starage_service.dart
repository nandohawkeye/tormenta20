import 'package:tormenta20/src/shared/entities/config.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class ConfigStarageService extends DriftStorageService {
  Future<Failure?> updateConfig(Config entity) {
    return super.dataBase.configDAO.updateConfig(entity);
  }

  Future<({Failure? failure, Config? config})> getConfig() {
    return super.dataBase.configDAO.getConfig();
  }
}
