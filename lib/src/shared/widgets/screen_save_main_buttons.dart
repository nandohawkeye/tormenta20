import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class ScreenSaveMainButtons extends StatelessWidget {
  const ScreenSaveMainButtons({
    super.key,
    this.onSave,
    this.extraRightWidgets,
    this.onBack,
    this.label,
    this.extraLeftWidgets,
    this.extraTopWidgets,
    this.isEnable = true,
    this.isEnableBackButton = true,
  });

  final String? label;
  final Function()? onSave;
  final Function()? onBack;
  final List<Widget>? extraLeftWidgets;
  final List<Widget>? extraRightWidgets;
  final List<Widget>? extraTopWidgets;
  final bool isEnable;
  final bool isEnableBackButton;

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ...?extraLeftWidgets,
              if (onSave != null)
                Expanded(
                  child: MainButton(
                    label: label ?? 'Salvar',
                    onTap: onSave!,
                    isEnable: isEnable,
                  ),
                ),
              ...?extraRightWidgets,
              if (isEnableBackButton) SimpleCloseButton(onTap: onBack)
            ],
          ),
        ),
        T20UI.safeAreaBottom(context)
      ],
    );
  }
}
