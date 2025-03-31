import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_store.dart';

class ImportFileBottomsheetWarning extends StatelessWidget {
  const ImportFileBottomsheetWarning(this.store, {super.key});

  final ImportFileStore store;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store,
      builder: (_, __) {
        final isValid = store.isValid;
        final hasErrorImport = store.hasErrorImport;
        return Padding(
          padding: const EdgeInsets.only(top: 8, left: 16),
          child: Text(
            hasErrorImport
                ? 'Não foi possível importar'
                : isValid == null
                    ? 'obrigatório'
                    : isValid == true
                        ? 'tudo certo!'
                        : 'arquivo inválido!',
            style: TextStyle(fontSize: 12, color: palette.textSecundary),
          ),
        );
      },
    );
  }
}
