import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class AddEditCharacterWarning extends StatelessWidget {
  const AddEditCharacterWarning({super.key, required this.mensage});

  final String mensage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: T20UI.horizontallScreenPadding,
      child: Card(
        color: palette.background,
        shape: RoundedRectangleBorder(
          borderRadius: T20UI.borderRadius,
          side: BorderSide(
            color: palette.disable,
            width: 2,
          ),
        ),
        child: Padding(
          padding: T20UI.allSmallPadding,
          child: Row(
            children: [
              T20UI.smallSpaceWidth,
              const Icon(FontAwesomeIcons.circleInfo),
              T20UI.spaceWidth,
              Flexible(
                  child: Text(
                mensage,
                maxLines: 10,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
