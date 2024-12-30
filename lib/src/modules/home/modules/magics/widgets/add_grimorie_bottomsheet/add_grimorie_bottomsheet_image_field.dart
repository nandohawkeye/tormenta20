import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddGrimorieBottomsheetImageField extends StatelessWidget {
  const AddGrimorieBottomsheetImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontalPadding,
      child: SizedBox(
        height: T20UI.inputHeight,
        width: double.infinity,
        child: Card(
          color: palette.onBottomsheet,
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: () {},
            child: const Padding(
              padding: T20UI.horizontalPadding,
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.image),
                  SizedBox(width: 8),
                  Text(
                    'Imagem',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
