import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class DefaultBrackdropFilter extends StatelessWidget {
  const DefaultBrackdropFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: ScaleAnimation(
        duration: T20UI.defaultDurationAnimation,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: palette.accent.withValues(alpha: .1),
              height: context.height,
              width: context.width,
            ),
          ),
        ),
      ),
    );
  }
}
