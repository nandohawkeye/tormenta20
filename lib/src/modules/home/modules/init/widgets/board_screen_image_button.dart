// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/board_view_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';
import 'package:tormenta20/src/shared/widgets/import_file_bottomsheet/import_file_bottomsheet.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class BoardScreenImageButton extends StatelessWidget {
  const BoardScreenImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenImageButton(
      imageAsset: Assets.images.knight.path,
      title: 'Mesas',
      subtitle:
          'Crie ou se vincule a uma mesa para se divertir com seus amigos!',
      onTap: () async {
        await BottomsheetUtils.show<BoardModeType?>(
          context: context,
          child: const BottomSheetInitBoard(),
        ).then((result) async {
          if (result != null) {
            if (result == BoardModeType.master) {
              await Navigator.push<Board?>(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddEditBoardScreen(),
                ),
              ).then(
                (board) {
                  if (board != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BoardViewScreen(initial: board),
                      ),
                    );
                  }
                },
              );
            } else {
              BottomsheetUtils.show(
                context: context,
                child: const ImportFileBottomsheet(),
              );
            }
          }
        });
      },
    );
  }
}
