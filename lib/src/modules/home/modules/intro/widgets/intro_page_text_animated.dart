import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroPageTextAnimated extends StatelessWidget {
  const IntroPageTextAnimated({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          cursor: ' 🎲',
          textAlign: TextAlign.center,
          speed: const Duration(milliseconds: 85),
        ),
      ],
      repeatForever: false,
      isRepeatingAnimation: false,
      displayFullTextOnTap: false,
      stopPauseOnTap: true,
    );
  }
}
