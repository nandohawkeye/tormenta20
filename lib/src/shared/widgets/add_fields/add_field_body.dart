import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddFieldBody extends StatelessWidget {
  const AddFieldBody({super.key, required this.hasError, required this.label});

  final String label;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontallScreenPadding,
      child: SizedBox(
        width: double.infinity,
        child: AnimatedContainer(
          duration: T20UI.defaultDurationAnimation,
          decoration: BoxDecoration(
            color: palette.backgroundLevelOne,
            borderRadius: T20UI.borderRadius,
            border: Border.all(
              width: 2,
              color: hasError ? palette.accent : palette.backgroundLevelOne,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: T20UI.smallSpaceSize,
              left: T20UI.screenContentSpaceSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                const SizedBox(height: T20UI.inputHeight + 12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
