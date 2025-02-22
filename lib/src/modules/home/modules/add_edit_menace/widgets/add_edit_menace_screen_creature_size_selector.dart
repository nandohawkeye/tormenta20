import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_creature_size_selector_card.dart';
import 'package:tormenta20/src/shared/entities/creature_size.dart';
import 'package:tormenta20/src/shared/services/creature_size_service.dart';
import 'package:tormenta20/src/shared/utils/creature_size_utils.dart';

class AddEditMenaceScreenCreatureSizeSelector extends StatefulWidget {
  const AddEditMenaceScreenCreatureSizeSelector(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenCreatureSizeSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenCreatureSizeSelector> {
  late final ValueNotifier<CreatureSize?> _creatureSize;
  late final List<CreatureSize> _sizes;
  void _setSelected(CreatureSize value) {
    _creatureSize.value = value;
    widget.controller.changeCreatureSize(value);
  }

  @override
  void initState() {
    super.initState();
    _sizes = CreatureSizeService().getCreaturesSized();
    _creatureSize =
        ValueNotifier<CreatureSize?>(widget.controller.creatureSize);
  }

  @override
  void dispose() {
    _creatureSize.dispose();
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
                  child: AnimatedBuilder(
                    animation: Listenable.merge(
                        [widget.controller.errorCreatureSize, _creatureSize]),
                    builder: (_, __) {
                      final hasError =
                          widget.controller.errorCreatureSize.value;
                      final type = _creatureSize.value;
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
                                  'Tamanho: ${type == null ? '' : CreatureSizeUtils.handleTitle(type.category.name)}'),
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
                    height: T20UI.inputHeight,
                    width: double.infinity,
                    child: ValueListenableBuilder(
                        valueListenable: _creatureSize,
                        builder: (_, selected, __) {
                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              left: T20UI.spaceSize + 10,
                              right: T20UI.spaceSize + 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: _sizes.length,
                            itemBuilder: (_, index) {
                              return AddEditMenaceScreenCreatureSizeSelectorCard(
                                creatureSize: _sizes[index],
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
            valueListenable: widget.controller.errorCreatureSize,
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
