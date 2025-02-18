import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';

class BordViewMaterialsButton extends StatelessWidget {
  const BordViewMaterialsButton({super.key, required this.board});

  final Board board;

  @override
  Widget build(BuildContext context) {
    void openMaterials() async {
      await showModalBottomSheet<bool?>(
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: false,
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ShowBoardMaterialsBottomsheet(
            boardUuid: board.uuid,
          ),
        ),
      );
    }

    return Expanded(
      child: SizedBox(
        height: T20UI.inputHeight,
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: T20UI.borderRadius,
            side: BorderSide(
              color: palette.backgroundLevelOne,
              width: 2,
            ),
          ),
          child: InkWell(
            borderRadius: T20UI.borderRadius,
            onTap: openMaterials,
            child: const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Icon(FontAwesomeIcons.solidFilePdf),
            ),
          ),
        ),
      ),
    );
  }
}
