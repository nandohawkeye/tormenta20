import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class CustomChecked extends StatelessWidget {
  const CustomChecked({
    super.key,
    required this.value,
    this.size = 20,
    this.onChange,
    this.isEnabledToTap = true,
    this.color,
    this.checkedColor,
  });

  final Color? color;
  final Color? checkedColor;
  final bool value;
  final double? size;
  final Function(bool)? onChange;
  final bool isEnabledToTap;

  @override
  Widget build(BuildContext context) {
    final selectedColor = color ?? palette.accent;
    final finalCheckedColor = checkedColor ?? Colors.white;
    return IgnorePointer(
      ignoring: !isEnabledToTap,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onChange!(!value),
        child: AnimatedContainer(
          height: size,
          width: size,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: value ? selectedColor : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: value ? selectedColor : palette.disable,
            ),
          ),
          child: value
              ? AnimationConfiguration.synchronized(
                  child: ScaleAnimation(
                    child: Icon(
                      FontAwesomeIcons.check,
                      color: finalCheckedColor,
                      size: 14,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
