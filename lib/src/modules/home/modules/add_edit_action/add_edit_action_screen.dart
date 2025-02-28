import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/add_edit_action_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/widgets/add_edit_action_type_attack_action_selector.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/widgets/add_edit_type_action_field/add_edit_type_action_field.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_critical_field/add_edit_critical_field.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_dices_field/add_edit_dices_field.dart';
import 'package:tormenta20/src/shared/widgets/cd_textfield.dart';
import 'package:tormenta20/src/shared/widgets/desc_textfield.dart';
import 'package:tormenta20/src/shared/widgets/medio_damage_value_textfield.dart';
import 'package:tormenta20/src/shared/widgets/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/pm_textfield.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/select_equipament_field/select_equipament_field.dart';

class AddEditActionScreen extends StatefulWidget {
  const AddEditActionScreen({super.key, this.action, required this.menaceUuid});

  final ActionEnt? action;
  final String menaceUuid;

  @override
  State<AddEditActionScreen> createState() => _AddEditActionScreenState();
}

class _AddEditActionScreenState extends State<AddEditActionScreen> {
  final _formKey = GlobalKey<FormState>();
  late final AddEditActionStore _store;

  @override
  void initState() {
    super.initState();
    _store = AddEditActionStore();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Ação',
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            T20UI.spaceHeight,
            AddEditAttackActionTypeActionSelector(
              store: _store,
            ),
            T20UI.spaceHeight,
            AddEditTypeActionField(
              store: _store,
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: NameTextField(
                onchange: (_) {},
                initialName: null,
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: DescTextfield(
                onchange: (_) {},
                initialDesc: null,
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: PmTextfield(
                      onchange: (_) {},
                      initialValue: null,
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: CdTextfield(
                      onchange: (_) {},
                      initialValue: null,
                    ),
                  )
                ],
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: AddEditDicesField(
                initialValue: null,
                onChangeValues: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: AddEditDicesField(
                isExtra: true,
                initialValue: null,
                onChangeValues: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: AddEditCriticalField(
                initialMultiplier: null,
                initialValue: null,
                onChangeMultiplier: (_) {},
                onChangeValue: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: MedioDamageValueTextfield(
                initialValue: null,
                onchange: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            const SelectEquipamentField(),
            T20UI.spaceHeight,
          ],
        ),
      ),
      onSave: () {
        // final isMagicValid = _store.isMagicValid();

        // if (!isMagicValid) return;

        // if (_formKey.currentState!.validate()) {
        //   final magic = _store.onSave();

        //   Navigator.pop(context, magic);
        // }
      },
    );
  }
}
