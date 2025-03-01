// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class BoardViewCombatButton extends StatelessWidget {
  const BoardViewCombatButton({super.key, required this.createCombat});

  final Function() createCombat;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: ScaleAnimation(
        duration: T20UI.defaultDurationAnimation,
        child: SizedBox(
          height: T20UI.inputHeight,
          width: T20UI.inputHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: T20UI.borderRadius,
              color: palette.selected,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: T20UI.borderRadius,
                splashColor: palette.accent.withOpacity(.4),
                onTap: createCombat,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SvgPicture.asset(
                    Assets.icons.sword,
                    color: palette.icon,
                    height: 26,
                    width: 26,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
