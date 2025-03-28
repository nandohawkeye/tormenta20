// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/custom_loader.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_store.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              T20UI.spaceHeight,
              Padding(
                padding: T20UI.horizontalPadding,
                child: Text(
                  'Importar arquivo',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: FontFamily.tormenta,
                  ),
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
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
                            return Card(
                              child: InkWell(
                                borderRadius: T20UI.borderRadius,
                                onTap: isValid == true ? _store.getFile : null,
                                child: Row(
                                  children: [
                                    if (isValid == null)
                                      const CustomLoader(size: 60),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(isValid == null
                                              ? 'Validando...'
                                              : isValid == false
                                                  ? 'Não foi possível validar'
                                                  : title),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${file.path.split('/').last}',
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
                          return const Card(
                            child: Padding(
                              padding: T20UI.allPadding,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.circleInfo),
                                  T20UI.spaceWidth,
                                  Flexible(
                                    child: Text(
                                      'Selecione um arquivo .t20 que deseja importar.\n\nObs: ao selecionar um arquivo já exitente, as informações serão sobreecritas!',
                                      maxLines: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                    AnimatedBuilder(
                      animation: _store,
                      builder: (_, __) {
                        final isValid = _store.isValid;
                        return Padding(
                          padding: const EdgeInsets.only(top: 8, left: 16),
                          child: Text(
                            isValid == null
                                ? 'obrigatório'
                                : isValid == true
                                    ? 'tudo certo!'
                                    : 'arquivo inválido!',
                            style: TextStyle(
                                fontSize: 12, color: palette.textSecundary),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              T20UI.spaceHeight,
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DividerLevelTwo(verticalPadding: 0),
              Padding(
                padding: T20UI.allPadding,
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedBuilder(
                          animation: _store,
                          builder: (_, __) {
                            final isValid = _store.isValid;
                            return MainButton(
                              label: isValid == true
                                  ? 'Importar'
                                  : 'Buscar arquivo',
                              onTap: isValid == true
                                  ? _store.import
                                  : _store.getFile,
                            );
                          }),
                    ),
                    const SimpleCloseButton()
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
