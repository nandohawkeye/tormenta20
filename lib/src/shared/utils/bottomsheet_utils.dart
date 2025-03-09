import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

abstract class BottomsheetUtils {
  static Future<T?> show<T>({
    required BuildContext context,
    required final Widget child,
    final bool isScrollControlled = true,
    final bool isDismissible = true,
  }) async =>
      await showModalBottomSheet<T>(
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        enableDrag: false,
        context: context,
        sheetAnimationStyle: AnimationStyle(
          curve: Curves.bounceOut,
          reverseCurve: Curves.easeIn,
          duration: T20UI.defaultDurationAnimation,
          reverseDuration: T20UI.defaultDurationAnimation,
        ),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: child,
        ),
      );
}
