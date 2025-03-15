// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_storage_service.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_actions_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_combate_role_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_equipments_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_expertises_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_magics_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_size_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_skills_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_treasure_type_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/stores/add_edit_menace_type_store.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';
import 'package:uuid/uuid.dart';

class AddEditMenaceController {
  AddEditMenaceController(Menace? menace) {
    stage = ValueNotifier<int>(1);
    percent = ValueNotifier<double>(0.0);
    if (menace != null) {
      _createdAt = menace.createdAt;
      _uuid = menace.uuid;
      _divinityId = menace.divinityId;
      _displacement = menace.displacement;
      _senses = menace.senses;
      _imagePath = menace.imagePath;
      _imageAsset = menace.imageAsset;
      _name = menace.name;
      _nd = menace.nd;
      _life = menace.life;
      _mana = menace.mana;
      _casterInfos = menace.casterInfos;
      _initiative = menace.initiative;
      _defense = menace.defense;
      _perception = menace.perception;
      _resisFort = menace.fortResistence;
      _resisRef = menace.refResistence;
      _resisVon = menace.vonResistence;
      _strength = menace.strength;
      _constitution = menace.constitution;
      _dexterity = menace.dexterity;
      _intelligence = menace.intelligence;
      _wisdom = menace.wisdom;
      _charisma = menace.charisma;
      _desc = menace.desc;
      _extraInfos = menace.extraInfos;
      treasureTypeStore =
          AddEditMenaceTreasureTypeStore(menace.treasures ?? TreasureType.none);
      combateRoleStore = AddEditMenaceCombateRoleStore(menace.combatRole);
      sizeStore = AddEditMenaceSizeStore(menace.creatureSize);
      typeStore = AddEditMenaceTypeStore(menace.type);
      expertisesStore = AddEditMenaceExpertisesStore(menace.expertises);
      skillsStore = AddEditMenaceSkillsStore(menace.generalSkills);
      magicsStore = AddEditMenaceMagicsStore(menace.magics);
      equipmentsStore = AddEditMenaceEquipmentsStore(menace.equipments);
      actionsStore = AddEditMenaceActionsStore(menace.actions);
    } else {
      treasureTypeStore = AddEditMenaceTreasureTypeStore(TreasureType.none);
      typeStore = AddEditMenaceTypeStore(null);
      sizeStore = AddEditMenaceSizeStore(null);
      combateRoleStore = AddEditMenaceCombateRoleStore(null);
      expertisesStore = AddEditMenaceExpertisesStore([]);
      skillsStore = AddEditMenaceSkillsStore([]);
      magicsStore = AddEditMenaceMagicsStore([]);
      equipmentsStore = AddEditMenaceEquipmentsStore([]);
      actionsStore = AddEditMenaceActionsStore([]);
      _uuid = const Uuid().v4();
    }
  }

  DateTime? _createdAt;

  late final String _uuid;
  String get menaceUuid => _uuid;

  late final ValueNotifier<int> stage;
  void setStage(int value) => stage.value = value;

  late final ValueNotifier<double> percent;
  void setPercent(double value) => percent.value = value;

  late final AddEditMenaceTreasureTypeStore treasureTypeStore;

  List<String> _expertisesToDelete = [];
  void addToDeleteExpertise(String value) {
    _expertisesToDelete.add(value);
  }

  late final AddEditMenaceExpertisesStore expertisesStore;

  late final AddEditMenaceTypeStore typeStore;
  bool isValidType() => typeStore.validate();

  late final AddEditMenaceCombateRoleStore combateRoleStore;
  bool isValidCombatRole() => combateRoleStore.validate();

  late final AddEditMenaceSizeStore sizeStore;
  bool isValidCreatureSize() => sizeStore.validate();

  String? _desc;
  String? get desc => _desc;
  void changeDesc(String? value) => _desc = value;

  String? _extraInfos;
  String? get extraInfos => _extraInfos;
  void changeExtraInfos(String? value) => _extraInfos = value;

  String? _senses;
  String? get senses => _senses;
  void changeSenses(String? value) => _senses = value;

  String? _imagePath;
  String? get imagePath => _imagePath;
  void changePath(String? value) => _imagePath = value;

  String? _imageAsset;
  String? get imageAsset => _imageAsset;
  void changeAsset(String? value) => _imageAsset = value;

  String? _name;
  String? get name => _name;
  void changeName(String? value) => _name = value;

  String? _displacement;
  String? get displacement => _displacement;
  void changeDisplacement(String? value) => _displacement = value;

  String? _nd;
  String? get nd => _nd;
  void changeND(String? value) => _nd = value;

  int? _life;
  int? get life => _life;
  void changeLife(String? value) {
    if (value?.isEmpty ?? true) {
      _life = null;
      return;
    }

    _life = int.parse(value!);
  }

  int? _mana;
  int? get mana => _mana;
  void changeMana(String? value) {
    if (value?.isEmpty ?? true) {
      _mana = null;
      return;
    }

    _mana = int.parse(value!);
  }

  int? _initiative;
  int? get initiative => _initiative;
  void changeInitiative(String? value) {
    if (value?.isEmpty ?? true) {
      _initiative = null;
      return;
    }

    _initiative = int.parse(value!);
  }

