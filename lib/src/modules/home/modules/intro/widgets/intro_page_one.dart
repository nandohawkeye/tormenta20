import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimationConfiguration.staggeredList(
            duration: T20UI.defaultDurationAnimation,
            position: 1,
            child: FadeInAnimation(
              child: SlideAnimation(
                verticalOffset: 50,
                child: Text(
                  'Saudações',
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: FontFamily.tormenta,
                      color: palette.selected),
                ),
              ),
            ),
          ),
          const SizedBox(height: T20UI.spaceSize * 2),
          AnimationConfiguration.staggeredList(
            position: 2,
            delay: const Duration(milliseconds: 200),
            duration: T20UI.defaultDurationAnimation,
            child: FadeInAnimation(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: T20UI.spaceSize * 2),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Você acabou de encontrar o seu gerenciador de mesas, personagens, grimórios e ameaças para o RPG Tormenta20, agora você vai ter tudo oque precisa na palma da mão, quando for jogar aquele RPGzin presencial com a galera!',
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
