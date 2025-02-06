import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/widgets/default_brackdrop_filter.dart';

class BottomSheetBase extends StatelessWidget {
  const BottomSheetBase({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DefaultBrackdropFilter(),
        Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      ],
    );
  }
}
