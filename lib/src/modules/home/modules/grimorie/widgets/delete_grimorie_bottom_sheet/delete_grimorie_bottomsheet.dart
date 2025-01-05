import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class DeleteGrimorieBottomsheet extends StatelessWidget {
  const DeleteGrimorieBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: palette.primaryCTA.withOpacity(.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: T20UI.allPaddingWithPaddingBottom(context,
                extra: MediaQuery.of(context).padding.bottom),
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: palette.bottomSheetBackground,
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
                            'Deletar grimório',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'tormenta',
                            ),
                          ),
                        ),
                        T20UI.spaceHeight,
                      ],
                    ),
                    const BottomSheetDivider(verticalPadding: 0),
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
                            child: Card(
                              color: palette.onBottomsheet.withOpacity(.3),
                              child: Padding(
                                padding: T20UI.allPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deseja realmente deletar esse grimório?',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: palette.primary,
                                      ),
                                    ),
                                  ],
                                ),
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
                        const BottomSheetDivider(verticalPadding: 0),
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
                              const SimpleCloseButton()
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
        ),
      ],
    );
  }
}
