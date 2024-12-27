import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_store.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';

class MagicFilterBottomsheetBottomWidgets extends StatelessWidget {
  const MagicFilterBottomsheetBottomWidgets({super.key, required this.store});

  final MagicFilterBottomsheetStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetDivider(verticalPadding: 0),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: T20UI.inputHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: T20UI.borderRadius,
                      color: palette.primaryCTA.withOpacity(.4),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: T20UI.borderRadius,
                        splashColor: palette.primaryCTA.withOpacity(.6),
                        onTap: () {
                          final result = store.onConfirmChanges();
                          Navigator.pop(context, result);
                        },
                        child: const Center(
                          child: Text(
                            'Confirmar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'tormenta',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              T20UI.spaceWidth,
              SizedBox(
                height: T20UI.inputHeight,
                width: T20UI.inputHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: T20UI.borderRadius,
                    color: palette.onBottomsheet,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: T20UI.borderRadius,
                      splashColor: palette.primaryCTA.withOpacity(.4),
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        FontAwesomeIcons.xmark,
                        color: palette.primaryCTA,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
