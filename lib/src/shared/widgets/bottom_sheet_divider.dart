import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({super.key, this.verticalPadding = T20UI.spaceSize});

  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Divider(color: palette.dividerBottomSheet),
    );
  }
}
