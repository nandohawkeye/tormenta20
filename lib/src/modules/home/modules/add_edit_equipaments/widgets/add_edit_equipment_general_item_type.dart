import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/equipament/general_item_type.dart';
import 'package:tormenta20/src/shared/utils/equipment_geneal_item_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditEquipmentGeneralItemType extends StatelessWidget {
  const AddEditEquipmentGeneralItemType(
    this.store, {
    super.key,
    this.onChange,
  });

  final SelectorOnlyStore<GeneralItemType> store;
  final Function(GeneralItemType?)? onChange;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<GeneralItemType>(
      label: 'Tipos de item geral',
      handleTitle: EquipmentGenealItemTypeUtils.handleTitle,
      itens: GeneralItemType.values,
      store: store,
      onChange: onChange,
      isObrigatory: true,
    );
  }
}
