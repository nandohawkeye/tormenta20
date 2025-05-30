import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/add_edit_board_controller.dart';
import 'package:tormenta20/src/modules/home/widgets/labels.dart';
import 'package:tormenta20/src/modules/home/widgets/simple_button.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/widgets/error_image_placeholder.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';

class AddEditBoardBanner extends StatefulWidget {
  const AddEditBoardBanner(this.controller, {super.key});

  final AddEditBoardController controller;

  @override
  State<AddEditBoardBanner> createState() => _AddEditBoardBannerState();
}

class _AddEditBoardBannerState extends State<AddEditBoardBanner> {
  late final ValueNotifier<String?> _bannerPath;
  void _setBannerPath(String? value) => _bannerPath.value = value;

  @override
  void initState() {
    super.initState();
    _bannerPath = ValueNotifier<String?>(widget.controller.bannerPath);
  }

  @override
  void dispose() {
    _bannerPath.dispose();
    super.dispose();
  }

  void _onSelectImage() async {
    FilePickerResult? result =
        await GetIt.I<FilePicker>().pickFiles(type: FileType.image);

    final path = result?.files.single.path;

    if (path != null) {
      _setBannerPath(path);
      widget.controller.changeBannerPath(path);
    }
  }

  void _onRemoveImage() async {
    _setBannerPath(null);
    widget.controller.changeBannerPath(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: T20UI.horizontalPadding.copyWith(top: T20UI.spaceSize),
          child: const Labels('Banner'),
        ),
        T20UI.spaceHeight,
        ValueListenableBuilder(
            valueListenable: _bannerPath,
            builder: (_, bannerPath, __) {
              if (bannerPath != null) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimationConfiguration.synchronized(
                      child: Stack(
                        children: [
                          FadeInAnimation(
                            duration: T20UI.defaultDurationAnimation,
                            child: Row(
                              children: [
                                InkWell(
                                  borderRadius: T20UI.borderRadius,
                                  onTap: _onSelectImage,
                                  child: ClipRRect(
                                    borderRadius: T20UI.borderRadius,
                                    child: Image.file(
                                      File(bannerPath),
                                      fit: BoxFit.cover,
                                      height: context.width / 3.5,
                                      width: context.width / 2,
                                      errorBuilder: (_, __, ___) => SizedBox(
                                          height: context.width / 3.5,
                                          width: context.width / 2,
                                          child: const ErrorImagePlaceholder()),
                                    ),
                                  ),
                                ),
                                T20UI.spaceWidth,
                                SimpleButton(
                                  icon: FontAwesomeIcons.solidTrashCan,
                                  backgroundColor: palette.selected,
                                  iconColor: palette.onSelected,
                                  onTap: _onRemoveImage,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: T20UI.screenContentSpaceSize,
                    ),
                    child: MainButton(
                      label: 'Selecionar banner',
                      backgroundColor: palette.cardBackground,
                      onTap: _onSelectImage,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: T20UI.smallSpaceSize,
                      left: T20UI.spaceSize + T20UI.spaceSize,
                    ),
                    child: Text(
                      'Use uma imagem 16:9',
                      style: TextStyle(
                        fontSize: 12,
                        color: palette.textSecundary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            })
      ],
    );
  }
}
