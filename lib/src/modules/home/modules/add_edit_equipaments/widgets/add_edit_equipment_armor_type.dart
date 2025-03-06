import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/armor_type.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_armor_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentArmorType extends StatelessWidget {
  const AddEditEquipmentArmorType(
    this.store, {
    super.key,
    this.onChange,
  });

  final SelectorOnlyStore<ArmorType> store;
  final Function(ArmorType?)? onChange;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<ArmorType>(
      label: 'Tipos de armadura',
      handleTitle: EquipmentArmorTypeUtils.handleTitle,
      itens: ArmorType.values,
      store: store,
      onChange: onChange,
      isObrigatory: true,
    );
  }
}
