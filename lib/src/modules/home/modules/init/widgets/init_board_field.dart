// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_board/add_board_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/widgets/bottom_sheet_init_board/bottom_sheet_init_board.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board_type.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class InitBoardField extends StatelessWidget {
  const InitBoardField({super.key});

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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddBoardScreen(),
                        ),
                      );
                    },
                  ),
                  T20UI.spaceWidth,
                  SimpleButton(
                    icon: FontAwesomeIcons.qrcode,
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: T20UI.spaceSize,
            right: T20UI.spaceSize - 4,
            left: T20UI.spaceSize - 4,
          ),
          child: ScreenImageButton(
            imageAsset: 'assets/images/knight.png',
            title: 'Criar ou vincular mesa',
            subtitle:
                'Crie ou se vincule a mesa de um mestre, e comece a se divertir com seus amigos!',
            onTap: () async {
              await showModalBottomSheet<BoardType?>(
                isScrollControlled: false,
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
                  if (result == BoardType.created) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddBoardScreen(),
                      ),
                    );
                  }
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
