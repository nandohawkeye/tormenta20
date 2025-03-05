import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/entities/equipament/equipment.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectEquipmentsCard extends StatelessWidget {
  const SelectEquipmentsCard({
    super.key,
    required this.equipment,
    this.selected,
    required this.onTap,
  });

  final Equipment equipment;
  final Equipment? selected;
  final Function(Equipment) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = equipment.uuid == selected?.uuid;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: T20UI.smallSpaceSize,
      ),
      child: SizedBox(
        width: double.infinity,
        height: T20UI.inputHeight,
        child: Card(
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: () => onTap(equipment),
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(equipment.name),
                  CustomChecked(
                    value: isSelected,
                    isEnabledToTap: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
