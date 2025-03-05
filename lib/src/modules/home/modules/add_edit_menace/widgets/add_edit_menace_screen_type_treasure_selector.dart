import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';
import 'package:tormenta20/src/shared/utils/treasure_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditMenaceScreenTypeTreasureSelector extends StatelessWidget {
  const AddEditMenaceScreenTypeTreasureSelector(this.store, {super.key});

  final SelectorOnlyStore<TreasureType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<TreasureType>(
      label: 'Tesouros',
      handleTitle: TreasureTypeUtils.handleMenaceTitle,
      itens: TreasureType.values,
      store: store,
    );
  }
}
