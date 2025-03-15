import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/screen_save_main_buttons.dart';
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
    this.scrollController,
    this.extraTopWidgets,
  });

  final Widget body;
  final String label;
  final ScrollController? scrollController;
  final Function() onSave;
  final List<Widget>? extraRightWidgets;
  final Function()? onBack;
  final String? onSaveLabel;
  final List<Widget>? extraLeftWidgets;
  final List<Widget>? extraTopWidgets;

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
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: body,
            ),
          ),
          ScreenSaveMainButtons(
            onSave: onSave,
            extraLeftWidgets: extraLeftWidgets,
            extraRightWidgets: extraRightWidgets,
            extraTopWidgets: extraTopWidgets,
            label: onSaveLabel,
            onBack: onBack,
          )
        ],
      ),
    );
  }
}
