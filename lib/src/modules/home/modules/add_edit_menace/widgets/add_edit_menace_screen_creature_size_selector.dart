import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/services/creature_size_service.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';
import 'package:tormenta20/src/shared/widgets/selector_fields/selector_only_field.dart';

class AddEditMenaceScreenCreatureSizeSelector extends StatefulWidget {
  const AddEditMenaceScreenCreatureSizeSelector(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenCreatureSizeSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenCreatureSizeSelector> {
  late final ValueNotifier<CreatureSize?> _creatureSize;
  late final List<CreatureSize> _sizes;
  void _setSelected(CreatureSize value) {
    _creatureSize.value = value;
    widget.controller.changeCreatureSize(value);
  }

  @override
  void initState() {
    super.initState();
    _sizes = CreatureSizeService().getCreaturesSized();
    _creatureSize =
        ValueNotifier<CreatureSize?>(widget.controller.creatureSize);
  }

  @override
  void dispose() {
    _creatureSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
          [widget.controller.errorCreatureSize, _creatureSize]),
      builder: (_, __) {
        final type = _creatureSize.value;
        final hasError = widget.controller.errorCreatureSize.value;
        return SelectorOnlyField<CreatureSize>(
          label:
              'Tamanho: ${type == null ? '' : CreatureSizeUtils.handleTitle(type.category.name)}',
          handleTitle: CreatureSizeUtils.handleTitle,
          itens: _sizes,
          onTap: _setSelected,
          selected: type,
          isObrigatory: true,
          hasError: hasError,
        );
      },
    );
  }
}
