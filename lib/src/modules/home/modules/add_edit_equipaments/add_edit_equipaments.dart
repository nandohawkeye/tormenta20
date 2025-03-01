import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_improvement_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_proficiency_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_special_materials_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_type.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_weapon_purpose_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_weapon_skill_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_weapon_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_wieldable_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_weapon_range_type.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_critical_field/add_edit_critical_field.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_dices_field/add_edit_dices_field.dart';
import 'package:tormenta20/src/shared/widgets/desc_textfield.dart';
import 'package:tormenta20/src/shared/widgets/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/ocuped_spaces_textfield.dart';
import 'package:tormenta20/src/shared/widgets/price_textfield.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_checkable.dart';
import 'package:tormenta20/src/shared/widgets/steps_weapon_textfield.dart';

class AddEditEquipaments extends StatefulWidget {
  const AddEditEquipaments(
      {super.key, this.equipament, required this.menaceUuid});

  final Equipment? equipament;
  final String menaceUuid;

  @override
  State<AddEditEquipaments> createState() => _AddEditActionScreenState();
}

class _AddEditActionScreenState extends State<AddEditEquipaments> {
  final _formKey = GlobalKey<FormState>();
  // late final AddEditActionStore _store;

  @override
  void initState() {
    super.initState();
    // _store = AddEditActionStore();
  }

  @override
  void dispose() {
    // _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Equipamento',
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            T20UI.spaceHeight,
            AddEditEquipamentType(),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: NameTextField(
                initialName: null,
                onchange: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            AddEditEquipmentWeaponTypeField(),
            T20UI.spaceHeight,
            AddEditEquipmentWeaponPurposeTypeField(),
            T20UI.spaceHeight,
            AddEditEquipmentWieldableTypeField(),
            T20UI.spaceHeight,
            AddEditEquipmentProficiencyTypeField(),
            T20UI.spaceHeight,
            AddEditWeaponRangeType(),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: AddEditDicesField(
                initialValue: null,
                isObrigatory: true,
                onChangeValues: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: AddEditCriticalField(
                isObrigatory: true,
                initialMultiplier: null,
                initialValue: null,
                onChangeMultiplier: (_) {},
                onChangeValue: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: SelectorCheckable(
                label: 'Arma natural',
                initialValue: false,
                changeValue: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: SelectorCheckable(
                label: 'Ataque Desarmado',
                initialValue: false,
                changeValue: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: PriceTextfield(
                initialValue: null,
                onchange: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            AddEditEquipmentWeaponSkillTypeField(),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: StepsWeaponTextfield(
                      initialValue: null,
                      onchange: (_) {},
                    ),
                  ),
                  T20UI.spaceWidth,
                  Expanded(
                    child: OcupedSpacesTextfield(
                      initialValue: null,
                      onchange: (_) {},
                    ),
                  ),
                ],
              ),
            ),
            T20UI.spaceHeight,
            Padding(
              padding: T20UI.horizontallScreenPadding,
              child: DescTextfield(
                initialDesc: null,
                isObrigatory: false,
                onchange: (_) {},
              ),
            ),
            T20UI.spaceHeight,
            AddEditEquipmentImprovementTypeField(),
            T20UI.spaceHeight,
            AddEditEquipmentSpecialMaterialsTypeField(),
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
