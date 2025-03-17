// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_bottom_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_stages/add_edit_menace_screen_stage_four.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_stages/add_edit_menace_screen_stage_one.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_stages/add_edit_menace_screen_stage_three.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_stages/add_edit_menace_screen_stage_two.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/cancel_menace_confirm_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';

class AddEditMenaceScreen extends StatefulWidget {
  const AddEditMenaceScreen({super.key, this.menace});

  final Menace? menace;

  @override
  State<AddEditMenaceScreen> createState() => _AddEditMenaceScreenState();
}

class _AddEditMenaceScreenState extends State<AddEditMenaceScreen> {
  final _formKeyStageOne = GlobalKey<FormState>();
  final _formKeyStageTwo = GlobalKey<FormState>();
  late final AddEditMenaceController _controller;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _controller = AddEditMenaceController(widget.menace);
    _pageController = PageController();
    _controller.stage.addListener(_stageListener);
  }

  @override
  void dispose() {
    _controller.stage.removeListener(_stageListener);
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _stageListener() {
    final stage = _controller.stage.value;
    _pageController.animateToPage(
      stage - 1,
      duration: T20UI.defaultDurationAnimation,
      curve: Curves.easeInOut,
    );
  }

  Future<void> _confirmCancelMenace() async {
    await BottomsheetUtils.show<bool?>(
      context: context,
      child: const CancelMenaceConfirmBottomsheet(),
    ).then((result) async {
      if (result != null && result) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (can, __) async {
        if (can) return;

        final stage = _controller.stage.value;
        if (stage > 1) {
          _controller.setStage(stage - 1);
        } else {
          await _confirmCancelMenace();
        }
      },
      child: Material(
        color: palette.background,
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeader(label: 'Ameaça'),
              const Divider(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    AddEditMenaceScreenStageOne(
                      formKey: _formKeyStageOne,
                      controller: _controller,
                    ),
                    AddEditMenaceScreenStageTwo(
                      controller: _controller,
                      formKey: _formKeyStageTwo,
                    ),
                    AddEditMenaceScreenStageThree(
                      controller: _controller,
                    ),
                    AddEditMenaceScreenStageFour(
                      controller: _controller,
                    )
                  ],
                ),
              ),
              AddEditMenaceScreenBottomButtons(
                notifierStage: _controller.stage,
                notifierPercent: _controller.percent,
                onSave: () async {
                  FocusScope.of(context).unfocus();
                  final stage = _controller.stage.value;
                  if (stage == 1) {
                    if (_formKeyStageOne.currentState!.validate()) {
                      _controller.setStage(2);
                      _controller.setPercent(.4);
                    }
                  } else if (stage == 2) {
                    if (_formKeyStageTwo.currentState!.validate()) {
                      final isValidType = _controller.isValidType();
                      if (!isValidType) {
                        return;
                      }

                      final isValidCreatureSize =
                          _controller.isValidCreatureSize();
                      if (!isValidCreatureSize) {
                        return;
                      }

                      final isValidCombatRole = _controller.isValidCombatRole();
                      if (!isValidCombatRole) {
                        return;
                      }

                      _controller.setStage(3);
                      _controller.setPercent(.6);
                    }
                  } else if (stage == 3) {
                    _controller.setPercent(.8);
                    _controller.setStage(4);
                  } else if (stage == 4) {
                    _controller.setPercent(1.0);
                    final menace = await _controller.onSave();
                    if (menace != null) {
                      Navigator.pop(context, menace);
                    }
                  }
                },
                onBack: () async {
                  final stage = _controller.stage.value;
                  final percent = _controller.percent.value;
                  if (stage == 1) {
                    await _confirmCancelMenace();
                  } else {
                    _controller.setStage(stage - 1);
                    _controller.setPercent(percent - .2);
                  }
                },
              ),
              T20UI.safeAreaBottom(context)
            ],
          ),
        ),
      ),
    );
  }
}
