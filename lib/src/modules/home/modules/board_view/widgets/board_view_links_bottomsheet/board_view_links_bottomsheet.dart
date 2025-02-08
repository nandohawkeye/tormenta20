import 'package:flutter/material.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_links_bottomsheet/board_view_links_bottomsheet_item.dart';
import 'package:tormenta20/src/shared/entities/board/board_link.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/default_brackdrop_filter.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class BoardViewLinksBottomsheet extends StatelessWidget {
  const BoardViewLinksBottomsheet({super.key, required this.links});

  final List<BoardLink> links;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .5);

    return Stack(
      children: [
        const DefaultBrackdropFilter(),
        DraggableScrollableSheet(
            maxChildSize: limite,
            initialChildSize: initialSize,
            builder: (context, scrollController) {
              return Padding(
                padding: T20UI.allPaddingWithPaddingBottom(context),
                child: SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: palette.backgroundLevelOne,
                        borderRadius: T20UI.borderRadius),
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
                                'Sites',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: FontFamily.tormenta,
                                ),
                              ),
                            ),
                            T20UI.spaceHeight,
                          ],
                        ),
                        const BottomSheetDivider(verticalPadding: 0),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            padding: const EdgeInsets.only(
                              left: T20UI.spaceSize - 4,
                              right: T20UI.spaceSize - 4,
                              bottom: T20UI.spaceSize,
                              top: T20UI.spaceSize,
                            ),
                            child: Column(
                              children: links
                                  .map(BoardViewLinksBottomsheetItem.new)
                                  .toList(),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const BottomSheetDivider(verticalPadding: 0),
                            Padding(
                              padding: T20UI.allPadding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: MainButton(
                                      label: 'Voltar',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
