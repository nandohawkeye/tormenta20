import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class SelectorFieldBody extends StatelessWidget {
  const SelectorFieldBody({
    super.key,
    required this.label,
    this.hasError = false,
    this.backgroundColor,
  });

  final String label;
  final bool hasError;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontallScreenPadding,
      child: SizedBox(
        width: double.infinity,
        child: AnimatedContainer(
          duration: T20UI.defaultDurationAnimation,
          decoration: BoxDecoration(
            borderRadius: T20UI.borderRadius,
            border: Border.all(
              color: hasError ? palette.accent : palette.backgroundLevelOne,
              width: 2,
            ),
            color: backgroundColor ?? palette.backgroundLevelOne,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: T20UI.smallSpaceSize,
              left: T20UI.screenContentSpaceSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: T20UI.inputHeight + 12),
                  child: Text(label),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
