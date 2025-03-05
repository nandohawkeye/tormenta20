import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditMenaceScreenTypeSelector extends StatelessWidget {
  const AddEditMenaceScreenTypeSelector(this.store, {super.key});

  final SelectorOnlyStore<MenaceType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<MenaceType>(
      label: 'Tipo',
      handleTitle: MenaceUtils.handleMenaceTitle,
      itens: MenaceType.values,
      store: store,
      isObrigatory: true,
    );
  }
}
