import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/menace/widgets/clone_menace_bottomsheet/close_menace_bottomsheet_storage_service.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/expertise/expertise.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:uuid/uuid.dart';

class CloneMenaceBottomsheetStore extends ChangeNotifier {
  CloneMenaceBottomsheetStore(Menace initial) {
    _menace = initial;
    _menaceName = initial.name;
    _imagePath = initial.imagePath;
    _imageAsset = initial.imageAsset;
  }

  final _storageService = CloseMenaceBottomsheetStorageService();

  late Menace _menace;
  late String _menaceName;
  void changeName(String? value) {
    if (value == null) return;

    _menaceName = value;
    notifyListeners();
  }

  CloneMenaceStates _state = CloneMenaceStates.idle;
  CloneMenaceStates get state => _state;

  String? _imagePath;
  String? get imagePath => _imagePath;
  void setImagePath(String? value) {
    _imagePath = value;
    notifyListeners();
  }

  String? _imageAsset;
  String? get imageAsset => _imageAsset;
  void setImageAsset(String? value) {
    _imageAsset = value;
    notifyListeners();
  }

  void setNullImages() {
    _imagePath = null;
    _imageAsset = null;
    notifyListeners();
  }

  void clone() async {
    final uuidMenace = const Uuid().v4();
    _state = CloneMenaceStates.loading;
    List<MagicMenace> magics = [];
    List<Expertise> expertises = [];
    List<GeneralSkill> generalSkills = [];
    List<ActionEnt> actions = [];
    List<Equipment> equipments = [];

    for (var expertise in _menace.expertises) {
      expertises.add(expertise.cloneWith(
        uuid: const Uuid().v4(),
        parentUuid: uuidMenace,
      ));
    }

    for (var magic in _menace.magics) {
      magics.add(magic.cloneWith(
        uuid: const Uuid().v4(),
        menaceUuid: uuidMenace,
      ));
    }

    for (var generalSkill in _menace.generalSkills) {
      generalSkills.add(generalSkill.cloneWith(
        uuid: const Uuid().v4(),
        parentUuid: uuidMenace,
      ));
    }

    for (var action in _menace.actions) {
      actions.add(action.cloneWith(
        uuid: const Uuid().v4(),
        parentUuid: uuidMenace,
      ));
    }

    for (var equipament in _menace.equipments) {
      equipments.add(equipament.cloneWith(
        uuid: const Uuid().v4(),
        parentUuid: uuidMenace,
      ));
    }

    final menaceCloned = _menace.cloneWith(
      uuid: uuidMenace,
      name: _menaceName.isEmpty ? _menace.name : _menaceName,
      imagePath: _imagePath,
      imageAsset: _imageAsset,
      magics: magics,
      expertises: expertises,
      generalSkills: generalSkills,
      actions: actions,
      equipments: equipments,
    );

    final failure = await _storageService.saveMenace(
      entity: menaceCloned,
      magicsToDelete: [],
      skillsToDelete: [],
      expertisesToDelete: [],
      actionsToDelete: [],
      equipmentsToDelete: [],
    );

    if (failure != null) {
      _state = CloneMenaceStates.error;
    } else {
      _state = CloneMenaceStates.success;
    }

    notifyListeners();
  }
}

enum CloneMenaceStates { idle, loading, success, error }
