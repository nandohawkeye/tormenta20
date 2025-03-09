import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class BoardViewBanner extends StatelessWidget {
  const BoardViewBanner(this.board, {super.key});

  final Board board;

  @override
  Widget build(BuildContext context) {
    final height = context.height / 3.5;
    final width = context.width;
    return Hero(
      tag: board.uuid,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              board.bannerPath != null
                  ? Image.file(
                      File(board.bannerPath!),
                      height: height,
                      width: width,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        Assets.images.banner.path,
                        height: height,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      Assets.images.banner.path,
                      height: height,
                      width: width,
                      fit: BoxFit.cover,
                    ),
              SizedBox(
                height: height,
                width: width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        palette.background,
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: T20UI.horizontalPadding,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:
                              palette.backgroundLevelTwo.withValues(alpha: .4),
                          borderRadius: T20UI.borderRadius),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        child: Text(
                          '${board.level}˚ Nivel',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
