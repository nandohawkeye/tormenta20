import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class AddEditBoardTokenCardBord extends StatelessWidget {
  const AddEditBoardTokenCardBord({
    super.key,
    required this.size,
    required this.isMenace,
  });

  final double size;
  final bool isMenace;

  @override
  Widget build(BuildContext context) {
    final asset =
        isMenace ? Assets.images.bordaTokenAmeaca : Assets.images.bordaToken;
    return Align(
      alignment: Alignment.topCenter,
      child: AnimationConfiguration.synchronized(
        child: FadeInAnimation(
          duration: T20UI.defaultDurationAnimation,
          child: asset.image(
            height: size + 5,
            width: size + 5,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
