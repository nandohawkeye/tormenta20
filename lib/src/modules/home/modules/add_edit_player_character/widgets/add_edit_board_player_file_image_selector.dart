import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_token_card_bord.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_player_character/widgets/add_edit_board_player_token_card_tag.dart';
import 'package:tormenta20/src/shared/widgets/error_image_placeholder.dart';

class AddEditBoardPlayerFileImageSelector extends StatelessWidget {
  const AddEditBoardPlayerFileImageSelector({
    super.key,
    this.filePath,
    required this.onSelectFile,
    required this.size,
    required this.isMenace,
  });

  final String? filePath;
  final Function(String) onSelectFile;
  final double size;
  final bool isMenace;

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
        height: size + 10,
        width: size + 10,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.5),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: size,
                  width: size,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: palette.backgroundLevelOne,
                    ),
                    child: filePath != null
                        ? ClipOval(
                            child: Image.file(
                              File(filePath!),
                              height: size,
                              width: size,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const ErrorImagePlaceholder(),
                            ),
                          )
                        : Icon(
                            FontAwesomeIcons.solidImage,
                            color: palette.selected,
                          ),
                  ),
                ),
              ),
            ),
            if (filePath != null)
              AddEditBoardTokenCardBord(
                size: size,
                isMenace: isMenace,
              ),
            const AddEditBoardPlayerTokenCardTag(
              tag: 'Galeria',
            )
          ],
        ),
      ),
    );
  }
}
