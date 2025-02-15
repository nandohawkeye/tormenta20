import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class ValidCreateCloseCombatBottomsheet extends StatelessWidget {
  const ValidCreateCloseCombatBottomsheet({super.key, required this.hasInited});

  final bool hasInited;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Padding(
        padding: T20UI.allPaddingWithPaddingBottom(context),
        child: SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: palette.backgroundLevelOne,
                borderRadius: T20UI.borderRadius),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: Text(
                        hasInited
                            ? 'Dejesa encerrar combate?'
                            : 'Dejesa iniciar combate?',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: FontFamily.tormenta,
                        ),
                      ),
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DividerLevelTwo(verticalPadding: 0),
                    Padding(
                      padding: T20UI.allPadding,
                      child: Row(
                        children: [
                          Expanded(
                            child: MainButton(
                              label:
                                  'Sim, ${hasInited ? 'encerrar' : 'iniciar'}',
                              onTap: () => Navigator.pop(context, true),
                            ),
                          ),
                          T20UI.spaceWidth,
                          SimpleCloseButton(
                            backgroundColor: palette.backgroundLevelTwo,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
