import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_store.dart';

class AddEditBoardPlayerClassesSelector extends StatelessWidget {
  const AddEditBoardPlayerClassesSelector(this.store, {super.key});

  final SelectorMultiStore<ClasseType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorMultiField<ClasseType>(
      label: 'Classes',
      handleTitle: CharacterUtils.handleClasseTypeTitle,
      itens: ClasseType.values,
      store: store,
      isObrigatory: true,
    );
  }
}
