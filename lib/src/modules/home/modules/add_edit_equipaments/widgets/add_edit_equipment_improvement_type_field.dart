import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/improvement_types.dart';
import 'package:tormenta20/src/shared/utils/equipment/equipment_improvement_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_store.dart';

class AddEditEquipmentImprovementTypeField extends StatelessWidget {
  const AddEditEquipmentImprovementTypeField(this.store, {super.key});

  final SelectorMultiStore<ImprovementTypes> store;

  @override
  Widget build(BuildContext context) {
    return SelectorMultiField<ImprovementTypes>(
      label: 'Melhorias',
      handleTitle: EquipmentImprovementTypeUtils.handleTitle,
      itens: ImprovementTypes.values,
      store: store,
    );
  }
}
