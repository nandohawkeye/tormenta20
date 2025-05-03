import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class TokenCardBord extends StatelessWidget {
  const TokenCardBord({
    super.key,
    required this.size,
    required this.isMenace,
    this.withAnimate = true,
  });

  final double size;
  final bool isMenace;
  final bool withAnimate;

  @override
  Widget build(BuildContext context) {
    final asset =
        isMenace ? Assets.images.bordaTokenAmeaca : Assets.images.bordaToken;

    final base = asset.image(
      height: size + 5,
      width: size + 5,
      fit: BoxFit.cover,
      cacheHeight: PerformanceUtils.cacheImageSizeCalculated(context, size + 5),
      cacheWidth: PerformanceUtils.cacheImageSizeCalculated(context, size + 5),
    );

    if (withAnimate) {
      return Align(
        alignment: Alignment.topCenter,
        child: AnimationConfiguration.synchronized(
          child: FadeInAnimation(
            duration: T20UI.defaultDurationAnimation,
            child: base,
          ),
        ),
      );
    }

    return Align(
      alignment: Alignment.topCenter,
      child: base,
    );
  }
}
