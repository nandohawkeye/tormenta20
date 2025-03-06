import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_purpose.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipament_weapon_purpose_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentWeaponPurposeTypeField extends StatelessWidget {
  const AddEditEquipmentWeaponPurposeTypeField(this.store, {super.key});

  final SelectorOnlyStore<WeaponPurpose> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<WeaponPurpose>(
      label: 'Propósito',
      handleTitle: EquipamentWeaponPurposeUtils.handleTitle,
      itens: WeaponPurpose.values,
      store: store,
      isObrigatory: true,
    );
  }
}
