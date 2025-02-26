import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_action/add_edit_action_screen.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';
import 'package:tormenta20/src/shared/entities/action/action.dart';

class AddEditActionField extends StatefulWidget {
  const AddEditActionField({
    super.key,
    required this.initialActions,
    required this.onAdd,
    required this.onRemove,
    required this.parentUuid,
  });

  final List<ActionEnt> initialActions;
  final String parentUuid;
  final Function(ActionEnt) onAdd;
  final Function(ActionEnt) onRemove;

  @override
  State<AddEditActionField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState extends State<AddEditActionField> {
  late final ValueNotifier<List<ActionEnt>> _selecteds;
  void _add(ActionEnt? value) {
    if (value == null) return;

    List<ActionEnt> oldValues = _selecteds.value;

    if (oldValues.any((old) => old.uuid == value.uuid)) {
      final index = oldValues.indexWhere((old) => old.uuid == value.uuid);
      oldValues[index] = value;
      _selecteds.value = [...oldValues];
    } else {
      _selecteds.value = [value, ...oldValues];
      widget.onAdd(value);
    }
  }

  void _onAdd(ActionEnt? action) async {
    await Navigator.push<ActionEnt?>(
      context,
      MaterialPageRoute(
        builder: (_) => AddEditActionScreen(
          action: action,
          menaceUuid: widget.parentUuid,
        ),
      ),
    ).then(_add);
  }

  void _remove(ActionEnt value) {
    List<ActionEnt> oldValues = _selecteds.value;
    oldValues.remove(value);
    _selecteds.value = [...oldValues];
    widget.onRemove(value);
  }

  @override
  void initState() {
    super.initState();
    _selecteds = ValueNotifier<List<ActionEnt>>(widget.initialActions);
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
                padding: T20UI.horizontalPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedContainer(
                    duration: T20UI.defaultDurationAnimation,
                    decoration: BoxDecoration(
                      borderRadius: T20UI.borderRadius,
                      color: palette.backgroundLevelOne,
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.only(top: T20UI.spaceSize / 2, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ações'),
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
                                  horizontal: T20UI.spaceSize + 10),
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
                              left: T20UI.spaceSize + 10,
                              right: T20UI.spaceSize + 10,
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
