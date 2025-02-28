import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/screen_save_main_buttons.dart';
import 'package:tormenta20/src/shared/widgets/screen_header.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase({
    super.key,
    required this.body,
    required this.label,
    required this.onSave,
    this.extraRightWidgets,
    this.onBack,
    this.onSaveLabel,
    this.extraLeftWidgets,
  });

  final Widget body;
  final String label;
  final Function() onSave;
  final List<Widget>? extraRightWidgets;
  final Function()? onBack;
  final String? onSaveLabel;
  final List<Widget>? extraLeftWidgets;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(label: label),
          const Divider(),
          Expanded(child: SingleChildScrollView(child: body)),
          ScreenSaveMainButtons(
            onSave: onSave,
            extraLeftWidgets: extraLeftWidgets,
            extraRightWidgets: extraRightWidgets,
            label: onSaveLabel,
            onBack: onBack,
          )
        ],
      ),
    );
  }
}
