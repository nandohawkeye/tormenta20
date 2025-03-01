import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/shared/entities/menace_type.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditMenaceScreenTypeSelector extends StatefulWidget {
  const AddEditMenaceScreenTypeSelector({super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenTypeSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenTypeSelector> {
  late final ValueNotifier<MenaceType?> _typeSelected;
  void _setSelected(MenaceType value) {
    _typeSelected.value = value;
    widget.controller.changeType(value);
  }

  @override
  void initState() {
    super.initState();
    _typeSelected = ValueNotifier<MenaceType?>(widget.controller.type);
  }

  @override
  void dispose() {
    _typeSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
          [widget.controller.errorValidadeType, _typeSelected]),
      builder: (_, __) {
        final type = _typeSelected.value;
        final hasError = widget.controller.errorValidadeType.value;
        return SelectorOnlyField<MenaceType>(
          label:
              'Tipo: ${type == null ? '' : MenaceUtils.handleMenaceTitle(type.name)}',
          handleTitle: MenaceUtils.handleMenaceTitle,
          itens: MenaceType.values,
          onTap: _setSelected,
          selected: type,
          isObrigatory: true,
          hasError: hasError,
        );
      },
    );
  }
}
