import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/select_equipments/widgets/select_equipments_card.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';

class SelectEquipmentsScreen extends StatefulWidget {
  const SelectEquipmentsScreen({
    super.key,
    required this.equipaments,
    this.initialSelected,
  });

  final List<Equipment> equipaments;
  final Equipment? initialSelected;

  @override
  State<SelectEquipmentsScreen> createState() => _SelectEquipmentsScreenState();
}

class _SelectEquipmentsScreenState extends State<SelectEquipmentsScreen> {
  late final ValueNotifier<Equipment?> _selected;
  void _onChange(Equipment value) => _selected.value = value;

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

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      label: 'Selecione o equipamento',
      body: widget.equipaments.isEmpty
          ? Padding(
              padding: EdgeInsets.only(top: context.height / 3),
              child: const Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(FontAwesomeIcons.ghost),
                    SizedBox(width: T20UI.smallSpaceSize),
                    Text(
                      'Nenhum equipamento',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: T20UI.horizontallScreenPadding,
              child: ValueListenableBuilder(
                valueListenable: _selected,
                builder: (_, selected, __) {
                  return Column(
                    children: [
                      T20UI.spaceHeight,
                      ...widget.equipaments.map(
                        (equipment) => SelectEquipmentsCard(
                          equipment: equipment,
                          selected: selected,
                          onTap: _onChange,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
      onSaveLabel: 'Confirmar',
      onSave: () {
        if (_selected.value != null) {
          Navigator.pop(context, _selected.value);
        }
      },
    );
  }
}
