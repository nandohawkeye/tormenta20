// ignore_for_file: unnecessary_string_interpolations, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/widgets/import_file_bottomsheet_warning.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_store.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/widgets/import_file_bottomsheet_file_card.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/widgets/import_file_bottomsheet_buttons.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/widgets/import_file_bottomsheet_file_empty_card.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/widgets/import_file_bottomsheet_header.dart';

class ImportFileBottomsheet extends StatefulWidget {
  const ImportFileBottomsheet({super.key, this.initialFile});

  final File? initialFile;

  @override
  State<ImportFileBottomsheet> createState() => _ImportFileBottomsheetState();
}

class _ImportFileBottomsheetState extends State<ImportFileBottomsheet> {
  late final ImportFileStore _store;

  @override
  void initState() {
    super.initState();
    _store = ImportFileStore(widget.initialFile);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  void _import() async {
    final result = await _store.import();
    if (result) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImportFileBottomsheetHeader(),
          const DividerLevelTwo(verticalPadding: 0),
          T20UI.spaceHeight,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: T20UI.horizontalPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _store,
                      builder: (_, __) {
                        final file = _store.file;
                        final isValid = _store.isValid;
                        final title = _store.title;

                        if (file != null) {
                          return ImportFileBotomsheetFileCard(
                            title: title,
                            file: file,
                            isValid: isValid,
                            getFile: _store.getFile,
                          );
                        }
                        return const ImportFileBottomsheetFileEmptyCard();
                      },
                    ),
                    ImportFileBottomsheetWarning(_store)
                  ],
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
          ImportFileBottomsheetButtons(_store, onImport: _import)
        ],
      ),
    );
  }
}
