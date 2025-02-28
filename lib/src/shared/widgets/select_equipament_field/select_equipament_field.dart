import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/general_skill.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class SelectEquipamentField extends StatefulWidget {
  const SelectEquipamentField({super.key});

  @override
  State<SelectEquipamentField> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<SelectEquipamentField> {
  // late final ValueNotifier<List<GeneralSkill>> _selecteds;
  // void _add(GeneralSkill? value) {
  //   if (value == null) return;

  //   List<GeneralSkill> oldValues = _selecteds.value;

  //   if (oldValues.any((old) => old.uuid == value.uuid)) {
  //     final index = oldValues.indexWhere((old) => old.uuid == value.uuid);
  //     oldValues[index] = value;
  //     _selecteds.value = [...oldValues];
  //   } else {
  //     _selecteds.value = [value, ...oldValues];
  //     widget.controller.addGeneralSkill(value);
  //   }
  // }

  // void _remove(GeneralSkill value) {
  //   List<GeneralSkill> oldValues = _selecteds.value;
  //   oldValues.remove(value);
  //   _selecteds.value = [...oldValues];
  //   widget.controller.removeGeneralSkill(value);
  // }

  @override
  void initState() {
    super.initState();
    // _selecteds =
    //     ValueNotifier<List<GeneralSkill>>(widget.controller.generalSkills);
  }

  @override
  void dispose() {
    // _selecteds.dispose();
    super.dispose();
  }

  void _onAdd(GeneralSkill? skill) async {
    // await showModalBottomSheet<GeneralSkill?>(
    //   isScrollControlled: true,
    //   isDismissible: true,
    //   enableDrag: false,
    //   context: context,
    //   builder: (context) => Padding(
    //     padding: EdgeInsets.only(
    //       bottom: MediaQuery.of(context).viewInsets.bottom,
    //     ),
    //     child: AddEditGeneralSkillsBottomSheet(
    //       skill: skill,
    //       menaceUuid: widget.controller.uuid,
    //     ),
    //   ),
    // ).then(_add);
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
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: T20UI.smallSpaceSize,
                        left: T20UI.screenContentSpaceSize,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Equipamento'),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal:
                            T20UI.screenContentSpaceSize + T20UI.smallSpaceSize,
                      ),
                      child: MainButton(
                        label: 'Selecionar',
                        backgroundColor: palette.backgroundLevelTwo,
                        onTap: () => _onAdd(null),
                      ),
                    ),
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
