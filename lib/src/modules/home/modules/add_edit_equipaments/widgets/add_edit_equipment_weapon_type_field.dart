import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/weapon_type.dart';
import 'package:tormenta20/src/shared/utils/equipment_weapon_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentWeaponTypeField extends StatelessWidget {
  const AddEditEquipmentWeaponTypeField(this.store, {super.key});

  final SelectorOnlyStore<WeaponType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<WeaponType>(
      label: 'Tipos de arma',
      handleTitle: EquipmentWeaponTypeUtils.handleTitle,
      itens: WeaponType.values,
      store: store,
      isObrigatory: true,
    );
  }
}
