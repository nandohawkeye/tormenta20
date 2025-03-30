import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/custom_loader.dart';

class ImportFileBotomsheetFileCard extends StatelessWidget {
  const ImportFileBotomsheetFileCard({
    super.key,
    this.isValid,
    required this.title,
    required this.file,
    required this.getFile,
  });

  final bool? isValid;
  final String title;
  final File file;
  final Function() getFile;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: T20UI.borderRadius,
        onTap: isValid == true ? getFile : null,
        child: Row(
          children: [
            if (isValid == null) const CustomLoader(size: 60),
            if (isValid == true)
              const Padding(
                padding: EdgeInsets.only(
                  left: T20UI.spaceSize,
                  top: T20UI.spaceSize + 4,
                  bottom: T20UI.spaceSize + 4,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCircleCheck,
                ),
              ),
            if (isValid == false)
              const Padding(
                padding: EdgeInsets.only(
                  left: T20UI.spaceSize,
                  top: T20UI.spaceSize + 4,
                  bottom: T20UI.spaceSize + 4,
                ),
                child: Icon(
                  FontAwesomeIcons.solidCircleXmark,
                ),
              ),
            T20UI.spaceWidth,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isValid == null
                      ? 'Validando...'
                      : isValid == false
                          ? 'Não foi possível validar'
                          : title),
                  const SizedBox(height: 4),
                  Text(
                    file.path.split('/').last,
                    style: TextStyle(
                      color: palette.selected,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
