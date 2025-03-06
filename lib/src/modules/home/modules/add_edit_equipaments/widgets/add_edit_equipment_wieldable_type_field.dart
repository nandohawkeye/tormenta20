import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/Wieldable_type.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_wieldable_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentWieldableTypeField extends StatelessWidget {
  const AddEditEquipmentWieldableTypeField(this.store, {super.key});

  final SelectorOnlyStore<WieldableType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<WieldableType>(
      label: 'Empunhadura',
      handleTitle: EquipmentWieldableTypeUtils.handleTitle,
      itens: WieldableType.values,
      store: store,
      isObrigatory: true,
    );
  }
}
