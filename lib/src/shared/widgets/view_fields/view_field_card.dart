import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/selector_item_utils.dart';

class ViewFieldCard<T> extends StatelessWidget {
  const ViewFieldCard({
    super.key,
    required this.type,
    required this.handleTitle,
  });

  final T type;
  final String Function(String) handleTitle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: palette.backgroundLevelTwo,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SelectorItemUtils.title<T>(type, handleTitle),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
