import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/selector_item_utils.dart';

class SelectorOnlyCard<T> extends StatelessWidget {
  const SelectorOnlyCard({
    super.key,
    required this.type,
    required this.selected,
    required this.onTap,
    required this.handleTitle,
  });

  final T type;
  final T? selected;
  final Function(T) onTap;
  final String Function(String) handleTitle;

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == type;

    return AnimatedContainer(
      height: T20UI.inputHeight * MediaQuery.of(context).textScaler.scale(1),
      duration: T20UI.defaultDurationAnimation,
      decoration: BoxDecoration(
        borderRadius: T20UI.borderRadius,
        color: isSelected ? palette.selected : palette.backgroundLevelTwo,
      ),
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: () => onTap(type),
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
      ),
    );
  }
}
