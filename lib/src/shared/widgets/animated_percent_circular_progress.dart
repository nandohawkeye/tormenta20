import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AnimatedPercentCircularProgress extends StatelessWidget {
  const AnimatedPercentCircularProgress(this.value, {super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value),
      duration: T20UI.defaultDurationAnimation,
      curve: Curves.easeInOut,
      builder: (_, animatedValue, __) => SizedBox(
        width: T20UI.inputHeight,
        height: T20UI.inputHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: animatedValue,
              strokeWidth: 8,
              strokeAlign: 1,
              strokeCap: StrokeCap.round,
              color: palette.selected,
              backgroundColor: palette.backgroundLevelOne,
            ),
            AnimatedSwitcher(
              duration: T20UI.defaultDurationAnimation,
              reverseDuration: T20UI.defaultDurationAnimation,
              child: value < 1
                  ? const Icon(FontAwesomeIcons.percent)
                  : const Icon(FontAwesomeIcons.check),
            )
          ],
        ),
      ),
    );
  }
}
