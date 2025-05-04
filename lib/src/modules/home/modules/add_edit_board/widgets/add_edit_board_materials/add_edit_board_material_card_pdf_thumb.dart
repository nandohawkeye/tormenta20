import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/utils/pdf_utils.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';
import 'package:tormenta20/src/shared/widgets/custom_loader.dart';
import 'package:tormenta20/src/shared/widgets/error_image_placeholder.dart';

class BoardMaterialCardPdfThumb extends StatefulWidget {
  const BoardMaterialCardPdfThumb(this.path, {super.key, required this.size});

  final String path;
  final double size;

  @override
  State<BoardMaterialCardPdfThumb> createState() =>
      _BoardMaterialCardPdfThumbState();
}

class _BoardMaterialCardPdfThumbState extends State<BoardMaterialCardPdfThumb> {
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
    return RepaintBoundary(
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.cardBackground,
            borderRadius: T20UI.borderRadius,
          ),
          child: ListenableBuilder(
            listenable: Listenable.merge([_thumb, _error]),
            builder: (_, __) {
              final hasError = _error.value;
              final thumb = _thumb.value;

              if (hasError) {
                return const ErrorImagePlaceholder();
              }

              if (thumb == null) {
                return const Center(child: CustomLoader());
              }

              return ClipRRect(
                borderRadius: T20UI.borderRadius,
                child: Image.memory(
                  height: widget.size,
                  width: widget.size,
                  fit: BoxFit.cover,
                  cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                      context, widget.size),
                  cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                      context, widget.size),
                  thumb,
                  errorBuilder: (_, __, ___) => const ErrorImagePlaceholder(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
