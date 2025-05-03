import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddEditCharacterDiceCardPrototype extends StatelessWidget {
  const AddEditCharacterDiceCardPrototype({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Center(
              child: Padding(
            padding: T20UI.horizontallScreenPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SAB',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: palette.accent,
                  ),
                ),
                ...List.generate(
                  4,
                  (index) {
                    if (index + 1 == 4) {
                      return Text(
                        '${4} ',
                        style: TextStyle(color: palette.textDisable),
                      );
                    }

                    return Text(
                      '${-4}, ',
                      style: TextStyle(
                        color: palette.accent,
                      ),
                    );
                  },
                ),
                Text(
                  ' = ${0}  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: palette.accent,
                  ),
                ),
              ],
            ),
          )),
        ),
        T20UI.smallSpaceWidth,
      ],
    );
  }
}
