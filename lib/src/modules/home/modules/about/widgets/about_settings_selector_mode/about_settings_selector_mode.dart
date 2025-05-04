import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_settings_selector_mode/about_settings_selector_mode_card.dart';
import 'package:tormenta20/src/shared/config/config_store.dart';
import 'package:tormenta20/src/shared/entities/play_mode.dart';

class AboutSettingsSelectorMode extends StatefulWidget {
  const AboutSettingsSelectorMode({super.key});

  @override
  State<AboutSettingsSelectorMode> createState() =>
      _AboutSettingsSelectorModeState();
}

class _AboutSettingsSelectorModeState extends State<AboutSettingsSelectorMode> {
  late final ConfigStore store;

  @override
  void initState() {
    super.initState();
    store = GetIt.I<ConfigStore>();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        height: T20UI.inputHeight,
        width: double.infinity,
        child: ListenableBuilder(
          listenable: store,
          builder: (_, __) {
            final selected = store.config?.mode ?? PlayMode.full;
            return Row(
              children: [
                AboutSettingsSelectorModeCard(
                  mode: PlayMode.full,
                  selected: selected,
                  onTap: store.changeConfigMode,
                ),
                T20UI.spaceWidth,
                AboutSettingsSelectorModeCard(
                  mode: PlayMode.player,
                  selected: selected,
                  onTap: store.changeConfigMode,
                ),
                T20UI.spaceWidth,
                AboutSettingsSelectorModeCard(
                  mode: PlayMode.master,
                  selected: selected,
                  onTap: store.changeConfigMode,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
