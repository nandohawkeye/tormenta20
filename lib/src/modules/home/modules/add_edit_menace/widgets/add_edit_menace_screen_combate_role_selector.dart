import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_combate_role_selector_card.dart';
import 'package:tormenta20/src/shared/entities/combat_role.dart';
import 'package:tormenta20/src/shared/utils/combat_role_utils.dart';

class AddEditMenaceScreenCombateRoleSelector extends StatefulWidget {
  const AddEditMenaceScreenCombateRoleSelector(
      {super.key, required this.controller});

  final AddEditMenaceController controller;

  @override
  State<AddEditMenaceScreenCombateRoleSelector> createState() =>
      _AddEditBoardPlayerBroodSelectorState();
}

class _AddEditBoardPlayerBroodSelectorState
    extends State<AddEditMenaceScreenCombateRoleSelector> {
  late final ValueNotifier<CombatRole?> _combatRole;
  void _setSelected(CombatRole value) {
    _combatRole.value = value;
    widget.controller.changeCombatRole(value);
  }

  @override
  void initState() {
    super.initState();
    _combatRole = ValueNotifier<CombatRole?>(widget.controller.combatRole);
  }

  @override
  void dispose() {
    _combatRole.dispose();
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
                        [widget.controller.errorCombatRole, _combatRole]),
                    builder: (_, __) {
                      final hasError = widget.controller.errorCombatRole.value;
                      final type = _combatRole.value;
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
                                  'Papel de combate: ${type == null ? '' : CombatRoleUtils.handleTitle(type.name)}'),
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
                        valueListenable: _combatRole,
                        builder: (_, selected, __) {
                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              left: T20UI.spaceSize + 10,
                              right: T20UI.spaceSize,
                            ),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: T20UI.separatorBuilderHorizontal,
                            itemCount: CombatRole.values.length,
                            itemBuilder: (_, index) {
                              return AddEditMenaceScreenCombateRoleSelectorCard(
                                combatRole: CombatRole.values[index],
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
            valueListenable: widget.controller.errorCombatRole,
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
