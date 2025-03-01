import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_store.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';
import 'package:tormenta20/src/shared/utils/character_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_multi_field.dart';

class AddEditBoardPlayerClassesSelector extends StatefulWidget {
  const AddEditBoardPlayerClassesSelector({super.key, required this.store});

  final AddEditBoardPlayerStore store;

  @override
  State<AddEditBoardPlayerClassesSelector> createState() =>
      _AddEditBoardPlayerClassesSelectorState();
}

class _AddEditBoardPlayerClassesSelectorState
    extends State<AddEditBoardPlayerClassesSelector> {
  late final ValueNotifier<List<ClasseType>?> _selectedClasses;
  void _onTap(ClasseType value) {
    widget.store.onAddClasse(value);
    List<ClasseType> oldValues = _selectedClasses.value ?? [];
    if (oldValues.contains(value)) {
      oldValues.remove(value);
      _selectedClasses.value = [...oldValues];
    } else {
      _selectedClasses.value = [...oldValues, value];
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedClasses = ValueNotifier<List<ClasseType>?>(
        widget.store.classes.map((c) => c.type).toList());
  }

  @override
  void dispose() {
    _selectedClasses.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
          [widget.store.errorValidadeClasses, _selectedClasses]),
      builder: (_, __) {
        final classes = _selectedClasses.value ?? [];
        final hasError = widget.store.errorValidadeClasses.value;
        return SelectorMultiField<ClasseType>(
          label:
              'Classes: ${classes.isNotEmpty ? CharacterUtils.handleAllClassesTypeTitle(classes) : ''}',
          handleTitle: CharacterUtils.handleBroodTitle,
          itens: ClasseType.values,
          onTap: _onTap,
          selecteds: classes,
          isObrigatory: true,
          hasError: hasError,
        );
      },
    );
  }
}
