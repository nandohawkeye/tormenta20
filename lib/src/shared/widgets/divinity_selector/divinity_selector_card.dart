import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/divinity.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class DivinitySelectorCard extends StatelessWidget {
  const DivinitySelectorCard({
    super.key,
    required this.divinity,
    this.selected,
    required this.onSelect,
  });

  final Divinity divinity;
  final Divinity? selected;
  final Function(Divinity) onSelect;

  @override
  Widget build(BuildContext context) {
    final isSelected = selected?.id == divinity.id;
    return Padding(
      padding: const EdgeInsets.only(right: T20UI.smallSpaceSize),
      child: InkWell(
        onTap: () => onSelect(divinity),
        child: ClipRRect(
          borderRadius: T20UI.borderRadius,
          child: SizedBox(
            height: T20UI.inputHeight,
            width: T20UI.inputHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  divinity.assetPath,
                  height: T20UI.inputHeight,
                  width: T20UI.inputHeight,
                  cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                      context, T20UI.inputHeight),
                  cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                      context, T20UI.inputHeight),
                ),
                if (isSelected)
                  AnimationConfiguration.synchronized(
                    duration: T20UI.defaultDurationAnimation,
                    child: ScaleAnimation(
                      child: SizedBox(
                        height: T20UI.inputHeight,
                        width: T20UI.inputHeight,
                        child: ColoredBox(
                          color: palette.selected.withValues(alpha: .7),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
