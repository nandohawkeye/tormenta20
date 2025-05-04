// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';
import 'package:tormenta20/src/shared/widgets/custom_checked.dart';

class SelectGrimorieScreenCard extends StatelessWidget {
  const SelectGrimorieScreenCard({
    super.key,
    required this.grimoire,
    this.selected,
    required this.onTap,
  });

  final Grimoire grimoire;
  final Grimoire? selected;
  final Function(Grimoire) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = grimoire.uuid == selected?.uuid;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: T20UI.inputHeight,
          child: Card(
            child: InkWell(
              borderRadius: T20UI.borderRadius,
              onTap: () => onTap(grimoire),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: T20UI.smallSpaceSize, right: T20UI.spaceSize),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        T20UI.smallSpaceWidth,
                        SvgPicture.asset(
                          grimoire.iconAsset,
                          height: 20,
                          width: 20,
                          color: palette.icon,
                        ),
                        T20UI.smallSpaceWidth,
                        Text(
                          grimoire.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
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
        T20UI.smallSpaceHeight,
      ],
    );
  }
}
