import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_skills.dart';
import 'package:tormenta20/src/shared/utils/equipment_weapon_skill_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditEquipmentWeaponSkillTypeField extends StatefulWidget {
  const AddEditEquipmentWeaponSkillTypeField({super.key});

  // final AddEditMenaceController controller;

  @override
  State<AddEditEquipmentWeaponSkillTypeField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipmentWeaponSkillTypeField> {
  late final ValueNotifier<WeaponSkills?> _selected;
  void _setSelected(WeaponSkills? value) {
    _selected.value = value;

    // widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<WeaponSkills?>(null);
  }

  @override
  void dispose() {
    _selected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selected,
      builder: (_, selected, __) {
        return SelectorOnlyField<WeaponSkills>(
          label: 'Habilidades',
          handleTitle: EquipmentWeaponSkillTypeUtils.handleTitle,
          itens: WeaponSkills.values,
          onTap: _setSelected,
          selected: selected,
        );
      },
    );
  }
}
