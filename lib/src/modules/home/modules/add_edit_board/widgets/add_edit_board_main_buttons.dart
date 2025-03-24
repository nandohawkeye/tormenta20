import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class AddEditBoardMainButtons extends StatelessWidget {
  const AddEditBoardMainButtons({super.key, required this.onSave});

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
              Expanded(
                child: MainButton(
                  label: 'Salvar',
                  onTap: onSave,
                ),
              ),
              const SimpleCloseButton()
            ],
          ),
        ),
        T20UI.safeAreaBottom(context)
      ],
    );
  }
}
