// ignore_for_file: prefer_final_fields

import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character_storage_service.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_actions_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_alignment_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_atribute_dices_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_brood_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_classe_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_equipment_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_origins_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_powers_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_size_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_trained_expertises_store.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/entities/classe_type_character.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/entities/equipament/backpack.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/entities/origin.dart';
import 'package:tormenta20/src/shared/entities/power.dart';
import 'package:tormenta20/src/shared/widgets/change_atribute_field/change_atribute_store.dart';
import 'package:uuid/uuid.dart';

class AddEditCharacterController {
  AddEditCharacterController(Character? initial) {
    if (initial == null) {
      final now = DateTime.now();
      _uuid = const Uuid().v4();
      atributeDicesStore = AddEditCharacterAtributeDicesStore();
      broodStore = AddEditCharacterBroodStore(Brood.humano);
      classeStore = AddEditCharacterClasseStore(null);
      sizeStore = AddEditCharacterSizeStore(CreatureSizeCategory.medium);
      equipmentStore = AddEditCharacterEquipmentStore([
        Backpack(
          uuid: const Uuid().v4(),
          parentUuid: _uuid,
          createdAt: now,
          updatedAt: now,
        )
      ]);
      actionsStore = AddEditCharacterActionsStore([]);
      powersStore = AddEditCharacterPowersStore([]);
      originsStore = AddEditCharacterOriginsStore([]);
      trainedExpertisesStore = AddEditCharacterTrainedExpertisesStore([]);
      alignmentStore = AddEditCharacterAlignmentStore(null);
      _defense = 10;
    } else {
      _isEdit = true;
      _uuid = initial.uuid;
      _createdAt = initial.createdAt;
      _grimoire = initial.grimorie;
      _classeUuid = initial.classe?.uuid;
      _name = initial.name;
      _senses = initial.senses;
      _displacement = initial.displacement;
      _defense = initial.defense;
      _imageAsset = initial.imageAsset;
      _imagePath = initial.imagePath;
      _divinityId = initial.divinityId;
      _life = initial.life;
      _mana = initial.mana;

      strengthStore = ChangeAtributeStore(initial.strength ?? 0);
      dexterityStore = ChangeAtributeStore(initial.dexterity ?? 0);
      constituionStore = ChangeAtributeStore(initial.constitution ?? 0);
      inteligenceStore = ChangeAtributeStore(initial.intelligence ?? 0);
      wisdonStore = ChangeAtributeStore(initial.wisdom ?? 0);
      charismaStore = ChangeAtributeStore(initial.charisma ?? 0);

      alignmentStore = AddEditCharacterAlignmentStore(initial.alignmentType);
      broodStore = AddEditCharacterBroodStore(initial.brood);
      classeStore = AddEditCharacterClasseStore(initial.classe?.type);
      sizeStore = AddEditCharacterSizeStore(initial.creatureSize);
      equipmentStore = AddEditCharacterEquipmentStore(initial.equipments);
      actionsStore = AddEditCharacterActionsStore(initial.actions);
      powersStore = AddEditCharacterPowersStore(initial.powers);
      originsStore = AddEditCharacterOriginsStore(initial.origins);
      trainedExpertisesStore =
          AddEditCharacterTrainedExpertisesStore(initial.trainedExpertises);
    }
  }

  final AddEditCharacterStorageService _storageService =
      AddEditCharacterStorageService();

  late final AddEditCharacterAtributeDicesStore atributeDicesStore;
  late final AddEditCharacterBroodStore broodStore;
  late final AddEditCharacterClasseStore classeStore;
  late final AddEditCharacterSizeStore sizeStore;
  late final AddEditCharacterEquipmentStore equipmentStore;
  late final AddEditCharacterActionsStore actionsStore;
  late final AddEditCharacterTrainedExpertisesStore trainedExpertisesStore;
  late final AddEditCharacterPowersStore powersStore;
  late final AddEditCharacterOriginsStore originsStore;
  late final AddEditCharacterAlignmentStore alignmentStore;
  late final ChangeAtributeStore strengthStore;
  late final ChangeAtributeStore dexterityStore;
  late final ChangeAtributeStore constituionStore;
  late final ChangeAtributeStore inteligenceStore;
  late final ChangeAtributeStore wisdonStore;
  late final ChangeAtributeStore charismaStore;

  List<Equipment> _equipmentsToDelete = [];
  void setEquipmentToDelete(Equipment value) => _equipmentsToDelete.add(value);
  List<Equipment> getEquipments() => equipmentStore.data;

  List<ActionEnt> _actionsToDelete = [];
  void setActionToDelete(ActionEnt value) => _actionsToDelete.add(value);

  List<Power> _powerToDelete = [];
  void setPowerToDelete(Power value) => _powerToDelete.add(value);

  List<Origin> _originToDelete = [];
  void setOriginToDelete(Origin value) => _originToDelete.add(value);

  DateTime? _createdAt;

  String? _classeUuid;

  late final String _uuid;
  String get characterUuid => _uuid;

  bool _isEdit = false;
  bool get isEdit => _isEdit;

  void createDices() => atributeDicesStore.createDicesAndRoll();

  String? _name;
  String? get name => _name;
  void onChangeName(String? value) {
    if (value == null) return;

    _name = value;
  }

