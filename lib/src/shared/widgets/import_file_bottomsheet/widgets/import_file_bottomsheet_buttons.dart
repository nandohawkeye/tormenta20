import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_store.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class ImportFileBottomsheetButtons extends StatelessWidget {
  const ImportFileBottomsheetButtons(
    this.store, {
    super.key,
    required this.onImport,
  });

  final ImportFileStore store;
  final Function() onImport;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DividerLevelTwo(verticalPadding: 0),
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            children: [
              Expanded(
                child: AnimatedBuilder(
                    animation: store,
                    builder: (_, __) {
                      final isValid = store.isValid;
                      return MainButton(
                        label: isValid == true ? 'Importar' : 'Buscar arquivo',
                        onTap: isValid == true ? onImport : store.getFile,
                      );
                    }),
              ),
              const SimpleCloseButton()
            ],
          ),
        ),
      ],
    );
  }
}
