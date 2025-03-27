import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';

class IntroPageFour extends StatefulWidget {
  const IntroPageFour({super.key});

  @override
  State<IntroPageFour> createState() => _IntroPageFourState();
}

class _IntroPageFourState extends State<IntroPageFour> {
  late final ValueNotifier<int> _stage;

  _toFlux() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    _stage.value = 1;
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    _stage.value = 2;
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    _stage.value = 3;
    await Future.delayed(const Duration(milliseconds: 14000));
    if (!mounted) return;
    _stage.value = 4;
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    _stage.value = 5;
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    _stage.value = 6;
  }

  @override
  void initState() {
    super.initState();
    _stage = ValueNotifier<int>(0);
    _toFlux();
  }

  @override
  void dispose() {
    _stage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _stage,
      builder: (_, stage, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: T20UI.horizontalPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (stage > 0)
                      AnimationConfiguration.synchronized(
                        duration: T20UI.defaultDurationAnimation,
                        child: FadeInAnimation(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipOval(
                                  child: Assets.images.developer.image(
                                    height: 75,
                                    width: 75,
                                  ),
                                ),
                                Assets.images.bordaToken.image(
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    T20UI.spaceWidth,
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (stage > 1)
                            AnimationConfiguration.synchronized(
                              duration: T20UI.defaultDurationAnimation,
                              child: FadeInAnimation(
                                child: SlideAnimation(
                                  horizontalOffset: -50,
                                  child: Text(
                                    'Olá sou o Nando!',
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: FontFamily.tormenta,
                                        color: palette.selected),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 4),
                          if (stage > 2)
                            AnimationConfiguration.synchronized(
                              duration: T20UI.defaultDurationAnimation,
                              child: FadeInAnimation(
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'Sou o desenvolvedor dessa aplicação, se quiser trocar uma ideia ou dar agluma dica sobre o projeto pode conferir minhas redes sociais na sessão de "Sobre"',
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: T20UI.spaceSize * 2),
            Flexible(
              child: Padding(
                padding: T20UI.horizontalPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (stage > 4)
                            AnimationConfiguration.synchronized(
                              duration: T20UI.defaultDurationAnimation,
                              child: FadeInAnimation(
                                child: SlideAnimation(
                                  horizontalOffset: 50,
                                  child: Text(
                                    'Jambo editora',
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: FontFamily.tormenta,
                                        color: palette.selected),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 4),
                          if (stage > 5)
                            AnimationConfiguration.synchronized(
                              duration: T20UI.defaultDurationAnimation,
                              child: FadeInAnimation(
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'O produto Tormenta20 e os conteúdos (exceto alguns descriminados na sessão de "Sobre") utilizados nesse projeto, pertencem a Jambô editora e tem os direitos reservados a mesma.',
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
                        ],
                      ),
                    ),
                    T20UI.spaceWidth,
                    if (stage > 3)
                      AnimationConfiguration.synchronized(
                        duration: T20UI.defaultDurationAnimation,
                        child: FadeInAnimation(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipOval(
                                  child: Assets.images.jambo.image(
                                    height: 75,
                                    width: 75,
                                  ),
                                ),
                                Assets.images.bordaToken.image(
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
