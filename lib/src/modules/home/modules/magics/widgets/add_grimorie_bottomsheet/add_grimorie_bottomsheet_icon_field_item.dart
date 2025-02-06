// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddGrimorieBottomsheetIconFieldItem extends StatelessWidget {
  const AddGrimorieBottomsheetIconFieldItem({
    super.key,
    required this.asset,
    required this.assetSelected,
    required this.onSelectedAsset,
  });

  final String asset;
  final String assetSelected;
  final Function(String) onSelectedAsset;

  @override
  Widget build(BuildContext context) {
    final isSelected = asset == assetSelected;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => onSelectedAsset(asset),
      child: SizedBox(
        height: 44,
        width: 44,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: isSelected ? 2 : 1,
              color: isSelected
                  ? palette.primary
                  : palette.textPrimary.withOpacity(.2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: SvgPicture.asset(
                asset,
                height: 24,
                color: isSelected
                    ? palette.primary
                    : palette.textPrimary.withOpacity(.2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
