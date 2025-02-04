import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_token_card_bord.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/bottom_sheet_add_edit_board_character/bottom_sheet_add_edit_board_character_token_card_tag.dart';

class BottomSheetAddEditBoardCharacterFileImageSelector
    extends StatelessWidget {
  const BottomSheetAddEditBoardCharacterFileImageSelector({
    super.key,
    this.filePath,
    required this.onSelectFile,
  });

  final String? filePath;
  final Function(String) onSelectFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FilePickerResult? result =
            await GetIt.I<FilePicker>().pickFiles(type: FileType.image);

        final path = result?.files.single.path;

        if (path != null) {
          onSelectFile.call(path);
        }
      },
      child: SizedBox(
        height: 90,
        width: 90,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.5),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: palette.onBottomsheet,
                    ),
                    child: filePath != null
                        ? ClipOval(
                            child: Image.file(
                              File(filePath!),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            FontAwesomeIcons.image,
                            color: palette.accent.withOpacity(.6),
                          ),
                  ),
                ),
              ),
            ),
            if (filePath != null)
              const BottomSheetAddEditBoardCharacterTokenCardBord(),
            const BottomSheetAddEditBoardCharacterTokenCardTag(
              tag: 'Galeria',
            )
          ],
        ),
      ),
    );
  }
}
