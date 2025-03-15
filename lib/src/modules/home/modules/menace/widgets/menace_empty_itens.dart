import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';

class MenaceEmptyItens extends StatelessWidget {
  const MenaceEmptyItens(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: T20UI.defaultDurationAnimation,
      child: FadeInAnimation(
        child: Padding(
          padding: const EdgeInsets.only(
            top: T20UI.spaceSize,
            left: T20UI.screenContentSpaceSize,
          ),
          child: Row(
            children: [
              const Icon(FontAwesomeIcons.ghost),
              T20UI.smallSpaceWidth,
              Text(label, style: const TextStyle(fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}
