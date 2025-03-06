import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/shield_type.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_shield_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentShieldType extends StatelessWidget {
  const AddEditEquipmentShieldType(
    this.store, {
    super.key,
    this.onChange,
  });

  final SelectorOnlyStore<ShieldType> store;
  final Function(ShieldType?)? onChange;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<ShieldType>(
      label: 'Tipos de escudo',
      handleTitle: EquipmentShieldTypeUtils.handleTitle,
      itens: ShieldType.values,
      store: store,
      onChange: onChange,
      isObrigatory: true,
    );
  }
}
