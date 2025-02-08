import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/entities/board/board.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class BoardCardBanner extends StatelessWidget {
  const BoardCardBanner({
    super.key,
    required this.width,
    required this.board,
  });

  final double width;
  final Board board;

  @override
  Widget build(BuildContext context) {
    final isVeryHeight = board.players.isEmpty;
    final height = (isVeryHeight ? 163 : 120) * context.realTextScale;
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
                        palette.backgroundLevelOne,
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
