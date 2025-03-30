import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_back_button_switch.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_settings_backup_card.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_settings_selector_mode/about_settings_selector_mode.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_bottomsheet.dart';

class AboutSettings extends StatelessWidget {
  const AboutSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: T20UI.screenContentSpaceSize,
          ),
          child: AboutSettingsBackupCard(
            icon: FontAwesomeIcons.fileImport,
            title: 'Exportar arquivo de backup',
            subtitle:
                'Salve suas mesas, personagens e grimórios em um local seguro para recuperar depois.',
            onTap: () {},
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 4,
            left: T20UI.spaceSize * 2,
            right: T20UI.spaceSize,
          ),
          child: Text(
            'os arquivos anexados não serão salvos, salve-os separadamente',
            maxLines: 10,
            style: TextStyle(fontSize: 12),
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontallScreenPadding,
          child: AboutSettingsBackupCard(
            icon: FontAwesomeIcons.fileExport,
            title: 'Importar arquivo de backup',
            subtitle: 'Recupere seus arquivos salvos e comece a jogar!',
            onTap: () {
              BottomsheetUtils.show(
                context: context,
                child: const ImportFileBottomsheet(),
              );
            },
          ),
        ),
        T20UI.spaceHeight,
        const Divider(),
        T20UI.spaceHeight,
        const Padding(
          padding: T20UI.horizontalPadding,
          child: Labels('Modo'),
        ),
        T20UI.spaceHeight,
        const Padding(
          padding: T20UI.horizontallScreenPadding,
          child: AboutSettingsSelectorMode(),
        ),
        T20UI.spaceHeight,
        const Divider(),
        T20UI.spaceHeight,
        const Padding(
          padding: T20UI.horizontalPadding,
          child: Labels('Botão de voltar'),
        ),
        T20UI.spaceHeight,
        const Padding(
          padding: T20UI.horizontallScreenPadding,
          child: AboutBackButtonSwitch(),
        ),
        T20UI.safeAreaBottom(context)
      ],
    );
  }
}
