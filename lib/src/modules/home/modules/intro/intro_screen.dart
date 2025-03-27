import 'package:flutter/material.dart';
import 'package:tormenta20/src/modules/home/modules/intro/intro_screen_buttons.dart';
import 'package:tormenta20/src/modules/home/modules/intro/widgets/intro_page_four.dart';
import 'package:tormenta20/src/modules/home/modules/intro/widgets/intro_page_one.dart';
import 'package:tormenta20/src/modules/home/modules/intro/widgets/intro_page_tree.dart';
import 'package:tormenta20/src/modules/home/modules/intro/widgets/intro_page_two.dart';
import 'package:tormenta20/src/shared/extensions/context_ext.dart';
import 'package:tormenta20/src/shared/widgets/app_logo.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heigth = context.height;
    SizedBox verticalSpace =
        SizedBox(height: 50 + ((heigth > 700) ? kToolbarHeight : 0));
    return Material(
      child: Column(
        children: [
          verticalSpace,
          const AppLogo(width: 180),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                IntroPageOne(),
                IntroPageTwo(),
                IntroPageTree(),
                IntroPageFour(),
              ],
            ),
          ),
          IntroScreenButtons(_pageController),
          if (heigth > 700) verticalSpace,
        ],
      ),
    );
  }
}
