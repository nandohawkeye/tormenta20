import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/special_material_types.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_special_materials_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentSpecialMaterialsTypeField extends StatelessWidget {
  const AddEditEquipmentSpecialMaterialsTypeField(this.store, {super.key});

  final SelectorOnlyStore<SpecialMaterialTypes> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<SpecialMaterialTypes>(
      label: 'Materiais especiais',
      handleTitle: EquipmentSpecialMaterialsUtils.handleTitle,
      itens: SpecialMaterialTypes.values,
      store: store,
      hasRemoveAll: true,
    );
  }
}
