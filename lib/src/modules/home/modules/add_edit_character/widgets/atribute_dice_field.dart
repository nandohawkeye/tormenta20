import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/utils/atribute_utils.dart';
import 'package:tormenta20/src/shared/widgets/scroll_animated_int_count.dart';

class AtributeDiceField extends StatelessWidget {
  const AtributeDiceField({
    super.key,
    required this.atribute,
    required this.value,
    required this.setAtribute,
    required this.isNegative,
  });

  final Atribute atribute;
  final Function(Atribute) setAtribute;
  final int value;
  final bool isNegative;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => setAtribute(atribute),
        child: Padding(
          padding: T20UI.allSmallPadding,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AtributeUtils.resumedTitle(atribute),
                    style: TextStyle(
                      fontSize: 16,
                      color: palette.accent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ScrollAnimatedIntCount(
                    count: value,
                    height: 40,
                    width: 15,
                    isNegative: isNegative,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // T20UI.smallSpaceHeight,
              // MainButton(
              //   label: 'R0lar',
              //   backgroundColor: palette.backgroundLevelTwo,
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
