import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/board_view/widgets/show_board_materials_bottomsheet/show_board_materials_bottomsheet.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/utils/bottomsheet_utils.dart';

class BordViewMaterialsButton extends StatelessWidget {
  const BordViewMaterialsButton({super.key, required this.board});

  final Board board;

  @override
  Widget build(BuildContext context) {
    void openMaterials() async {
      await BottomsheetUtils.show<bool?>(
        context: context,
        child: ShowBoardMaterialsBottomsheet(
          boardUuid: board.uuid,
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: T20UI.smallSpaceSize),
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
      ),
    );
  }
}
