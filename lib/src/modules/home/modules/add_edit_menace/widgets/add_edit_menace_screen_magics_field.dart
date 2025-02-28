import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_magic_menace/add_edit_magic_menace_screen.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_magics_field_card.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_menace.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';

class AddEditMenaceScreenMagicsField extends StatefulWidget {
  const AddEditMenaceScreenMagicsField({super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenMagicsField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenMagicsField> {
  late final ValueNotifier<List<MagicMenace>> _selecteds;
  void _add(MagicMenace? value) {
    if (value == null) return;

    List<MagicMenace> oldValues = _selecteds.value;

    if (oldValues.any((old) => old.uuid == value.uuid)) {
      final index = oldValues.indexWhere((old) => old.uuid == value.uuid);
      oldValues[index] = value;
      _selecteds.value = [...oldValues];
    } else {
      _selecteds.value = [value, ...oldValues];
      widget.controller.addMagic(value);
    }
  }

  void _onAdd(MagicMenace? magic) async {
    await Navigator.push<MagicMenace?>(
      context,
      MaterialPageRoute(
        builder: (_) => AddEditMagicMenaceScreen(
          magic: magic,
          menaceUuid: widget.controller.uuid,
        ),
      ),
    ).then(_add);
  }

  void _remove(MagicMenace value) {
    List<MagicMenace> oldValues = _selecteds.value;
    oldValues.remove(value);
    _selecteds.value = [...oldValues];
    widget.controller.removeMagic(value);
  }

  @override
  void initState() {
    super.initState();
    _selecteds = ValueNotifier<List<MagicMenace>>(widget.controller.magics);
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
              SizedBox(
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
                        Text('Magias'),
                        SizedBox(height: T20UI.inputHeight + 12)
                      ],
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
                                  horizontal: T20UI.smallSpaceSize),
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
                              return AddEditMenaceScreenMagicsFieldCard(
                                magicMenace: list[index - 1],
                                onRemove: _remove,
                                onTap: _onAdd,
                              );
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
