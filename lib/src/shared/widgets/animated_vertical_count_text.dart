import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AnimatedVerticalCountText extends StatelessWidget {
  const AnimatedVerticalCountText(this.value, {super.key});

  final int value;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: T20UI.defaultDurationAnimation,
      transitionBuilder: (child, animation) {
        final slideAnimation = Tween<Offset>(
          begin: Offset(
              0, animation.status == AnimationStatus.reverse ? -0.5 : 0.5),
          end: const Offset(0, 0),
        ).animate(animation);

        return SlideTransition(
          position: slideAnimation,
          child: child,
        );
      },
      child: Text(
        '$value',
        key: ValueKey<int>(value),
        style: TextStyle(
          fontSize: 24,
          fontFamily: FontFamily.tormenta,
          fontWeight: FontWeight.bold,
          color: palette.selected,
        ),
      ),
    );
  }
}
