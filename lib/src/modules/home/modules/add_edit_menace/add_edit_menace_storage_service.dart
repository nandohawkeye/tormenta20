import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class AddEditMenaceStorageService extends DriftStorageService {
  Future<Failure?> saveMenace({
    required Menace menace,
    required List<String> magicsToDelete,
    required List<String> skillsToDelete,
    required List<String> expertisesToDelete,
    required List<ActionEnt> actionsToDelete,
    required List<Equipment> equipmentsToDelete,
  }) {
    return super.dataBase.menaceDAO.saveMenace(
          entity: menace,
          magicsToDelete: magicsToDelete,
          skillsToDelete: skillsToDelete,
          expertisesToDelete: expertisesToDelete,
          actionsToDelete: actionsToDelete,
          equipmentsToDelete: equipmentsToDelete,
        );
  }
}
