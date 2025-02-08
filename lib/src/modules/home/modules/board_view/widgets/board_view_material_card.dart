import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_materials/add_edit_board_material_card_pdf_thumb.dart';
import 'package:tormenta20/src/modules/home/modules/image_view/image_view_screen.dart';
import 'package:tormenta20/src/modules/home/modules/pdf_view/pdf_view_screen.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';
import 'package:tormenta20/src/shared/widgets/error_image_placeholder.dart';

class BoardViewMaterialCard extends StatelessWidget {
  const BoardViewMaterialCard({super.key, required this.material});

  final BoardMaterial material;

  @override
  Widget build(BuildContext context) {
    const double size = 120;
    return InkWell(
      borderRadius: T20UI.borderRadius,
      onTap: () {
        if (material.type == BoardMaterialTypes.image) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ImageViewScreen(
                path: material.path,
                heroTag: material.uuid,
              ),
            ),
          );
        }

        if (material.type == BoardMaterialTypes.pdf) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PdfViewScreen(path: material.path),
            ),
          );
        }
      },
      child: Hero(
        tag: material.uuid,
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            height: size,
            width: size,
            child: material.type == BoardMaterialTypes.image
                ? ClipRRect(
                    borderRadius: T20UI.borderRadius,
                    child: Image.file(
                      height: size,
                      width: size,
                      fit: BoxFit.cover,
                      File(material.path),
                      errorBuilder: (_, __, ___) =>
                          const ErrorImagePlaceholder(),
                    ),
                  )
                : BoardMaterialCardPdfThumb(
                    material.path,
                    size: size,
                  ),
          ),
        ),
      ),
    );
  }
}
