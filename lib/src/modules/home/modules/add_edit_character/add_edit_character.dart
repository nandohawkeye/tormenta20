// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/add_edit_character_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_character_atributes_fields.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_actions_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_add_warning.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_alignment_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_brood_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_dice_selector/add_edit_character_classe_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_edit_warning.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_equipment_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_grimorie_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_origins_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_powers_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_size_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/add_edit_character_trained_expertises.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_character/widgets/edit_character_atributes_fields.dart';
import 'package:tormenta20/src/shared/entities/character.dart';
import 'package:tormenta20/src/shared/widgets/divinity_selector/divinity_selector.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/textfields/defense_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/displacements_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/life_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/mana_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/perception_textfield.dart';
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
  final _formKey = GlobalKey<FormState>();
  late final AddEditCharacterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AddEditCharacterController(widget.initial);
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
      onSave: () async {
        if (_formKey.currentState?.validate() ?? false) {
          final character = await _controller.onSave();
          if (character != null) {
            Navigator.pop(context, character);
          }
        }
      },
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            T20UI.spaceHeight,
            if (_controller.isEdit) const AddEditCharacterEditWarning(),
            if (!_controller.isEdit) const AddEditCharacterAddWarning(),
            T20UI.spaceHeight,
            TokenSelector(
              allTokens: [
                ...Assets.tokensLendas.values.map((t) => t.path),
                ...Assets.tokens.values.map((t) => t.path)
              ],
              isMenace: false,
              changeAsset: _controller.changeAsset,
              changePath: _controller.changePath,
              initalImageAsset: widget.initial?.imageAsset,
              initialImagePath: widget.initial?.imagePath,
              size: 80,
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: NameTextField(
                initialName: widget.initial?.name,
                onchange: _controller.onChangeName,
              ),
            ),
            T20UI.spaceHeight,
            if (_controller.isEdit) EditCharacterAtributesFields(_controller),
            if (!_controller.isEdit) AddCharacterAtributesFields(_controller),
            T20UI.spaceHeight,
            AddEditCharacterBroodSelector(_controller.broodStore),
            T20UI.spaceHeight,
            AddEditCharacterClasseSelector(_controller.classeStore),
            T20UI.spaceHeight,
            AddEditCharacterSizeSelector(_controller.sizeStore),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: LifeTextField(
                      onchange: _controller.onChangeLife,
                      initialLife: widget.initial?.life,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: ManaTextField(
                      onchange: _controller.onChangeMana,
                      initialMana: widget.initial?.mana,
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
                      onchange: _controller.onChangePerception,
                      initialPerception: widget.initial?.perception,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: DefenseTextField(
                      onchange: _controller.onChangeDefense,
                      initialDefense: widget.initial?.defense,
                    ),
                  ),
                ],
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: SensesTextfield(
                onchange: _controller.changeSenses,
                initialValue: widget.initial?.senses,
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: DisplacementsTextfield(
                onchange: _controller.changeDisplacment,
                initialValue: widget.initial?.displacement,
              ),
            ),
            T20UI.spaceHeight,
            AddEditCharacterEquipmentSelector(
              store: _controller.equipmentStore,
              onAddDeleteList: _controller.setEquipmentToDelete,
              characterUuid: _controller.characterUuid,
            ),
            T20UI.spaceHeight,
            AddEditCharacterActionsSelector(
              store: _controller.actionsStore,
              getEquipaments: _controller.getEquipments,
              characterUuid: _controller.characterUuid,
              onAddDeleteList: _controller.setActionToDelete,
            ),
            T20UI.spaceHeight,
            DivinitySelector(
              onSelectDivinity: _controller.onChangeDivinityId,
              initialDivinityId: widget.initial?.divinityId,
            ),
            T20UI.spaceHeight,
            AddEditCharacterTrainedExpertises(
              store: _controller.trainedExpertisesStore,
              characterUuid: _controller.characterUuid,
              onAddDeleteList: (_) {},
            ),
            T20UI.spaceHeight,
            AddEditCharacterPowersSelector(
              store: _controller.powersStore,
              characterUuid: _controller.characterUuid,
              onAddDeleteList: _controller.setPowerToDelete,
            ),
            T20UI.spaceHeight,
            AddEditCharacterOriginsSelector(
              store: _controller.originsStore,
              characterUuid: _controller.characterUuid,
              onAddDeleteList: _controller.setOriginToDelete,
            ),
            T20UI.spaceHeight,
            AddEditCharacterGrimorieSelector(
              onchange: _controller.changeGrimoire,
              initialSelected: widget.initial?.grimorie,
            ),
            T20UI.spaceHeight,
            AddEditCharacterAlignmentSelector(_controller.alignmentStore),
            T20UI.spaceHeight,
          ],
        ),
      ),
    );
  }
}
