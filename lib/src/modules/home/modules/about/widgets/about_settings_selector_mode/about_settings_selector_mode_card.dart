import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/play_mode.dart';
import 'package:tormenta20/src/shared/utils/play_mode_utils.dart';

class AboutSettingsSelectorModeCard extends StatelessWidget {
  const AboutSettingsSelectorModeCard({
    super.key,
    required this.mode,
    required this.selected,
    required this.onTap,
  });

  final PlayMode mode;
  final PlayMode selected;
  final Function(PlayMode) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = mode == selected;
    return Expanded(
      child: Card(
        color: isSelected ? palette.selected : palette.backgroundLevelOne,
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () => onTap(mode),
          child: Center(
            child: Text(PlayModeUtils.handleTitle(mode.name)),
          ),
        ),
      ),
    );
  }
}
