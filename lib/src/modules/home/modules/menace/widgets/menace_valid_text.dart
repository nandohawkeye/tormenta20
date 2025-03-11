import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class MenaceValidText extends StatelessWidget {
  const MenaceValidText({
    super.key,
    this.value,
    this.textColor,
  });

  final String? value;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    if (value?.isNotEmpty ?? false) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: T20UI.spaceSize,
          horizontal: T20UI.screenContentSpaceSize,
        ),
        child: Text(
          value ?? '',
          maxLines: 20000,
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
