import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/character_board.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/failures/failure.dart';
import 'package:tormenta20/src/shared/services/drift_storage_service.dart';

class CharacterRecordStorageService extends DriftStorageService {
  Future<({Failure? failure, Stream<CharacterBoard?>? character})>
  watchCharacter(String uuid) {
    return super.dataBase.characterDAO.watchCharactersBoardFromUuid(uuid);
  }

  Future<void> changeAtributeHandToHand(
    String characterUuid,
    Atribute atribute,
  ) async {
    return super.dataBase.characterDAO.changeAtributeHandToHand(
      characterUuid,
      atribute,
    );
  }

  Future<void> changeCreatureSize(
    String characterUuid,
    CreatureSizeCategory creatureSize,
  ) async {
    return super.dataBase.characterDAO.changeCreatureSize(
      characterUuid,
      creatureSize,
    );
  }

  Future<void> changeDisplacement(
    String characterUuid,
    String? displacement,
  ) async {
    return super.dataBase.characterDAO.changeDisplacement(
      characterUuid,
      displacement,
    );
  }

  Future<void> changeSenses(String characterUuid, String? senses) async {
    return super.dataBase.characterDAO.changeSenses(characterUuid, senses);
  }

  Future<Failure?> saveActionAndUpdateCharacterRecord(
    ActionEnt entity,
    String characterRecordUuid,
  ) async {
    return super.dataBase.characterDAO.saveActionAndUpdateCharacterRecord(
      entity,
      characterRecordUuid,
    );
  }

  Future<Failure?> savePowerAndUpdateCharacterRecord(
    Power entity,
    String characterRecordUuid,
  ) async {
    return super.dataBase.characterDAO.savePowerUpdateCharacterRecord(
      entity,
      characterRecordUuid,
    );
  }

  Future<Failure?> saveExpertiseAndUpdateCharacterRecord(
    Expertise entity,
    String characterRecordUuid,
  ) async {
    return super.dataBase.characterDAO.saveExpertiseUpdateCharacterRecord(
      entity,
      characterRecordUuid,
    );
  }

  Future<Failure?> saveOriginAndUpdateCharacterRecord(
    Origin entity,
    String characterRecordUuid,
  ) async {
    return super.dataBase.characterDAO.saveOriginUpdateCharacterRecord(
      entity,
      characterRecordUuid,
    );
  }

  Future<Failure?> deleteOriginAndUpdateCharacterRecord(
    Origin entity,
    String characterRecordUuid,
  ) async {
    return super.dataBase.characterDAO.deleteOriginUpdateCharacterRecord(
      entity,
      characterRecordUuid,
    );
  }

  Future<Failure?> deleteExpertiseAndUpdateCharacterRecord(
    Expertise entity,
    String characterRecordUuid,
  ) async {
    return super.dataBase.characterDAO.deleteExpertiseUpdateCharacterRecord(
      entity,
      characterRecordUuid,
    );
  }

  Future<Failure?> saveEquipmentAndUpdateCharacterRecord(
    Equipment entity,
    String characterRecordUuid,
  ) async {
    return super.dataBase.characterDAO.saveEquipmentAndUpdateCharacterRecord(
      entity,
      characterRecordUuid,
    );
  }
}
