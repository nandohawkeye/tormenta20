import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_links/bottom_sheet_add_edit_field_item.dart';
import 'package:tormenta20/src/shared/widgets/bottom_sheet_divider.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class BottomSheetAddEditBoardLinks extends StatelessWidget {
  const BottomSheetAddEditBoardLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final limite = ((height - kToolbarHeight) / height);
    final initialSize = (limite * .5);

    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: palette.accent.withOpacity(.1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        DraggableScrollableSheet(
          maxChildSize: limite,
          initialChildSize: initialSize,
          builder: (context, scrollController) {
            return Padding(
              padding: T20UI.allPaddingWithPaddingBottom(context,
                  extra: MediaQuery.of(context).padding.bottom),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: palette.bottomSheetBackground,
                      borderRadius: T20UI.borderRadius),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          T20UI.spaceHeight,
                          Padding(
                            padding: T20UI.horizontalPadding,
                            child: Text(
                              'Links da mesa',
                              // '${initialGrimoire != null ? 'Editando' : 'Criando'} grimório',
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'tormenta',
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
                          padding: T20UI.verticalPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BottomSheetAddEditFieldItem(
                                type: BoardOptionsAcces.whats,
                              ),
                              T20UI.spaceHeight,
                              BottomSheetAddEditFieldItem(
                                type: BoardOptionsAcces.discord,
                              ),
                              T20UI.spaceHeight,
                              BottomSheetAddEditFieldItem(
                                type: BoardOptionsAcces.drive,
                              ),
                              T20UI.spaceHeight,
                              BottomSheetAddEditFieldItem(
                                type: BoardOptionsAcces.telegran,
                              ),
                              T20UI.spaceHeight,
                            ],
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
                              children: [
                                Expanded(
                                  child: MainButton(
                                    label: 'Salvar',
                                    // widget.initialGrimoire != null
                                    //     ? 'Salvar'
                                    //     : 'Criar',
                                    onTap: () {
                                      // if (_formKey.currentState?.validate() ??
                                      //     false) {
                                      //   final now = DateTime.now();
                                      //   final Grimoire grimoire = Grimoire(
                                      //     uuid: _uuid!,
                                      //     name: _name.value ?? '',
                                      //     desc: _desc.value,
                                      //     createdAt: _createdAt ?? now,
                                      //     updatedAt: now,
                                      //     magicsCharacters: _magics,
                                      //     iconAsset: _iconAsset.value,
                                      //     colorInt: _colorInt.value,
                                      //   );

                                      //   Navigator.pop(context, grimoire);
                                      // }
                                    },
                                  ),
                                ),
                                T20UI.spaceWidth,
                                const SimpleCloseButton()
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

enum BoardOptionsAcces { whats, discord, drive, telegran }
