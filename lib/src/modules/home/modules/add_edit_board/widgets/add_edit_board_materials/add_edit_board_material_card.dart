import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/add_edit_board/widgets/add_edit_board_materials/add_edit_board_material_card_pdf_thumb.dart';
import 'package:tormenta20/src/shared/entities/board/board_material.dart';
import 'package:tormenta20/src/shared/entities/board/board_material_types.dart';
import 'package:tormenta20/src/shared/widgets/error_image_placeholder.dart';

class AddEditBoardMaterialCard extends StatelessWidget {
  const AddEditBoardMaterialCard({
    super.key,
    required this.material,
    required this.onTap,
  });

  final BoardMaterial material;
  final Function(BoardMaterial) onTap;

  @override
  Widget build(BuildContext context) {
    const double size = 120;
    return InkWell(
      borderRadius: T20UI.borderRadius,
      onTap: () => onTap(material),
      child: Stack(
        children: [
          SizedBox(
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
          Positioned(
            top: 4,
            right: 4,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: palette.selected,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  FontAwesomeIcons.solidTrashCan,
                  color: palette.indicator.withValues(alpha: .85),
                  size: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
