// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/config/config_store.dart';

class AboutBackButtonSwitch extends StatefulWidget {
  const AboutBackButtonSwitch({super.key});

  @override
  State<AboutBackButtonSwitch> createState() => _AboutBackButtonSwitchState();
}

class _AboutBackButtonSwitchState extends State<AboutBackButtonSwitch> {
  late final ConfigStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<ConfigStore>();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: double.infinity,
        child: ListenableBuilder(
          listenable: _store,
          builder: (_, __) {
            final isEnable = _store.config?.enableBottomBackButton ?? false;
            return Card(
              child: InkWell(
                borderRadius: T20UI.borderRadius,
                onTap: () => _store.changeEnableBackButton(!isEnable),
                child: Padding(
                  padding: T20UI.allPadding,
                  child: Row(
                    children: [
                      const Flexible(
                        child: Text(
                          'Habilite ou desabilite o botão de voltar na parte inferior do aplicativo, defina para uma melhor experiência no seu dispositivo',
                          maxLines: 5,
                        ),
                      ),
                      T20UI.spaceWidth,
                      Theme(
                        data: Theme.of(context).copyWith(useMaterial3: true),
                        child: IgnorePointer(
                          child: Switch(
                            value: isEnable,
                            activeColor: palette.accent,
                            activeTrackColor: palette.background,
                            inactiveThumbColor: palette.backgroundLevelOne,
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
