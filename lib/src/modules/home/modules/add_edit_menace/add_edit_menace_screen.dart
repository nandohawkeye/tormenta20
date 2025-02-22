import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/add_edit_menace_controller.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_bottom_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_header.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_stage_one.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_stage_three.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_menace/widgets/add_edit_menace_screen_stage_two.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';

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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.background,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
            const AddEditMenaceScreenHeader(),
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
                  )
                ],
              ),
            ),
            AddEditMenaceScreenBottomButtons(
              notifierStage: _controller.stage,
              notifierPercent: _controller.percent,
              onSave: () {
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
                  _controller.setPercent(1.0);
                }
              },
              onBack: () {
                final stage = _controller.stage.value;
                if (stage == 1) {
                  Navigator.pop(context);
                } else {
                  _controller.setStage(stage - 1);
                }
              },
            ),
            T20UI.safeAreaBottom(context)
          ],
        ),
      ),
    );
  }
}
