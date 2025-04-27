import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/url_utils.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_base.dart';
import 'package:tormenta20/src/shared/widgets/divider_level_two.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class CopyrigthAuthorsBottomsheet extends StatelessWidget {
  const CopyrigthAuthorsBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight + T20UI.spaceSize),
      child: BottomSheetBase(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            T20UI.spaceHeight,
            const Padding(
              padding: T20UI.horizontalPadding,
              child: Text(
                'Autores e seus conteúdos',
                maxLines: 3,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: FontFamily.tormenta,
                ),
              ),
            ),
            T20UI.spaceHeight,
            const DividerLevelTwo(verticalPadding: 0),
            T20UI.spaceHeight,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: Text(
                        'Segue abaixo os conteúdos visuais usados no projeto, seguido de seu autor e respectivo site para ver mais contéudos',
                        maxLines: 10,
                        style: TextStyle(color: palette.textSecundary),
                      ),
                    ),
                    T20UI.spaceHeight,
                    const DividerLevelTwo(verticalPadding: 0),
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: InkWell(
                        onTap: () async => await UrlUtils.lauch(
                            'https://www.flaticon.com/authors/dimitry-miroliubov'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dimitry Miroliubov',
                              style: TextStyle(color: palette.accent),
                            ),
                            Text(
                              'https://www.flaticon.com/authors/dimitry-miroliubov',
                              maxLines: 2,
                              style: TextStyle(color: palette.selected),
                            ),
                            T20UI.spaceHeight,
                            Wrap(
                              spacing: T20UI.spaceSize,
                              runSpacing: T20UI.spaceSize,
                              children: [
                                Assets.images.pdf.image(height: 48, width: 48),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const DividerLevelTwo(verticalPadding: 0),
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: InkWell(
                        onTap: () async => await UrlUtils.lauch(
                            'https://www.flaticon.com/authors/freepik'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Freepik',
                              style: TextStyle(color: palette.accent),
                            ),
                            Text(
                              'https://www.flaticon.com/authors/freepik',
                              maxLines: 2,
                              style: TextStyle(color: palette.selected),
                            ),
                            T20UI.spaceHeight,
                            Wrap(
                              spacing: T20UI.spaceSize,
                              runSpacing: T20UI.spaceSize,
                              children: [
                                Assets.images.manuscript
                                    .image(height: 48, width: 48),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    T20UI.spaceHeight,
                    const DividerLevelTwo(verticalPadding: 0),
                    T20UI.spaceHeight,
                    Padding(
                      padding: T20UI.horizontalPadding,
                      child: InkWell(
                        onTap: () async => await UrlUtils.lauch(
                            'https://www.flaticon.com/authors/maxicons'),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'max.icons',
                              style: TextStyle(color: palette.accent),
                            ),
                            Text(
                              'https://www.flaticon.com/authors/maxicons',
                              maxLines: 2,
                              style: TextStyle(color: palette.selected),
                            ),
                            T20UI.spaceHeight,
                            Wrap(
                              spacing: T20UI.spaceSize,
                              runSpacing: T20UI.spaceSize,
                              children: [
                                ...Assets.images.caracters.values
                                    .map((e) => e.image(height: 48, width: 48)),
                                ...Assets.images.menaces.values
                                    .map((e) => e.image(height: 48, width: 48)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            T20UI.spaceHeight,
            const DividerLevelTwo(verticalPadding: 0),
            Padding(
              padding: T20UI.allPadding,
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      label: 'Voltar',
                      onTap: () => Navigator.pop(context),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
