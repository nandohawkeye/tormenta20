import 'package:flutter/material.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';

class BoardCardBanner extends StatelessWidget {
  const BoardCardBanner({
    super.key,
    this.bannerPath,
    required this.isVeryHeight,
    required this.width,
  });

  final String? bannerPath;
  final bool isVeryHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    final height = (isVeryHeight ? 163 : 120) * context.realTextScale;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Image.asset(
            bannerPath ?? Assets.images.banner.path,
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
    );
  }
}
