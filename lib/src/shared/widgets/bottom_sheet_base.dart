import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
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
          alignment: Alignment.bottomRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: EdgeInsets.only(
                left: T20UI.spaceSize,
                right: T20UI.spaceSize,
                bottom: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
              ),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: palette.background,
                    borderRadius: T20UI.borderRadius,
                  ),
                  child: child),
            ),
          ),
        ),
      ],
    );
  }
}
