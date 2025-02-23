import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/grimorie/modules/add_magics/add_magics_screen.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditMagicMenaceSelectMagicField extends StatefulWidget {
  const AddEditMagicMenaceSelectMagicField({
    super.key,
    this.initialMagicBaseId,
    required this.hasError,
    required this.onSelectMagic,
  });

  final int? initialMagicBaseId;
  final ValueNotifier<bool> hasError;
  final Function(Magic) onSelectMagic;

  @override
  State<AddEditMagicMenaceSelectMagicField> createState() =>
      _AddEditMagicMenaceSelectMagicFieldState();
}

class _AddEditMagicMenaceSelectMagicFieldState
    extends State<AddEditMagicMenaceSelectMagicField> {
  late final ValueNotifier<Magic?> _magicSelected;
  void _setMagicSelected(Magic? value) {
    if (value == null) return;

    _magicSelected.value = value;
  }

  @override
  void initState() {
    super.initState();
    _magicSelected = ValueNotifier<Magic?>(null);
    if (widget.initialMagicBaseId != null) {}
  }

  void _onSelectMagic(Magic? magic) async {
    await Navigator.push<Magic?>(
      context,
      MaterialPageRoute(
        builder: (_) => AddMagicsScreen(
          multiSelect: false,
          initialMagics: magic == null ? [] : [magic],
        ),
      ),
    ).then(_setMagicSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
          animation: Listenable.merge([
            widget.hasError,
            _magicSelected,
          ]),
          builder: (_, __) {
            final selected = _magicSelected.value;
            final hasError = widget.hasError.value;
            return MainButton(
              label: selected == null ? 'Selecionar magia' : selected.name,
              backgroundColor:
                  hasError ? palette.selected : palette.backgroundLevelTwo,
              onTap: () => _onSelectMagic(selected),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: T20UI.spaceSize,
            top: T20UI.spaceSize / 2,
          ),
          child: ValueListenableBuilder(
            valueListenable: widget.hasError,
            builder: (_, hasError, __) {
              return Text(
                'obrigatório',
                style: TextStyle(
                  fontSize: 12,
                  color: hasError ? palette.selected : palette.textDisable,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
