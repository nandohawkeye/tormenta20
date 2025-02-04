import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/botom_sheet_add_edit_board_charcter_store.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_classes_selector_card.dart';
import 'package:tormenta20/src/shared/entities/classe_type.dart';

class BottomSheetAddEditBoardCharacterClassesSelector extends StatefulWidget {
  const BottomSheetAddEditBoardCharacterClassesSelector(
      {super.key, required this.store});

  final BotomSheetAddEditBoardCharcterStore store;

  @override
  State<BottomSheetAddEditBoardCharacterClassesSelector> createState() =>
      _BottomSheetAddEditBoardCharacterClassesSelectorState();
}

class _BottomSheetAddEditBoardCharacterClassesSelectorState
    extends State<BottomSheetAddEditBoardCharacterClassesSelector> {
  late final ValueNotifier<List<ClasseType>?> _selectedClasses;
  void _onTap(ClasseType value) {
    widget.store.onAddClasse(value);
    List<ClasseType> oldValues = _selectedClasses.value ?? [];
    if (oldValues.contains(value)) {
      oldValues.remove(value);
      _selectedClasses.value = [...oldValues];
    } else {
      _selectedClasses.value = [...oldValues, value];
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedClasses = ValueNotifier<List<ClasseType>?>(
        widget.store.classes.map((c) => c.type).toList());
  }

  @override
  void dispose() {
    _selectedClasses.dispose();
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
                  child: ValueListenableBuilder(
                      valueListenable: widget.store.errorValidadeClasses,
                      builder: (_, hasError, __) {
                        return AnimatedContainer(
                          duration: T20UI.defaultDurationAnimation,
                          decoration: BoxDecoration(
                            borderRadius: T20UI.borderRadius,
                            color: hasError
                                ? palette.accent.withOpacity(.4)
                                : palette.onBottomsheet,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: T20UI.spaceSize / 2, left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Classes:'),
                                SizedBox(
                                  height: T20UI.inputHeight + 12,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
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
                      valueListenable: _selectedClasses,
                      builder: (_, selecteds, __) {
                        final list = selecteds ?? [];
                        return ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                            left: T20UI.spaceSize + 10,
                            right: T20UI.spaceSize,
                          ),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: T20UI.separatorBuilderHorizontal,
                          itemCount: ClasseType.values.length,
                          itemBuilder: (_, index) {
                            return BottomSheetAddEditBoardCharacterClassesSelectorCard(
                              classeType: ClasseType.values[index],
                              onTap: _onTap,
                              selecteds: list,
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
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 36),
          child: ValueListenableBuilder(
            valueListenable: widget.store.errorValidadeClasses,
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
