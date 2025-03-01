import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_store.dart';
import 'package:tormenta20/src/shared/entities/brood.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditBoardPlayerBroodSelector extends StatefulWidget {
  const AddEditBoardPlayerBroodSelector({super.key, required this.store});

  final AddEditBoardPlayerStore store;

  @override
  State<AddEditBoardPlayerBroodSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditBoardPlayerBroodSelector> {
  late final ValueNotifier<Brood?> _broodSelected;
  void _setSelected(Brood value) {
    _broodSelected.value = value;
    widget.store.onChangeBrood(value);
  }

  @override
  void initState() {
    super.initState();
    _broodSelected = ValueNotifier<Brood?>(widget.store.brood);
  }

  @override
  void dispose() {
    _broodSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          Listenable.merge([widget.store.errorValidadeBrood, _broodSelected]),
      builder: (_, __) {
        final brood = _broodSelected.value;
        final hasError = widget.store.errorValidadeBrood.value;
        return SelectorOnlyField<Brood>(
          label:
              'Raça: ${brood != null ? CharacterUtils.handleBroodTitle(brood.name) : ''}',
          handleTitle: CharacterUtils.handleBroodTitle,
          itens: Brood.values,
          onTap: _setSelected,
          selected: brood,
          isObrigatory: true,
          hasError: hasError,
        );
      },
    );
  }
}
