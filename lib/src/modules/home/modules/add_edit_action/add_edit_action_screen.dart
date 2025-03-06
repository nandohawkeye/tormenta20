import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/add_edit_action_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/widgets/add_edit_action_type_attack_action_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/widgets/add_edit_type_action_field/add_edit_type_action_field.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_critical_field/add_edit_critical_field.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_dices_field/add_edit_dices_field.dart';
import 'package:tormenta20/src/shared/widgets/textfields/cd_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/desc_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/medio_damage_value_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/pm_textfield.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/select_equipament_field/select_equipament_field.dart';

class AddEditActionScreen extends StatefulWidget {
  const AddEditActionScreen({
    super.key,
    this.initialAction,
    required this.menaceUuid,
    required this.equipments,
  });

  final ActionEnt? initialAction;
  final String menaceUuid;
  final List<Equipment> equipments;

  @override
  State<AddEditActionScreen> createState() => _AddEditActionScreenState();
}

class _AddEditActionScreenState extends State<AddEditActionScreen> {
  final _formKey = GlobalKey<FormState>();
  late final AddEditActionController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AddEditActionController(
      widget.initialAction,
      widget.menaceUuid,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Ação',
      scrollController: _scrollController,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: NameTextField(
                onchange: _controller.onChangeName,
                initialName: _controller.name,
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: DescTextfield(
                onchange: _controller.onChangeDesc,
                initialDesc: _controller.desc,
              ),
            ),
            T20UI.spaceHeight,
            AddEditAttackActionTypeActionSelector(
              store: _controller.classTypeStore,
              onChange: _controller.changeAttackActionType,
            ),
            T20UI.spaceHeight,
            AddEditTypeActionField(
              store: _controller.typeStore,
              onChange: _controller.onChangeType,
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: PmTextfield(
                      onchange: _controller.setPm,
                      initialValue: _controller.pm,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: CdTextfield(
                      onchange: _controller.setCd,
                      initialValue: _controller.cd,
                    ),
                  )
                ],
              ),
            ),
            T20UI.spaceHeight,
            SelectEquipamentField(
              equipaments: widget.equipments,
              initialSelected: _controller.equipment,
              onchange: _controller.onChangeEquipemt,
            ),
            T20UI.spaceHeight,
            AddEditDicesField(
              initialValue: _controller.dices,
              onChangeValues: _controller.onChangeDice,
              helpText: 'Esses dados substituiem os do equipamento!',
            ),
            T20UI.spaceHeight,
            AddEditDicesField(
              isExtra: true,
              initialValue: _controller.extraDices,
              onChangeValues: _controller.onChangeExtraDice,
            ),
            T20UI.spaceHeight,
            AddEditCriticalField(
              initialMultiplier: _controller.criticalMultiplier,
              initialValue: _controller.critical,
              onChangeMultiplier: _controller.changeCriticalMultiplier,
              onChangeValue: _controller.changeCritical,
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: MedioDamageValueTextfield(
                initialValue: _controller.mediumDamage,
                onchange: _controller.setMediumDamage,
              ),
            ),
            T20UI.spaceHeight,
          ],
        ),
      ),
      onSave: () {
        _scrollController.animateTo(
          0,
          duration: T20UI.defaultDurationAnimation,
          curve: Curves.easeIn,
        );
        if (_formKey.currentState!.validate()) {
          final action = _controller.onSave();

          if (action != null) {
            Navigator.pop(context, action);
          }
        }
      },
    );
  }
}
