import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class DeleteNoteBottomsheet extends StatelessWidget {
  const DeleteNoteBottomsheet({super.key});

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
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: Text(
                        'Deletar anotação',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: FontFamily.tormenta,
                        ),
                      ),
                    ),
                    T20UI.spaceHeight,
                  ],
                ),
                const DividerLevelTwo(verticalPadding: 0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    T20UI.spaceHeight,
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: T20UI.horizontalPadding,
                        child: Text(
                          'Deseja realmente deletar essa anotação?',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 18,
                            color: palette.primary,
                          ),
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
                              label: 'Sim, deletar',
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
