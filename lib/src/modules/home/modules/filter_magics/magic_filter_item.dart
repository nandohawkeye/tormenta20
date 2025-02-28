import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class MagicFilterItem extends StatelessWidget {
  const MagicFilterItem({
    super.key,
    required this.label,
    required this.checked,
    this.type,
    required this.onTap,
  });

  final String label;
  final bool checked;
  final dynamic type;
  final Function(dynamic) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(type),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: T20UI.smallSpaceSize),
          CustomChecked(
            value: checked,
            isEnabledToTap: false,
          )
        ],
      ),
    );
  }
}
