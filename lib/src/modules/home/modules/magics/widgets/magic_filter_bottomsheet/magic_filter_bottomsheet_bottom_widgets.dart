import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/magics/widgets/magic_filter_bottomsheet/magic_filter_bottomsheet_store.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class MagicFilterBottomsheetBottomWidgets extends StatelessWidget {
  const MagicFilterBottomsheetBottomWidgets({super.key, required this.store});

  final MagicFilterBottomsheetStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DividerLevelTwo(verticalPadding: 0),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MainButton(
                  label: 'Confirmar',
                  onTap: () {
                    final result = store.onConfirmChanges();
                    Navigator.pop(context, result);
                  },
                ),
              ),
              T20UI.spaceWidth,
              const SimpleCloseButton()
            ],
          ),
        ),
      ],
    );
  }
}
