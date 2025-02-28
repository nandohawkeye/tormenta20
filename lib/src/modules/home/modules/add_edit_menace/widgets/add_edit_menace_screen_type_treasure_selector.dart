import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_type_treasure_selector_card.dart';
import 'package:tormenta20/src/shared/entities/treasure_type.dart';

class AddEditMenaceScreenTypeTreasureSelector extends StatefulWidget {
  const AddEditMenaceScreenTypeTreasureSelector(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenTypeTreasureSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenTypeTreasureSelector> {
  late final ValueNotifier<TreasureType?> _treasures;
  void _setSelected(TreasureType value) {
    _treasures.value = value;
    widget.controller.changeTreasureType(value);
  }

  @override
  void initState() {
    super.initState();
    _treasures = ValueNotifier<TreasureType?>(widget.controller.treasureType);
  }

  @override
  void dispose() {
    _treasures.dispose();
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
                        Text('Tesouros'),
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
                        valueListenable: _treasures,
                        builder: (_, selected, __) {
                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              left: T20UI.smallSpaceSize,
                              right: T20UI.smallSpaceSize,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: TreasureType.values.length,
                            itemBuilder: (_, index) {
                              return AddEditMenaceScreenTypeTreasureSelectorCard(
                                type: TreasureType.values[index],
                                selected: selected,
                                onTap: _setSelected,
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
