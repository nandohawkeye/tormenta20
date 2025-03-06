import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_proficiency.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_proficiency_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentProficiencyTypeField extends StatelessWidget {
  const AddEditEquipmentProficiencyTypeField(this.store, {super.key});

  final SelectorOnlyStore<WeaponProficiency> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<WeaponProficiency>(
      label: 'Proficiência',
      handleTitle: EquipmentProficiencyTypeUtils.handleTitle,
      itens: WeaponProficiency.values,
      isObrigatory: true,
      store: store,
    );
  }
}
