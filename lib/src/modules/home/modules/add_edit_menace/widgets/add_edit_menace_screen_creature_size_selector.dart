import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/services/creature_size_service.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_store.dart';

class AddEditMenaceScreenCreatureSizeSelector extends StatelessWidget {
  const AddEditMenaceScreenCreatureSizeSelector(this.store, {super.key});

  final SelectorOnlyStore<CreatureSize> store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<CreatureSize>(
      label: 'Tamanho',
      handleTitle: CreatureSizeUtils.handleTitle,
      itens: CreatureSizeService().getCreaturesSized(),
      store: store,
      isObrigatory: true,
    );
  }
}
