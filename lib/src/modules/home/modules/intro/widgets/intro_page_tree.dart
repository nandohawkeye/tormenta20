import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tormenta20/gen/assets.gen.dart';
import 'package:tormenta20/gen/fonts.gen.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/intro/widgets/intro_page_text_animated.dart';
import 'package:tormenta20/src/shared/utils/performance_utils.dart';

class IntroPageTree extends StatefulWidget {
  const IntroPageTree({super.key});

  @override
  State<IntroPageTree> createState() => _IntroPageTreeState();
}

class _IntroPageTreeState extends State<IntroPageTree> {
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
            if (stage > 0)
              AnimationConfiguration.synchronized(
                duration: T20UI.defaultDurationAnimation,
                child: FadeInAnimation(
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: Image.asset(
                      Assets.images.knight.path,
                      height: 100,
                      width: 100,
                      cacheHeight: PerformanceUtils.cacheImageSizeCalculated(
                          context, 100),
                      cacheWidth: PerformanceUtils.cacheImageSizeCalculated(
                          context, 100),
                    ),
                  ),
                ),
              ),
            T20UI.spaceHeight,
            if (stage > 1)
              AnimationConfiguration.synchronized(
                duration: T20UI.defaultDurationAnimation,
                child: FadeInAnimation(
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: Text(
                      'Você que deseja mestrar!',
                      maxLines: 10,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: FontFamily.tormenta,
                          color: palette.selected),
                    ),
                  ),
                ),
              ),
            T20UI.smallSpaceHeight,
            if (stage > 2)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: T20UI.spaceSize * 2),
                child: AnimationConfiguration.synchronized(
                  duration: T20UI.defaultDurationAnimation,
                  child: FadeInAnimation(
                    child: IntroPageTextAnimated(
                        text:
                            'Crie e configure suas mesas, vincule suas ameaças e os personagens dos jogadores, compartilhe o arquivo da mesa com eles para que eles possam vincular os seus personagens a elas, para assim começarem a jogar!'),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
