import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/creature_size_category.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditCharacterSizeSelector extends StatelessWidget {
  const AddEditCharacterSizeSelector(this.store, {super.key});

  final SelectorOnlyStore<CreatureSizeCategory> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<CreatureSizeCategory>(
      label: 'Tamanho',
      handleTitle: CreatureSizeUtils.handleTitle,
      itens: CreatureSizeCategory.values,
      store: store,
      isObrigatory: true,
    );
  }
}
