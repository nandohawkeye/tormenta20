import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/screen_base.dart';
import 'package:tormenta20/src/shared/widgets/tips_text.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      body: const Padding(
        padding: T20UI.allPadding,
        child: TipsText(),
      ),
      label: 'Dicas',
      isEnableBackButton: false,
      onSaveLabel: 'Voltar',
      onSave: () => Navigator.pop(context),
    );
  }
}
