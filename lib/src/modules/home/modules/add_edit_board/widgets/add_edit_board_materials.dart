import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardMaterials extends StatefulWidget {
  const AddEditBoardMaterials({super.key});

  @override
  State<AddEditBoardMaterials> createState() => _AddEditBoardMaterialsState();
}

class _AddEditBoardMaterialsState extends State<AddEditBoardMaterials> {
  void _onSelectFiles() async {
    FilePickerResult? result = await GetIt.I<FilePicker>().pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'pdf', 'png'],
    );

    final path = result?.files.single.path;

    if (path != null) {
      // _setBannerPath(path);
      // if (widget.changeBannerPath != null) {
      //   widget.changeBannerPath!(path);
      // }
    }
  }

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
              const Labels('Materiais'),
              SimpleButton(
                icon: FontAwesomeIcons.plus,
                onTap: _onSelectFiles,
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
            label: 'Adicionar material',
            backgroundColor: palette.cardBackground,
            onTap: _onSelectFiles,
          ),
        )
      ],
    );
  }
}
