import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class ScreenSaveMainButtons extends StatelessWidget {
  const ScreenSaveMainButtons({
    super.key,
    required this.onSave,
    this.extraRightWidgets,
    this.onBack,
    this.label,
    this.extraLeftWidgets,
    this.extraTopWidgets,
    this.isEnable = true,
  });

  final String? label;
  final Function() onSave;
  final Function()? onBack;
  final List<Widget>? extraLeftWidgets;
  final List<Widget>? extraRightWidgets;
  final List<Widget>? extraTopWidgets;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...?extraTopWidgets,
        const Divider(),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              ...?extraLeftWidgets,
              Expanded(
                child: MainButton(
                  label: label ?? 'Salvar',
                  onTap: onSave,
                  isEnable: isEnable,
                ),
              ),
              ...?extraRightWidgets,
              SimpleCloseButton(onTap: onBack)
            ],
          ),
        ),
        T20UI.safeAreaBottom(context)
      ],
    );
  }
}