  int? _defense;
  int? get defense => _defense;
  void changeDefense(String? value) {
    if (value?.isEmpty ?? true) {
      _defense = null;
      return;
    }

    _defense = int.parse(value!);
  }

  int? _perception;
  int? get perception => _perception;
  void changePerception(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _perception = null;
      return;
    }

    _perception = int.parse(value!);
  }

  int? _resisFort;
  int? get resisFort => _resisFort;
  void changeResisFort(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _resisFort = null;
      return;
    }

    _resisFort = int.parse(value!);
  }

  int? _resisRef;
  int? get resisRef => _resisRef;
  void changeResisRef(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _resisRef = null;
      return;
    }

    _resisRef = int.parse(value!);
  }

  int? _resisVon;
  int? get resisVon => _resisVon;
  void changeResisVon(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _resisVon = null;
      return;
    }

    _resisVon = int.parse(value!);
  }

  int? _strength;
  int? get strength => _strength;
  void changeStrength(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _strength = null;
      return;
    }

    _strength = int.parse(value!);
  }

  int? _dexterity;
  int? get dexterity => _dexterity;
  void changeDexterity(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _dexterity = null;
      return;
    }

    _dexterity = int.parse(value!);
  }

  int? _constitution;
  int? get constitution => _constitution;
  void changeConstitution(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _constitution = null;
      return;
    }

    _constitution = int.parse(value!);
  }

  int? _intelligence;
  int? get intelligence => _intelligence;
  void changeIntelligence(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _intelligence = null;
      return;
    }

    _intelligence = int.parse(value!);
  }

  int? _wisdom;
  int? get wisdom => _wisdom;
  void changeWisdom(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _wisdom = null;
      return;
    }

    _wisdom = int.parse(value!);
  }

  int? _charisma;
  int? get charisma => _charisma;
  void changeCharisma(String? value) {
    if ((value?.isEmpty ?? true) || value == '-') {
      _charisma = null;
      return;
    }

    _charisma = int.parse(value!);
  }

  int? _divinityId;
  int? get divinityId => _divinityId;
  void changeDivinityId(int? value) => _divinityId = value;

  String? _casterInfos;
  String? get casterInfos => _casterInfos;
  void changeCasterInfos(String? value) => _casterInfos = value;

  late final AddEditMenaceSkillsStore skillsStore;
  List<String> _skillsToDelete = [];
  void addSkillToDelete(String value) => _skillsToDelete.add(value);

  late final AddEditMenaceMagicsStore magicsStore;
  List<String> _magicsToDelete = [];
  void addMagicToDelete(String value) => _magicsToDelete.add(value);

  late final AddEditMenaceEquipmentsStore equipmentsStore;
  List<Equipment> _equipmentsToDelete = [];
  void addEquipmentToDelete(Equipment value) {
    _equipmentsToDelete.add(value);
  }

  List<Equipment> getEquipaments() => equipmentsStore.data;

  late final AddEditMenaceActionsStore actionsStore;
  List<ActionEnt> _actionsToDelete = [];
  void addActionsToDelete(ActionEnt value) => _actionsToDelete.add(value);

  final _storageService = AddEditMenaceStorageService();

  Future<Menace?> onSave() async {
    final updatedAt = DateTime.now();
    final menace = Menace(
      createdAt: _createdAt ?? updatedAt,
      updatedAt: updatedAt,
      uuid: _uuid,
      name: _name!,
      nd: _nd!,
      initiative: _initiative!,
      perception: _perception!,
      defense: _defense!,
      life: _life!,
      mana: _mana!,
      type: typeStore.data!,
      creatureSize: sizeStore.data!,
      combatRole: combateRoleStore.data!,
      strength: _strength!,
      charisma: _charisma!,
      constitution: _constitution!,
      dexterity: _dexterity!,
      intelligence: _intelligence!,
      wisdom: _wisdom!,
      fortResistence: _resisFort!,
      refResistence: _resisRef!,
      vonResistence: _resisVon!,
      senses: _senses,
      desc: _desc,
      imageAsset: _imageAsset,
      imagePath: _imagePath,
      casterInfos: _casterInfos,
      displacement: _displacement,
      extraInfos: _extraInfos,
      divinityId: _divinityId,
      treasures: treasureTypeStore.data,
      actions: actionsStore.data,
      expertises: expertisesStore.data,
      magics: magicsStore.data,
      generalSkills: skillsStore.data,
      equipments: equipmentsStore.data,
      boards: [],
      boardsLinkeds: [],
    );

    final result = await _storageService.saveMenace(
      menace: menace,
      magicsToDelete: _magicsToDelete,
      skillsToDelete: _skillsToDelete,
      expertisesToDelete: _expertisesToDelete,
      actionsToDelete: _actionsToDelete,
      equipmentsToDelete: _equipmentsToDelete,
    );

    if (result == null) {
      return menace;
    }

    return null;
  }

  dispose() {
    treasureTypeStore.dispose();
    stage.dispose();
    percent.dispose();
    typeStore.dispose();
    sizeStore.dispose();
    combateRoleStore.dispose();
    expertisesStore.dispose();
    skillsStore.dispose();
    magicsStore.dispose();
    equipmentsStore.dispose();
    actionsStore.dispose();
  }
}
