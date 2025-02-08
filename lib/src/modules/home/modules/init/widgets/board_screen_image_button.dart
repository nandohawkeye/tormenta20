// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board.dart';
import 'package:tormenta20/src/shared/entities/board/board_mode_type.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class BoardScreenImageButton extends StatelessWidget {
  const BoardScreenImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenImageButton(
      imageAsset: Assets.images.knight.path,
      title: 'Mesas',
      subtitle:
          'Crie ou se vincule a mesa de um mestre, e comece a se divertir com seus amigos!',
      onTap: () async {
        await showModalBottomSheet<BoardModeType?>(
          isScrollControlled: true,
          isDismissible: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const BottomSheetInitBoard(),
          ),
        ).then((result) async {
          if (result != null) {
            if (result == BoardModeType.master) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddEditBoardScreen(),
                ),
              );
            }
          }
        });
      },
    );
  }
}