  String? _imageAsset;
  String? get imageAsset => _imageAsset;
  void changeAsset(String? value) => _imageAsset = value;

  Grimoire? _grimoire;
  Grimoire? get grimoire => _grimoire;
  void changeGrimoire(Grimoire? value) => _grimoire = value;

  String? _imagePath;
  String? get imagePath => _imagePath;
  void changePath(String? value) => _imagePath = value;

  int? _divinityId;
  int? get divinityId => _divinityId;
  void onChangeDivinityId(int? value) => _divinityId = value;

  int? _life;
  int? get life => _life;
  void onChangeLife(String? value) {
    if (value == null) return;

    _life = int.parse(value);
  }

  int? _mana;
  int? get mana => _mana;
  void onChangeMana(String? value) {
    if (value == null) return;

    _mana = int.parse(value);
  }

  int? _defense;
  int? get defense => _defense;
  void onChangeDefense(String? value) {
    if (value == null) return;

    _defense = int.parse(value);
  }

  String? _senses;
  String? get senses => _senses;
  void changeSenses(String? value) => _senses = value;

  String? _displacement;
  String? get displacement => _displacement;
  void changeDisplacment(String? value) => _displacement = value;

  Future<Character?> onSave() async {
    if (!isEdit) {
      if (!atributeDicesStore.validade()) return null;
    }

    if (!classeStore.validate()) return null;

    if (!alignmentStore.validate()) return null;

    late final Character character;

    final ClasseTypeCharacter classe = ClasseTypeCharacter(
      uuid: _classeUuid ?? const Uuid().v4(),
      type: classeStore.data!,
      level: 1,
      characterUuid: _uuid,
    );

    if (!isEdit) {
      final now = DateTime.now();
      character = Character(
        imageAsset: _imageAsset,
        imagePath: _imagePath,
        divinityId: _divinityId,
        displacement: _displacement,
        senses: _senses,
        uuid: _uuid,
        name: _name!.trim(),
        defense: _defense!,
        life: _life!,
        mana: _mana!,
        strength: atributeDicesStore.dices
            .firstWhere((d) => d.atribute == Atribute.strength)
            .atributeValue,
        dexterity: atributeDicesStore.dices
            .firstWhere((d) => d.atribute == Atribute.dexterity)
            .atributeValue,
        constitution: atributeDicesStore.dices
            .firstWhere((d) => d.atribute == Atribute.constitution)
            .atributeValue,
        intelligence: atributeDicesStore.dices
            .firstWhere((d) => d.atribute == Atribute.intelligence)
            .atributeValue,
        wisdom: atributeDicesStore.dices
            .firstWhere((d) => d.atribute == Atribute.wisdom)
            .atributeValue,
        charisma: atributeDicesStore.dices
            .firstWhere((d) => d.atribute == Atribute.charisma)
            .atributeValue,
        grimorie: _grimoire,
        origins: originsStore.data,
        brood: broodStore.data!,
        creatureSize: sizeStore.data!,
        createdAt: now,
        updatedAt: now,
        equipments: equipmentStore.data,
        actions: actionsStore.data,
        alignmentType: alignmentStore.data!,
        trainedExpertises: trainedExpertisesStore.data,
        powers: powersStore.data,
        classe: classe,
        characterBoards: [],
      );
    } else {
      character = Character(
        imageAsset: _imageAsset,
        imagePath: _imagePath,
        divinityId: _divinityId,
        displacement: _displacement,
        senses: _senses,
        uuid: _uuid,
        name: _name!.trim(),
        defense: _defense!,
        life: _life!,
        mana: _mana!,
        strength: strengthStore.value,
        dexterity: dexterityStore.value,
        constitution: constituionStore.value,
        intelligence: inteligenceStore.value,
        wisdom: wisdonStore.value,
        charisma: charismaStore.value,
        grimorie: _grimoire,
        origins: originsStore.data,
        brood: broodStore.data!,
        creatureSize: sizeStore.data!,
        createdAt: _createdAt!,
        updatedAt: DateTime.now(),
        equipments: equipmentStore.data,
        actions: actionsStore.data,
        alignmentType: alignmentStore.data!,
        trainedExpertises: trainedExpertisesStore.data,
        powers: powersStore.data,
        classe: classe,
        characterBoards: [],
      );
    }

    final failure = await _storageService.saveCharacter(
      entity: character,
      powerToDelete: _powerToDelete,
      originToDelete: _originToDelete,
      actionsToDelete: _actionsToDelete,
      equipmentsToDelete: _equipmentsToDelete,
    );

    if (failure != null) {
      return null;
    }

    return character;
  }

  void dispose() {
    broodStore.dispose();
    classeStore.dispose();
    sizeStore.dispose();
    equipmentStore.dispose();
    actionsStore.dispose();
    powersStore.dispose();
    originsStore.dispose();
    alignmentStore.dispose();
    trainedExpertisesStore.dispose();

    try {
      atributeDicesStore.dispose();
    } catch (_) {}

    try {
      strengthStore.dispose();
      dexterityStore.dispose();
      constituionStore.dispose();
      inteligenceStore.dispose();
      wisdonStore.dispose();
      charismaStore.dispose();
    } catch (_) {}
  }
}
