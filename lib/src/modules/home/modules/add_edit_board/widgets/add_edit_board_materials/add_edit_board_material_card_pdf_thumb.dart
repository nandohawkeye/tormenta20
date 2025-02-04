import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/pdf_utils.dart';
import 'package:tormenta20/src/shared/widgets/custom_loader.dart';

class AddEditBoardMaterialCardPdfThumb extends StatefulWidget {
  const AddEditBoardMaterialCardPdfThumb(this.path, {super.key});

  final String path;

  @override
  State<AddEditBoardMaterialCardPdfThumb> createState() =>
      _AddEditBoardMaterialCardPdfThumbState();
}

class _AddEditBoardMaterialCardPdfThumbState
    extends State<AddEditBoardMaterialCardPdfThumb> {
  late final ValueNotifier<Uint8List?> _thumb;
  late final ValueNotifier<bool> _error;

  @override
  void initState() {
    super.initState();
    _thumb = ValueNotifier<Uint8List?>(null);
    _error = ValueNotifier<bool>(false);
    _getThumb();
  }

  @override
  void dispose() {
    _thumb.dispose();
    _error.dispose();
    super.dispose();
  }

  void _getThumb() async {
    try {
      final result = await PdfUtils.getImagePdfFromFile(File(widget.path));
      _thumb.value = result!.bytes;
    } catch (_) {
      _error.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: palette.cardBackground,
          borderRadius: T20UI.borderRadius,
        ),
        child: AnimatedBuilder(
          animation: Listenable.merge([_thumb, _error]),
          builder: (_, __) {
            final hasError = _error.value;
            final thumb = _thumb.value;

            if (hasError) {
              return const Center(
                child: Icon(FontAwesomeIcons.solidFilePdf),
              );
            }

            if (thumb == null) {
              return const Center(child: CustomLoader());
            }

            return ClipRRect(
              borderRadius: T20UI.borderRadius,
              child: Image.memory(
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                thumb,
              ),
            );
          },
        ),
      ),
    );
  }
}
