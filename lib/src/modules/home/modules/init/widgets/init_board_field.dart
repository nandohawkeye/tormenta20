// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_screen_image_button.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_bottomsheet.dart';

class InitBoardField extends StatefulWidget {
  const InitBoardField({super.key});

  @override
  State<InitBoardField> createState() => _InitBoardFieldState();
}

class _InitBoardFieldState extends State<InitBoardField> {
  late final InitStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<InitStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepaintBoundary(
          child: Padding(
            padding: T20UI.allPadding.copyWith(bottom: 6, right: 0, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Labels('Mesas e aventuras'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SimpleButton(
                      icon: FontAwesomeIcons.fileImport,
                      iconSize: 18,
                      backgroundColor: palette.background,
                      onTap: () async {
                        BottomsheetUtils.show(
                          context: context,
                          child: const ImportFileBottomsheet(),
                        );
                      },
                    ),
                    T20UI.spaceWidth,
                    SimpleButton(
                      icon: FontAwesomeIcons.plus,
                      iconSize: 20,
                      backgroundColor: palette.background,
                      onTap: () async {
                        await Navigator.push<Board?>(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AddEditBoardScreen(),
                          ),
                        ).then((board) {
                          if (board != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BoardViewScreen(initial: board),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        RepaintBoundary(
          child: ListenableBuilder(
            listenable: _store,
            builder: (_, __) {
              final boards = _store.boards;

              if (boards.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    right: T20UI.screenContentSpaceSize,
                    left: T20UI.screenContentSpaceSize,
                  ),
                  child: BoardScreenImageButton(),
                );
              }

              const double width = 300;

              return SizedBox(
                height: 225 * context.realTextScale,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: boards.length,
                  itemExtent: width + T20UI.smallSpaceSize,
                  padding: const EdgeInsets.only(
                    bottom: T20UI.spaceSize,
                    right: T20UI.screenContentSpaceSize,
                    left: T20UI.screenContentSpaceSize,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return BoardCard(board: boards[index], width: width);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
