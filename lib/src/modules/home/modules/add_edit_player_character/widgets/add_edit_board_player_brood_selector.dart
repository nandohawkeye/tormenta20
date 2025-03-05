import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/stores/add_edit_board_player_brood_store.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditBoardPlayerBroodSelector extends StatelessWidget {
  const AddEditBoardPlayerBroodSelector(this.store, {super.key});

  final AddEditBoardPlayerBroodStore store;

  @override
  Widget build(BuildContext context) {
    return SelectorOnlyField<Brood>(
      label: 'Raça',
      handleTitle: CharacterUtils.handleBroodTitle,
      itens: Brood.values,
      store: store,
      isObrigatory: true,
    );
  }
}
