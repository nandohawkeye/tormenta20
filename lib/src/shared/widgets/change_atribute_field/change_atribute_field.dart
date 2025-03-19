import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/atributes.dart';
import 'package:tormenta20/src/shared/utils/atribute_utils.dart';
import 'package:tormenta20/src/shared/widgets/change_atribute_field/change_atribute_store.dart';
import 'package:tormenta20/src/shared/widgets/scroll_animated_int_count.dart';

class ChangeAtributeField extends StatelessWidget {
  const ChangeAtributeField({
    super.key,
    required this.atribute,
    required this.store,
  });

  final Atribute atribute;
  final ChangeAtributeStore store;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                AnimatedBuilder(
                  animation: store,
                  builder: (_, __) {
                    final value = store.value;
                    final isNegative = value.isNegative;
                    return ScrollAnimatedIntCount(
                      count: value.abs(),
                      height: 40,
                      width: 15,
                      isNegative: isNegative,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                SimpleButton(
                  backgroundColor: palette.backgroundLevelTwo,
                  iconColor: palette.icon,
                  icon: FontAwesomeIcons.minus,
                  onTap: store.declement,
                ),
                T20UI.smallSpaceWidth,
                SimpleButton(
                  backgroundColor: palette.backgroundLevelTwo,
                  iconColor: palette.icon,
                  icon: FontAwesomeIcons.plus,
                  onTap: store.increment,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
