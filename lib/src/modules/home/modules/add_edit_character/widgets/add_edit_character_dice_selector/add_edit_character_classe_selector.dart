import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditCharacterClasseSelector extends StatelessWidget {
  const AddEditCharacterClasseSelector(this.store, {super.key});

  final SelectorOnlyStore<ClasseType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<ClasseType>(
      label: 'Classe',
      handleTitle: CharacterUtils.handleClasseTypeTitle,
      itens: ClasseType.values,
      store: store,
      isObrigatory: true,
    );
  }
}
