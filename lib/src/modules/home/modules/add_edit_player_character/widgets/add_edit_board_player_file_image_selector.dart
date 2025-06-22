import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_bord.dart';
import 'package:tormenta20/src/shared/widgets/token_selector/token_card_tag.dart';
import 'package:tormenta20/src/shared/widgets/error_image_placeholder.dart';

class AddEditBoardPlayerFileImageSelector extends StatelessWidget {
  const AddEditBoardPlayerFileImageSelector({
    super.key,
    this.filePath,
    required this.onSelectFile,
    required this.size,
    required this.isMenace,
    this.colorBase,
  });

  final String? filePath;
  final Function(String) onSelectFile;
  final double size;
  final bool isMenace;
  final Color? colorBase;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20000),
          onTap: () async {
            FilePickerResult? result = await GetIt.I<FilePicker>().pickFiles(
              type: FileType.image,
            );

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
                          color: colorBase ?? palette.backgroundLevelOne,
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
                                color: palette.accent,
                              ),
                      ),
                    ),
                  ),
                ),
                if (filePath != null)
                  TokenCardBord(size: size, isMenace: isMenace),
                const TokenCardTag(tag: 'Galeria'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
