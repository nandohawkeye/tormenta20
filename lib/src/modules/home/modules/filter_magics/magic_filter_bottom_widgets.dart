import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/filter_magics/magic_filter_store.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class MagicFilterBottomsheetBottomWidgets extends StatelessWidget {
  const MagicFilterBottomsheetBottomWidgets({super.key, required this.store});

  final MagicFilterStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
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
              const SimpleCloseButton()
            ],
          ),
        ),
      ],
    );
  }
}
