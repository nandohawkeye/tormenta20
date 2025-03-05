import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/select_equipments/select_equipments_screen.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class SelectEquipamentField extends StatefulWidget {
  const SelectEquipamentField({
    super.key,
    required this.equipaments,
    required this.onchange,
    this.initialSelected,
  });

  final List<Equipment> equipaments;
  final Equipment? initialSelected;
  final Function(Equipment?) onchange;

  @override
  State<SelectEquipamentField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<SelectEquipamentField> {
  late final ValueNotifier<Equipment?> _selected;
  void _onChange(Equipment? value) {
    _selected.value = value;
    widget.onchange(value);
  }

  @override
  void initState() {
    super.initState();
    _selected = ValueNotifier<Equipment?>(widget.initialSelected);
  }

  @override
  void dispose() {
    _selected.dispose();
    super.dispose();
  }

  void _onAdd(Equipment? equipament) async {
    if (widget.equipaments.isNotEmpty && widget.equipaments.length == 1) {
      _onChange(widget.equipaments.first);
      return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SelectEquipmentsScreen(
          equipaments: widget.equipaments,
          initialSelected: equipament,
        ),
      ),
    ).then((result) {
      if (result != null) {
        _onChange(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: T20UI.screenContentSpaceSize,
              ),
              child: SizedBox(
                width: double.infinity,
                child: AnimatedContainer(
                  duration: T20UI.defaultDurationAnimation,
                  decoration: BoxDecoration(
                    borderRadius: T20UI.borderRadius,
                    color: palette.backgroundLevelOne,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: T20UI.smallSpaceSize,
                          left: T20UI.screenContentSpaceSize,
                          bottom: T20UI.smallSpaceSize,
                        ),
                        child: Text('Equipamento'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: T20UI.smallSpaceSize)
                            .copyWith(
                          bottom: T20UI.smallSpaceSize,
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: _selected,
                          builder: (_, selected, __) {
                            return SizedBox(
                              height: T20UI.inputHeight,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  if (selected != null)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: T20UI.smallSpaceSize,
                                      ),
                                      child: SimpleButton(
                                        icon: FontAwesomeIcons.solidTrashCan,
                                        backgroundColor:
                                            palette.backgroundLevelTwo,
                                        iconColor: palette.accent,
                                        onTap: () => _onChange(null),
                                      ),
                                    ),
                                  Expanded(
                                    child: MainButton(
                                      label: selected == null
                                          ? 'Selecionar'
                                          : selected.name,
                                      fontFamily: selected == null
                                          ? FontFamily.tormenta
                                          : null,
                                      backgroundColor:
                                          palette.backgroundLevelTwo,
                                      onTap: () => _onAdd(selected),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
