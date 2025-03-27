import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/shared/widgets/image_fade_slide.dart';

class IntroPageTwo extends StatefulWidget {
  const IntroPageTwo({super.key});

  @override
  State<IntroPageTwo> createState() => _IntroPageTwoState();
}

class _IntroPageTwoState extends State<IntroPageTwo> {
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
    await Future.delayed(const Duration(milliseconds: 3000));
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
    final List<String> characters =
        Assets.images.caracters.values.map((a) => a.path).toList();

    final List<String> menaces =
        Assets.images.menaces.values.map((m) => m.path).toList();

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
                  children: [
                    if (stage > 0)
                      AnimationConfiguration.synchronized(
                        duration: T20UI.defaultDurationAnimation,
                        child: FadeInAnimation(
                          child: SlideAnimation(
                            verticalOffset: 50,
                            child: ImageFadeSlide(
                              imageAssets: characters,
                              imageSize: 60,
                            ),
                          ),
                        ),
                      ),
                    T20UI.smallSpaceWidth,
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
                                    'Você deseja jogar?',
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
                                      'Crie seus personagens...',
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
            Padding(
              padding: T20UI.horizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (stage > 4)
                          AnimationConfiguration.synchronized(
                            child: FadeInAnimation(
                              child: SlideAnimation(
                                horizontalOffset: 50,
                                child: Text(
                                  'Você deseja mestrar?',
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
                                    'Então crie suas ameaças...',
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
                  T20UI.smallSpaceWidth,
                  if (stage > 3)
                    AnimationConfiguration.synchronized(
                      duration: T20UI.defaultDurationAnimation,
                      child: FadeInAnimation(
                        child: SlideAnimation(
                          child: ImageFadeSlide(
                            imageAssets: menaces,
                            imageSize: 60,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
