import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_equipaments/add_edit_equipaments.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';

class AddEditEquipamentField extends StatefulWidget {
  const AddEditEquipamentField({
    super.key,
    required this.initialEquipaments,
    required this.onAdd,
    required this.onRemove,
    required this.parentUuid,
  });

  final List<Equipment> initialEquipaments;
  final String parentUuid;
  final Function(Equipment) onAdd;
  final Function(Equipment) onRemove;

  @override
  State<AddEditEquipamentField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditEquipamentField> {
  late final ValueNotifier<List<Equipment>> _selecteds;
  void _add(Equipment? value) {
    if (value == null) return;

    List<Equipment> oldValues = _selecteds.value;

    if (oldValues.any((old) => old.uuid == value.uuid)) {
      final index = oldValues.indexWhere((old) => old.uuid == value.uuid);
      oldValues[index] = value;
      _selecteds.value = [...oldValues];
    } else {
      _selecteds.value = [value, ...oldValues];
      widget.onAdd(value);
    }
  }

  void _onAdd(Equipment? equipament) async {
    await Navigator.push<Equipment?>(
      context,
      MaterialPageRoute(
        builder: (_) => AddEditEquipaments(
          equipament: equipament,
          menaceUuid: widget.parentUuid,
        ),
      ),
    ).then(_add);
  }

  void _remove(Equipment value) {
    List<Equipment> oldValues = _selecteds.value;
    oldValues.remove(value);
    _selecteds.value = [...oldValues];
    widget.onRemove(value);
  }

  @override
  void initState() {
    super.initState();
    _selecteds = ValueNotifier<List<Equipment>>(widget.initialEquipaments);
  }

  @override
  void dispose() {
    _selecteds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (95),
          child: Stack(
            children: [
              Padding(
                padding: T20UI.horizontallScreenPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedContainer(
                    duration: T20UI.defaultDurationAnimation,
                    decoration: BoxDecoration(
                      borderRadius: T20UI.borderRadius,
                      color: palette.backgroundLevelOne,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: T20UI.smallSpaceSize,
                        left: T20UI.screenContentSpaceSize,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Equipamentos'),
                          SizedBox(height: T20UI.inputHeight + 12)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: T20UI.inputHeight,
                    width: double.infinity,
                    child: ValueListenableBuilder(
                        valueListenable: _selecteds,
                        builder: (_, list, __) {
                          if (list.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: T20UI.smallSpaceSize +
                                    T20UI.screenContentSpaceSize,
                              ),
                              child: MainButton(
                                label: 'Adicionar',
                                backgroundColor: palette.backgroundLevelTwo,
                                onTap: () => _onAdd(null),
                              ),
                            );
                          }

                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              left: T20UI.smallSpaceSize,
                              right: T20UI.smallSpaceSize,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: list.length + 1,
                            itemBuilder: (_, index) {
                              if (index == 0) {
                                return SelectorSecundarySimpleButton(
                                  icon: FontAwesomeIcons.plus,
                                  onTap: () => _onAdd(null),
                                );
                              }

                              return SizedBox();
                              // return AddEditMenaceScreenMagicsFieldCard(
                              //   magicMenace: list[index - 1],
                              //   onRemove: _remove,
                              //   onTap: _onAdd,
                              // );
                            },
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
