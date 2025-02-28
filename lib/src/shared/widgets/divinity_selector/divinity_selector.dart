// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:collection/collection.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/divinity.dart';
import 'package:tormenta20/src/shared/services/divinities_service.dart';
import 'package:tormenta20/src/shared/widgets/divinity_selector/divinity_selector_card.dart';
import 'package:tormenta20/src/shared/widgets/selector_secundary_simple_button.dart';

class DivinitySelector extends StatefulWidget {
  const DivinitySelector({
    super.key,
    this.initialDivinityId,
    required this.onSelectDivinity,
  });

  final int? initialDivinityId;
  final Function(int?) onSelectDivinity;

  @override
  State<DivinitySelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState extends State<DivinitySelector> {
  late final ValueNotifier<Divinity?> _selected;
  late final List<Divinity> _allDivinities;
  void _setSelected(Divinity? value) {
    _selected.value = value;
    widget.onSelectDivinity(value?.id);
  }

  @override
  void initState() {
    super.initState();
    _allDivinities = DivinitiesService().getDivinities();
    _selected = ValueNotifier<Divinity?>(_allDivinities
        .firstWhereOrNull((value) => value.id == widget.initialDivinityId));
  }

  @override
  void dispose() {
    _selected.dispose();
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
                padding: const EdgeInsets.symmetric(
                    horizontal: T20UI.smallSpaceSize),
                child: SizedBox(
                  width: double.infinity,
                  child: AnimatedBuilder(
                    animation: Listenable.merge([_selected]),
                    builder: (_, __) {
                      final selected = _selected.value;
                      return AnimatedContainer(
                        duration: T20UI.defaultDurationAnimation,
                        decoration: BoxDecoration(
                          borderRadius: T20UI.borderRadius,
                          color: palette.backgroundLevelOne,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: T20UI.smallSpaceSize,
                            left: T20UI.screenContentSpaceSize,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Divindade: ${selected != null ? selected.name : ''}'),
                              const SizedBox(
                                height: T20UI.inputHeight,
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
                      valueListenable: _selected,
                      builder: (_, selected, __) {
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                            left: T20UI.smallSpaceSize + T20UI.smallSpaceSize,
                            right: T20UI.smallSpaceSize + T20UI.smallSpaceSize,
                          ),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: T20UI.separatorBuilderHorizontal,
                          itemCount: (_allDivinities.length + 1),
                          itemBuilder: (_, index) {
                            if (index == 0) {
                              return SelectorSecundarySimpleButton(
                                icon: FontAwesomeIcons.xmark,
                                onTap: () => _setSelected(null),
                              );
                            }

                            return DivinitySelectorCard(
                              divinity: _allDivinities[index - 1],
                              onSelect: _setSelected,
                              selected: selected,
                            );
                          },
                        );
                      },
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
