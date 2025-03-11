import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_store.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_settings_selector_mode/about_settings_selector_mode_card.dart';
import 'package:tormenta20/src/shared/entities/play_mode.dart';

class AboutSettingsSelectorMode extends StatelessWidget {
  const AboutSettingsSelectorMode(this.store, {super.key});

  final AboutStore store;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: T20UI.inputHeight,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: store,
        builder: (_, __) {
          final selected = store.mode;
          return Row(
            children: [
              AboutSettingsSelectorModeCard(
                mode: PlayMode.full,
                selected: selected,
                onTap: store.changePlayMode,
              ),
              T20UI.spaceWidth,
              AboutSettingsSelectorModeCard(
                mode: PlayMode.player,
                selected: selected,
                onTap: store.changePlayMode,
              ),
              T20UI.spaceWidth,
              AboutSettingsSelectorModeCard(
                mode: PlayMode.master,
                selected: selected,
                onTap: store.changePlayMode,
              ),
            ],
          );
        },
      ),
    );
  }
}
