import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AlertBottomsheet extends StatelessWidget {
  const AlertBottomsheet({
    super.key,
    required this.label,
    required this.mensage,
    required this.mainButtonLabel,
    required this.onTap,
  });

  final String label;
  final String mainButtonLabel;
  final String mensage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
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
                  label,
                  style: const TextStyle(
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
                    mensage,
                    maxLines: 20,
                    style: TextStyle(
                      fontSize: 18,
                      color: palette.primary,
                      fontWeight: FontWeight.w500,
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
                        label: mainButtonLabel,
                        onTap: () => Navigator.pop(context, true),
                      ),
                    ),
                    const SimpleCloseButton()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
