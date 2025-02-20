import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_creature_vision_selector_card.dart';
import 'package:tormenta20/src/shared/entities/creature_vision.dart';
import 'package:tormenta20/src/shared/utils/menace_utils.dart';

class AddEditMenaceScreenCreatureVisionSelector extends StatefulWidget {
  const AddEditMenaceScreenCreatureVisionSelector(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenCreatureVisionSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenCreatureVisionSelector> {
  late final ValueNotifier<CreatureVision?> _vision;
  void _setSelected(CreatureVision value) {
    _vision.value = value;
    widget.controller.changeCreatureVision(value);
  }

  @override
  void initState() {
    super.initState();
    _vision = ValueNotifier<CreatureVision?>(widget.controller.creatureVision);
  }

  @override
  void dispose() {
    _vision.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (95 * MediaQuery.of(context).textScaler.scale(1)),
          child: Stack(
            children: [
              Padding(
                padding: T20UI.horizontalPadding,
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedBuilder(
                    animation: Listenable.merge(
                        [widget.controller.errorCreatureVision, _vision]),
                    builder: (_, __) {
                      final hasError =
                          widget.controller.errorCreatureVision.value;
                      final type = _vision.value;
                      return AnimatedContainer(
                        duration: T20UI.defaultDurationAnimation,
                        decoration: BoxDecoration(
                          borderRadius: T20UI.borderRadius,
                          color: hasError
                              ? palette.accent.withOpacity(.4)
                              : palette.backgroundLevelOne,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: T20UI.spaceSize / 2, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Visão: ${type == null ? '' : MenaceUtils.handleMenaceTitle(type.name)}'),
                              const SizedBox(
                                height: T20UI.inputHeight + 12,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: T20UI.inputHeight *
                        MediaQuery.of(context).textScaler.scale(1),
                    width: double.infinity,
                    child: ValueListenableBuilder(
                        valueListenable: _vision,
                        builder: (_, selected, __) {
                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              left: T20UI.spaceSize + 10,
                              right: T20UI.spaceSize,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: CreatureVision.values.length,
                            itemBuilder: (_, index) {
                              return AddEditMenaceScreenCreatureVisionSelectorCard(
                                vision: CreatureVision.values[index],
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
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 36),
          child: ValueListenableBuilder(
            valueListenable: widget.controller.errorCreatureVision,
            builder: (_, hasError, __) {
              return Text(
                hasError ? 'campo obrigatório' : 'obrigatório',
                style: TextStyle(
                    fontSize: 12,
                    color: hasError ? palette.accent : palette.textDisable),
              );
            },
          ),
        )
      ],
    );
  }
}
