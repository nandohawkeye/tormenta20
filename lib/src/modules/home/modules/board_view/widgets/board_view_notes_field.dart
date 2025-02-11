import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/board_view_note_add_edit_bottomsheet/board_view_note_add_edit_bottomsheet.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/entities/board/board_note.dart';
import 'package:tormenta20/src/shared/widgets/screen_image_button.dart';

class BoardViewNotesField extends StatelessWidget {
  const BoardViewNotesField(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    void addEditNote() async {
      await showModalBottomSheet<BoardNote?>(
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BoardViewNoteAddEditBottomsheet(
            boardUuid: board.uuid,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T20UI.spaceHeight,
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Anotações'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: addEditNote,
              ),
            ],
          ),
        ),
        T20UI.spaceHeight,

        if (board.notes.isEmpty)
          Padding(
            padding: const EdgeInsets.only(
              bottom: T20UI.spaceSize,
              right: T20UI.spaceSize - 4,
              left: T20UI.spaceSize - 4,
            ),
            child: ScreenImageButton(
              imageAsset: Assets.images.manuscript.path,
              title: 'Anotações',
              subtitle:
                  'Crie anotações sobre esta mesa e consulte toda vez que precisar',
              onTap: addEditNote,
            ),
          )

        // SizedBox(
        //   height: 120,
        //   width: double.infinity,
        //   child: ListView.separated(
        //     shrinkWrap: true,
        //     padding:
        //         const EdgeInsets.symmetric(horizontal: T20UI.spaceSize - 4),
        //     scrollDirection: Axis.horizontal,
        //     itemCount: board.materials.length,
        //     separatorBuilder: T20UI.separatorBuilderHorizontal,
        //     itemBuilder: (_, index) {
        //       return BoardViewMaterialCard(
        //         material: board.materials[index],
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
