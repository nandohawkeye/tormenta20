import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddEditMenaceScreenBottomButtons extends StatelessWidget {
  const AddEditMenaceScreenBottomButtons({super.key, required this.onSave});

  final Function() onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              SizedBox(
                width: T20UI.inputHeight,
                height: T20UI.inputHeight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: .4,
                      strokeWidth: 8,
                      strokeAlign: 1,
                      strokeCap: StrokeCap.round,
                      color: palette.selected,
                      backgroundColor: palette.backgroundLevelOne,
                    ),
                    const Icon(FontAwesomeIcons.check)
                  ],
                ),
              ),
              T20UI.spaceWidth,
              Expanded(
                child: MainButton(
                  label: 'Próximo',
                  onTap: onSave,
                ),
              ),
              T20UI.spaceWidth,
              const SimpleCloseButton()
            ],
          ),
        )
      ],
    );
  }
}
