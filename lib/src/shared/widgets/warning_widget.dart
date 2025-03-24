import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class WarningWidget extends StatelessWidget {
  const WarningWidget({
    super.key,
    required this.isObrigatory,
    this.helpText,
    required this.hasError,
  });

  final bool isObrigatory;
  final String? helpText;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    if (hasError || isObrigatory || helpText != null) {
      return Padding(
        padding: const EdgeInsets.only(
          left: T20UI.screenContentSpaceSize + T20UI.spaceSize,
          top: T20UI.smallSpaceSize,
        ),
        child: Text(
          hasError ? 'É obrigatório!' : helpText ?? 'obrigatório',
          style: TextStyle(
            fontSize: 12,
            color: hasError ? palette.accent : palette.textSecundary,
            fontWeight: hasError ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
