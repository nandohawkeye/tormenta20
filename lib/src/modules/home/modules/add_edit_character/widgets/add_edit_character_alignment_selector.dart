import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/character_alignment_type.dart';
import 'package:tormenta20/src/shared/utils/character_alignment_type_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditCharacterAlignmentSelector extends StatelessWidget {
  const AddEditCharacterAlignmentSelector(this.store, {super.key});

  final SelectorOnlyStore<CharacterAlignmentType> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<CharacterAlignmentType>(
      label: 'Alinhamento',
      handleTitle: CharacterAlignmentTypeUtils.handleTitle,
      itens: CharacterAlignmentType.values,
      store: store,
      isObrigatory: true,
    );
  }
}
