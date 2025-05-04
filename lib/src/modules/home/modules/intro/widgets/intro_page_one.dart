import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/intro/widgets/intro_page_text_animated.dart';

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
                    color: palette.selected,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: T20UI.spaceSize * 2),
          const AnimationConfiguration.staggeredList(
            position: 2,
            delay: Duration(milliseconds: 200),
            duration: T20UI.defaultDurationAnimation,
            child: FadeInAnimation(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: T20UI.spaceSize * 2),
                child: IntroPageTextAnimated(
                    text:
                        'Você acabou de encontrar o seu gerenciador de mesas, personagens, grimórios e ameaças para o RPG Tormenta20, agora você vai ter tudo oque precisa na palma da mão, quando for jogar aquele RPGzin presencial com a galera!'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
