import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class AddEditBoardPlayerTokenCardBord extends StatelessWidget {
  const AddEditBoardPlayerTokenCardBord({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimationConfiguration.synchronized(
        child: FadeInAnimation(
          duration: T20UI.defaultDurationAnimation,
          child: Assets.images.bordaToken.image(
            height: size + 5,
            width: size + 5,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
