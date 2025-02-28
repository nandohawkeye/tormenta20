import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_settings_backup_card.dart';

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
                'Salve suas mesas, personagens e glimórios em um local seguro para recuperar depois.',
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
          padding: const EdgeInsets.symmetric(
            horizontal: T20UI.screenContentSpaceSize,
          ),
          child: AboutSettingsBackupCard(
            icon: FontAwesomeIcons.fileExport,
            title: 'Importar arquivo de backup',
            subtitle: 'Recupere seus arquivos salvos e comece a jogar!',
            onTap: () {},
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
        )
      ],
    );
  }
}
