import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/widgets/error_image_placeholder.dart';
import 'package:tormenta20/src/shared/widgets/main_button.dart';
import 'package:tormenta20/src/shared/widgets/simple_close_button.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({
    super.key,
    required this.path,
    this.heroTag,
  });

  final String path;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: kTextTabBarHeight + T20UI.spaceSize),
          Expanded(
              child: InteractiveViewer(
            child: Hero(
              tag: heroTag ?? 'hero-tag',
              child: Material(
                color: Colors.transparent,
                child: Image.file(
                  File(path),
                  errorBuilder: (_, __, ___) => FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      height: (context.width / 3) * 2,
                      width: (context.width / 3) * 2,
                      child: ClipRRect(
                        borderRadius: T20UI.borderRadius,
                        child: const ErrorImagePlaceholder(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
          SizedBox(
            height: T20UI.inputHeight,
            child: Padding(
              padding: T20UI.horizontalPadding,
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      label: 'Compartilhar',
                      onTap: () async {
                        await Share.shareXFiles([XFile(path)]);
                      },
                    ),
                  ),
                  const SimpleCloseButton()
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + T20UI.spaceSize,
          )
        ],
      ),
    );
  }
}
