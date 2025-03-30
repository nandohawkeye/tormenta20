import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class ImportFileBottomsheetFileEmptyCard extends StatelessWidget {
  const ImportFileBottomsheetFileEmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: T20UI.allPadding,
        child: Row(
          children: [
            Icon(FontAwesomeIcons.circleInfo),
            T20UI.spaceWidth,
            Flexible(
              child: Text(
                'Selecione um arquivo .t20 que deseja importar.\n\nObs: ao selecionar um arquivo já exitente, as informações serão sobreecritas!',
                maxLines: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
