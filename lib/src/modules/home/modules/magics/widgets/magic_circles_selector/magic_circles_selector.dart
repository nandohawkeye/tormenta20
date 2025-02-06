import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_circles_selector/magic_circles_selector_item.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circle.dart';
import 'package:tormenta20/src/shared/entities/magic/magic_circles.dart';

class MagicCirclesSelector extends StatelessWidget {
  const MagicCirclesSelector({
    super.key,
    required this.selecteds,
    required this.onChangeCircleSelected,
  });

  final List<MagicCircle> selecteds;
  final Function(MagicCircle) onChangeCircleSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: SizedBox(
        height: T20UI.inputHeight,
        width: double.infinity,
        child: Row(
          children: [
            MagicCirclesSelectorItem(
              circle: firstCircle,
              selecteds: selecteds,
              onTap: onChangeCircleSelected,
            ),
            T20UI.spaceWidth,
            MagicCirclesSelectorItem(
              circle: secondCircle,
              selecteds: selecteds,
              onTap: onChangeCircleSelected,
            ),
            T20UI.spaceWidth,
            MagicCirclesSelectorItem(
              circle: thirdCircle,
              selecteds: selecteds,
              onTap: onChangeCircleSelected,
            ),
            T20UI.spaceWidth,
            MagicCirclesSelectorItem(
              circle: fourthCircle,
              selecteds: selecteds,
              onTap: onChangeCircleSelected,
            ),
            T20UI.spaceWidth,
            MagicCirclesSelectorItem(
              circle: fifthCircle,
              selecteds: selecteds,
              onTap: onChangeCircleSelected,
            ),
          ],
        ),
      ),
    );
  }
}
