import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class SimpleSaveMainButtons extends StatelessWidget {
  const SimpleSaveMainButtons({
    super.key,
    required this.onSave,
    this.extraRightWidgets,
    this.onTap,
    this.label = 'Salvar',
    this.extraLeftWidgets,
  });

  final String label;
  final Function() onSave;
  final Function()? onTap;
  final List<Widget>? extraLeftWidgets;
  final List<Widget>? extraRightWidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DividerLevelTwo(verticalPadding: 0),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              ...?extraLeftWidgets,
              Expanded(
                child: MainButton(
                  label: label,
                  onTap: onSave,
                ),
              ),
              T20UI.spaceWidth,
              ...?extraRightWidgets,
              SimpleCloseButton(
                onTap: onTap,
                backgroundColor: palette.backgroundLevelTwo,
              )
            ],
          ),
        ),
        T20UI.safeAreaBottom(context)
      ],
    );
  }
}
