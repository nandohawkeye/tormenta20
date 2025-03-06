import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipments_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_improvement_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_proficiency_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_screen_item.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_special_materials_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_weapon_purpose_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_weapon_skill_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_weapon_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_equipment_wieldable_type_field.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/widgets/add_edit_weapon_range_type.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_critical_field/add_edit_critical_field.dart';
import 'package:tormenta20/src/shared/widgets/add_edit_dices_field/add_edit_dices_field.dart';
import 'package:tormenta20/src/shared/widgets/textfields/desc_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/name_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/ocuped_spaces_textfield.dart';
import 'package:tormenta20/src/shared/widgets/textfields/price_textfield.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_checkable.dart';
import 'package:tormenta20/src/shared/widgets/textfields/steps_weapon_textfield.dart';

class WeaponWidgetsGroup extends StatelessWidget {
  const WeaponWidgetsGroup(this.controller, this.hasInited, {super.key});

  final AddEditEquipmentsController controller;
  final bool hasInited;

  @override
  Widget build(BuildContext context) {
    return AddEditEquipmentScreenItem(
      hasInited: hasInited,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: NameTextField(
              initialName: controller.name,
              onchange: controller.changeName,
            ),
          ),
          T20UI.spaceHeight,
          AddEditEquipmentWeaponTypeField(controller.weaponTypeStore),
          T20UI.spaceHeight,
          AddEditEquipmentWeaponPurposeTypeField(controller.purposeTypeStore),
          T20UI.spaceHeight,
          AddEditEquipmentWieldableTypeField(controller.wieldableTypeStore),
          T20UI.spaceHeight,
          AddEditEquipmentProficiencyTypeField(controller.proficiencyTypeStore),
          T20UI.spaceHeight,
          AddEditWeaponRangeType(controller.rangeTypeStore),
          T20UI.spaceHeight,
          ValueListenableBuilder(
            valueListenable: controller.errorDices,
            builder: (_, hasError, __) {
              return AddEditDicesField(
                initialValue: controller.dices,
                isObrigatory: true,
                hasError: hasError,
                onChangeValues: controller.onChangeDice,
              );
            },
          ),
          T20UI.spaceHeight,
          ValueListenableBuilder(
            valueListenable: controller.errorCritical,
            builder: (_, hasError, __) {
              return AddEditCriticalField(
                isObrigatory: true,
                hasError: hasError,
                initialMultiplier: controller.criticalMultiplier,
                initialValue: controller.critical,
                onChangeMultiplier: controller.changeCriticalMultiplier,
                onChangeValue: controller.changeCritical,
              );
            },
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: SelectorCheckable(
              label: 'Arma natural',
              initialValue: controller.isNaturalWeapon,
              changeValue: controller.changeIsNatural,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: SelectorCheckable(
              label: 'Ataque Desarmado',
              initialValue: controller.isUnarmed,
              changeValue: controller.changeIsUnarmed,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: PriceTextfield(
              initialValue: controller.price,
              onchange: controller.changePrice,
            ),
          ),
          T20UI.spaceHeight,
          AddEditEquipmentWeaponSkillTypeField(controller.skillTypeStore),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: StepsWeaponTextfield(
              initialValue: controller.steps,
              onchange: controller.changeSteps,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: OcupedSpacesTextfield(
              initialValue: controller.ocupadeSpace,
              onchange: controller.changeOcupadeSpace,
            ),
          ),
          T20UI.spaceHeight,
          Padding(
            padding: T20UI.horizontallScreenPadding,
            child: DescTextfield(
              initialDesc: controller.desc,
              isObrigatory: false,
              onchange: controller.changeDesc,
            ),
          ),
          T20UI.spaceHeight,
          AddEditEquipmentImprovementTypeField(controller.improvementTypeStore),
          T20UI.spaceHeight,
          AddEditEquipmentSpecialMaterialsTypeField(
              controller.materialTypeStore),
          T20UI.spaceHeight,
        ],
      ),
    );
  }
}
