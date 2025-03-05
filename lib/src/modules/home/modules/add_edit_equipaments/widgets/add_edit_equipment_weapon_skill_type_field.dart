import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_skills.dart';
import 'package:tormenta20/src/shared/utils/equipment_weapon_skill_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_store.dart';

class AddEditEquipmentWeaponSkillTypeField extends StatelessWidget {
  const AddEditEquipmentWeaponSkillTypeField(this.store, {super.key});

  final SelectorMultiStore<WeaponSkills> store;

  @override
  Widget build(BuildContext context) {
    return SelectorMultiField<WeaponSkills>(
      label: 'Habilidades',
      handleTitle: EquipmentWeaponSkillTypeUtils.handleTitle,
      itens: WeaponSkills.values,
      store: store,
    );
  }
}
