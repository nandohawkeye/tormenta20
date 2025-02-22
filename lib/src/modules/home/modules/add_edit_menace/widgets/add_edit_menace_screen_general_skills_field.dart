import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_general_skills_bottom_sheet/add_edit_general_skills_bottom_sheet.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_general_skills_field_card.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';

class AddEditMenaceScreenGeneralSkillsField extends StatefulWidget {
  const AddEditMenaceScreenGeneralSkillsField(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenGeneralSkillsField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenGeneralSkillsField> {
  late final ValueNotifier<List<GeneralSkill>> _selecteds;
  void _add(GeneralSkill? value) {
    if (value == null) return;

    List<GeneralSkill> oldValues = _selecteds.value;

    if (oldValues.any((old) => old.uuid == value.uuid)) {
      final index = oldValues.indexWhere((old) => old.uuid == value.uuid);
      oldValues[index] = value;
      _selecteds.value = [...oldValues];
    } else {
      _selecteds.value = [value, ...oldValues];
      widget.controller.addGeneralSkill(value);
    }
  }

  void _remove(GeneralSkill value) {
    List<GeneralSkill> oldValues = _selecteds.value;
    oldValues.remove(value);
    _selecteds.value = [...oldValues];
    widget.controller.removeGeneralSkill(value);
  }

  @override
  void initState() {
    super.initState();
    _selecteds =
        ValueNotifier<List<GeneralSkill>>(widget.controller.generalSkills);
  }

  @override
  void dispose() {
    _selecteds.dispose();
    super.dispose();
  }

  void _onAdd(GeneralSkill? skill) async {
    await showModalBottomSheet<GeneralSkill?>(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: false,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddEditGeneralSkillsBottomSheet(
          skill: skill,
          menaceUuid: widget.controller.uuid,
        ),
      ),
    ).then(_add);
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
                          Text('Hábilidades gerais'),
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
                              return AddEditMenaceScreenGeneralSkillsFieldCard(
                                skill: list[index - 1],
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
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 36),
          child: Text(
            'Ex: Cura Acelerada, vulnerabilidade a...',
            style: TextStyle(
              fontSize: 12,
              color: palette.textDisable,
            ),
          ),
        )
      ],
    );
  }
}
