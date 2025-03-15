// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_card/board_card.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/board_screen_image_button.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

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
        const Padding(
          padding: T20UI.allPadding,
          child: Labels('Mesas e aventuras'),
        ),
        AnimatedBuilder(
          animation: _store,
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

            return SizedBox(
              height: 225 * context.realTextScale,
              width: double.infinity,
              child: ListView.separated(
                itemCount: boards.length,
                padding: const EdgeInsets.only(
                  bottom: T20UI.spaceSize,
                  right: T20UI.screenContentSpaceSize,
                  left: T20UI.screenContentSpaceSize,
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
