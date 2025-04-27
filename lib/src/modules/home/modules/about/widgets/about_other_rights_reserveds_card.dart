import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/copyrigth_authors_bottomsheet/copyrigth_authors_bottomsheet.dart';

class AboutOtherRightsReservedsCard extends StatelessWidget {
  const AboutOtherRightsReservedsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: T20UI.screenContentSpaceSize,
      ),
      child: Card(
        child: InkWell(
          borderRadius: T20UI.borderRadius,
          onTap: () {
            BottomsheetUtils.show(
              context: context,
              child: const CopyrigthAuthorsBottomsheet(),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(T20UI.smallSpaceSize),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.solidCopyright),
                T20UI.smallSpaceWidth,
                Flexible(
                  child: Text(
                    'Clique aqui para ver os direitos reservados de outros recursos usados no projeto',
                    maxLines: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
