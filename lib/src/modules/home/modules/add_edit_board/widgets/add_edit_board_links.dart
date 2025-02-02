import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_links/bottom_sheet_add_edit_board_links.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardLinks extends StatelessWidget {
  const AddEditBoardLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Labels('Links'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: () {},
              )
            ],
          ),
        ),
        T20UI.spaceHeight,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: T20UI.spaceSize - 4,
          ),
          child: MainButton(
            label: 'Adicionar link',
            backgroundColor: palette.cardBackground,
            onTap: () async {
              await showModalBottomSheet<void>(
                isScrollControlled: true,
                isDismissible: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const BottomSheetAddEditBoardLinks(),
                ),
              ).then((result) async {
                // if (result != null) {
                //   await GetIt.I<AppDatabase>()
                //       .grimoireDAO
                //       .deleteGrimoire(_store.grimoire)
                //       .then((failure) {
                //     if (failure == null) {
                //       Navigator.pop(context);
                //     }
                //   });
                // }
              });
            },
          ),
        )
      ],
    );
  }
}
