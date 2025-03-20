import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class AddEditCharacterStorageService extends DriftStorageService {
  Future<Failure?> saveCharacter({
    required Character entity,
    required List<Power> powerToDelete,
    required List<Origin> originToDelete,
    required List<ActionEnt> actionsToDelete,
    required List<Equipment> equipmentsToDelete,
  }) {
    return super.dataBase.characterDAO.saveCharacter(
          entity: entity,
          powerToDelete: powerToDelete,
          originToDelete: originToDelete,
          actionsToDelete: actionsToDelete,
          equipmentsToDelete: equipmentsToDelete,
        );
  }
}
