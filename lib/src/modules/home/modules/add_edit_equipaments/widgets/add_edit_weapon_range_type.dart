import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment_weapon_range_type.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_weapon_range_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditWeaponRangeType extends StatelessWidget {
  const AddEditWeaponRangeType(this.store, {super.key});

  final SelectorOnlyStore<EquipmentWeaponRangeType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<EquipmentWeaponRangeType>(
      label: 'Alcance',
      handleTitle: EquipmentWeaponRangeTypeUtils.handleTitle,
      itens: EquipmentWeaponRangeType.values,
      store: store,
      isObrigatory: true,
    );
  }
}
