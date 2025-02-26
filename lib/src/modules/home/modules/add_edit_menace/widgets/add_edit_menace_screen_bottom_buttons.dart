import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/animated_percent_circular_progress.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddEditMenaceScreenBottomButtons extends StatelessWidget {
  const AddEditMenaceScreenBottomButtons({
    super.key,
    required this.onSave,
    required this.onBack,
    required this.notifierStage,
    required this.notifierPercent,
  });

  final Function() onSave;
  final Function() onBack;
  final ValueNotifier<int> notifierStage;
  final ValueNotifier<double> notifierPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              ValueListenableBuilder(
                  valueListenable: notifierPercent,
                  builder: (_, percent, __) {
                    return AnimatedPercentCircularProgress(percent);
                  }),
              T20UI.spaceWidth,
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: notifierStage,
                    builder: (_, stage, __) {
                      return MainButton(
                        label: stage < 4 ? 'Próximo' : 'Salvar',
                        onTap: onSave,
                      );
                    }),
              ),
              T20UI.spaceWidth,
              SimpleCloseButton(onTap: onBack)
            ],
          ),
        )
      ],
    );
  }
}
