import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/magic/magic.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class AddMagicsBottomsheetCard extends StatelessWidget {
  const AddMagicsBottomsheetCard({
    super.key,
    required this.magic,
    required this.selectedMagics,
    required this.onTap,
  });

  final Magic magic;
  final List<Magic> selectedMagics;
  final Function(Magic) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: palette.onBottomsheet,
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(magic),
        child: Padding(
          padding: T20UI.allPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                magic.name,
                style: const TextStyle(fontSize: 16),
              ),
              CustomChecked(
                value: selectedMagics.contains(magic),
                isEnabledToTap: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
