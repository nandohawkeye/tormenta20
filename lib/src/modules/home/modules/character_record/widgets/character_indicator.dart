import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/scroll_animated_int_count.dart';

class CharacterIndicator extends StatelessWidget {
  const CharacterIndicator({
    super.key,
    required this.color,
    required this.currentValue,
    required this.totalValue,
    required this.icon,
    this.isUniqueValue = false,
  });

  final Color color;
  final int currentValue;
  final int totalValue;
  final IconData icon;
  final bool isUniqueValue;

  @override
  Widget build(BuildContext context) {
    final value = isUniqueValue ? 1.0 : currentValue / totalValue;
    return SizedBox(
      width: 80,
      height: 100,
      child: Stack(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Transform.rotate(
                    angle: 3.3,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: value),
                      duration: T20UI.defaultDurationAnimation,
                      curve: Curves.easeInOut,
                      builder: (_, animatedValue, __) =>
                          CircularProgressIndicator(
                            strokeWidth: 10,
                            value: animatedValue,
                            strokeAlign: 1,
                            strokeCap: StrokeCap.round,
                            trackGap: .4,
                            color: color.withValues(alpha: .35),
                            backgroundColor: color.withValues(alpha: .15),
                          ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isUniqueValue)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ScrollAnimatedIntCount(
                                count: currentValue,
                                width: 10,
                                height: 60,
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '/',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: color.withValues(alpha: .8),
                                ),
                              ),
                            ],
                          ),
                        ScrollAnimatedIntCount(
                          count: totalValue,
                          width: 10,
                          height: 25,
                          textStyle: TextStyle(
                            fontSize: isUniqueValue ? 16 : 14,
                            fontWeight: FontWeight.bold,
                            color: isUniqueValue
                                ? palette.textPrimary
                                : palette.textDisable,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                if (FontAwesomeIcons.shieldHalved == icon)
                  const Icon(
                    FontAwesomeIcons.shield,
                    size: 30,
                    color: Colors.black,
                  ),
                Icon(icon, size: 30, color: color),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
