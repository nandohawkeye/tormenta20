import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_actions_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_alignment_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_brood_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_classe_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_equipment_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_origins_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_powers_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_size_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/stores/add_edit_character_trained_expertises_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_actions_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_alignment_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_brood_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_dice_selector/add_edit_character_classe_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_dice_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_equipment_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_grimorie_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_origins_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_powers_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_size_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_trained_expertises.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/atribute_dice_field.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/widgets/divinity_selector/divinity_selector.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/textfields/defense_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/displacements_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/life_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/mana_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/perception_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/resis_fort_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/resis_ref_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/resis_von_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/senses_textfield.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_selector.dart';

class AddEditCharacter extends StatefulWidget {
  const AddEditCharacter({
    super.key,
    this.initial,
  });

  final Character? initial;

  @override
  State<AddEditCharacter> createState() => _AddEditCharacterState();
}

class _AddEditCharacterState extends State<AddEditCharacter> {
  late final AddEditCharacterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddEditCharacterController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Criar personagem',
      onSave: () {},
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T20UI.spaceHeight,
          TokenSelector(
            allTokens: [
              ...Assets.tokensLendas.values.map((t) => t.path),
              ...Assets.tokens.values.map((t) => t.path)
            ],
            isMenace: false,
            changeAsset: (_) {},
            changePath: (_) {},
            initalImageAsset: null,
            initialImagePath: null,
            size: 80,
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: NameTextField(
              initialName: null,
              onchange: (_) {},
            ),
          ),
          T20UI.spaceHeight,
          AnimatedBuilder(
            animation: _controller.atributeDicesStore,
            builder: (_, __) {
              final strengthDice =
                  _controller.atributeDicesStore.dices.firstWhereOrNull(
                (at) => at.atribute == Atribute.strength,
              );

              final dexterityDice =
                  _controller.atributeDicesStore.dices.firstWhereOrNull(
                (at) => at.atribute == Atribute.dexterity,
              );

              final constitutionDice =
                  _controller.atributeDicesStore.dices.firstWhereOrNull(
                (at) => at.atribute == Atribute.constitution,
              );

              return Padding(
                padding: T20UI.horizontallScreenPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: AtributeDiceField(
                        atribute: Atribute.strength,
                        value: (strengthDice?.atributeValue ?? 0).abs(),
                        setAtribute: _controller.atributeDicesStore.setAtribute,
                        isNegative:
                            (strengthDice?.atributeValue ?? 0).isNegative,
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: AtributeDiceField(
                        atribute: Atribute.dexterity,
                        value: (dexterityDice?.atributeValue ?? 0).abs(),
                        setAtribute: _controller.atributeDicesStore.setAtribute,
                        isNegative:
                            (dexterityDice?.atributeValue ?? 0).isNegative,
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: AtributeDiceField(
                        atribute: Atribute.constitution,
                        value: (constitutionDice?.atributeValue ?? 0).abs(),
                        setAtribute: _controller.atributeDicesStore.setAtribute,
                        isNegative:
                            (constitutionDice?.atributeValue ?? 0).isNegative,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          T20UI.spaceHeight,
          AnimatedBuilder(
            animation: _controller.atributeDicesStore,
            builder: (_, __) {
              final intelligenceDice =
                  _controller.atributeDicesStore.dices.firstWhereOrNull(
                (at) => at.atribute == Atribute.intelligence,
              );

              final wisdomDice =
                  _controller.atributeDicesStore.dices.firstWhereOrNull(
                (at) => at.atribute == Atribute.wisdom,
              );

              final charismaDice =
                  _controller.atributeDicesStore.dices.firstWhereOrNull(
                (at) => at.atribute == Atribute.charisma,
              );

              return Padding(
                padding: T20UI.horizontallScreenPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: AtributeDiceField(
                        atribute: Atribute.intelligence,
                        value: (intelligenceDice?.atributeValue ?? 0).abs(),
                        setAtribute: _controller.atributeDicesStore.setAtribute,
                        isNegative:
                            (intelligenceDice?.atributeValue ?? 0).isNegative,
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: AtributeDiceField(
                        atribute: Atribute.wisdom,
                        value: (wisdomDice?.atributeValue ?? 0).abs(),
                        isNegative: (wisdomDice?.atributeValue ?? 0).isNegative,
                        setAtribute: _controller.atributeDicesStore.setAtribute,
                      ),
                    ),
                    T20UI.spaceWidth,
                    Expanded(
                      child: AtributeDiceField(
                        atribute: Atribute.charisma,
                        value: (charismaDice?.atributeValue ?? 0).abs(),
                        setAtribute: _controller.atributeDicesStore.setAtribute,
                        isNegative:
                            (charismaDice?.atributeValue ?? 0).isNegative,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          AddEditCharacterDiceSelector(_controller.atributeDicesStore),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: MainButton(
              label: 'Rolar dados',
              icon: FontAwesomeIcons.dice,
              onTap: _controller.createDices,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                    horizontal: T20UI.spaceSize + T20UI.spaceSize)
                .copyWith(top: 8),
            child: Text(
              'Obrigatório, aperte em "🎲 Rolar dados", selecione o dado e depois o atributo.',
              maxLines: 10,
              style: TextStyle(fontSize: 12),
            ),
          ),
          T20UI.spaceHeight,
          AddEditCharacterBroodSelector(AddEditCharacterBroodStore(null)),
          T20UI.spaceHeight,
          AddEditCharacterClasseSelector(AddEditCharacterClasseStore(null)),
          T20UI.spaceHeight,
          AddEditCharacterSizeSelector(AddEditCharacterSizeStore(null)),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: Row(
              children: [
                Expanded(
                  child: LifeTextField(
                    onchange: (_) {},
                    initialLife: null,
                  ),
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: ManaTextField(
                    onchange: (_) {},
                    initialMana: null,
                  ),
                ),
              ],
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: Row(
              children: [
                Expanded(
                  child: PerceptionTextfield(
                    onchange: (_) {},
                    initialPerception: null,
                  ),
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: DefenseTextField(
                    onchange: (_) {},
                    initialDefense: null,
                  ),
                ),
              ],
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: Row(
              children: [
                Expanded(
                  child: ResisFortTextfield(
                    onchange: (_) {},
                    initialValue: null,
                  ),
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: ResisRefTextfield(
                    onchange: (_) {},
                    initialValue: null,
                  ),
                ),
                T20UI.spaceWidth,
                Expanded(
                  child: ResisVonTextfield(
                    onchange: (_) {},
                    initialValue: null,
                  ),
                ),
              ],
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: SensesTextfield(
              onchange: (_) {},
              initialValue: null,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: DisplacementsTextfield(
              onchange: (_) {},
              initialValue: null,
            ),
          ),
          T20UI.spaceHeight,
          AddEditCharacterEquipmentSelector(
            store: AddEditCharacterEquipmentStore([]),
            onAddDeleteList: (_) {},
            characterUuid: '',
          ),
          T20UI.spaceHeight,
          AddEditCharacterActionsSelector(
            store: AddEditCharacterActionsStore([]),
            getEquipaments: () => [],
            characterUuid: '',
            onAddDeleteList: (_) {},
          ),
          T20UI.spaceHeight,
          DivinitySelector(
            onSelectDivinity: (_) {},
            initialDivinityId: null,
          ),
          T20UI.spaceHeight,
          AddEditCharacterTrainedExpertises(
            store: AddEditCharacterTrainedExpertisesStore([]),
            getTrainedExpertises: () => [],
            characterUuid: '',
            onAddDeleteList: (_) {},
          ),
          T20UI.spaceHeight,
          AddEditCharacterPowersSelector(
            store: AddEditCharacterPowersStore([]),
            getPowers: () => [],
            characterUuid: '',
            onAddDeleteList: (_) {},
          ),
          T20UI.spaceHeight,
          AddEditCharacterOriginsSelector(
            store: AddEditCharacterOriginsStore([]),
            getOrigins: () => [],
            characterUuid: '',
            onAddDeleteList: (_) {},
          ),
          T20UI.spaceHeight,
          AddEditCharacterGrimorieSelector(
            onchange: (_) {},
            initialSelected: null,
          ),
          T20UI.spaceHeight,
          AddEditCharacterAlignmentSelector(
              AddEditCharacterAlignmentStore(null)),
          T20UI.spaceHeight,
        ],
      ),
    );
  }
}
