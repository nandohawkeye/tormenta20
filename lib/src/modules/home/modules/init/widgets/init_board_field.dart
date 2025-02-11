// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_screen_image_button.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class InitBoardField extends StatefulWidget {
  const InitBoardField({super.key});

  @override
  State<InitBoardField> createState() => _InitBoardFieldState();
}

class _InitBoardFieldState extends State<InitBoardField> {
  late final InitBoardStore _store;

  @override
  void initState() {
    super.initState();
    _store = GetIt.I<InitBoardStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.allPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Mesas'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleButton(
                    icon: FontAwesomeIcons.plus,
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
                  T20UI.spaceWidth,
                  SimpleButton(
                    icon: FontAwesomeIcons.solidFileCode,
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
        AnimatedBuilder(
          animation: _store,
          builder: (_, __) {
            final boards = _store.data;

            if (boards.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(
                  bottom: T20UI.spaceSize,
                  right: T20UI.spaceSize - 4,
                  left: T20UI.spaceSize - 4,
                ),
                child: BoardScreenImageButton(),
              );
            }

            boards.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

            return SizedBox(
              height: 225 * context.realTextScale,
              width: double.infinity,
              child: ListView.separated(
                itemCount: boards.length,
                padding: const EdgeInsets.only(
                  bottom: T20UI.spaceSize,
                  right: T20UI.spaceSize - 4,
                  left: T20UI.spaceSize - 4,
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: T20UI.separatorBuilderHorizontal,
                itemBuilder: (_, index) {
                  return BoardCard(
                    board: boards[index],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
