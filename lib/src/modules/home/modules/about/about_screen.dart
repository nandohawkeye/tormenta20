import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_custom_tab_bar.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_store.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_screen_infos.dart';
import 'package:tormenta20/src/modules/home/modules/about/widgets/about_settings.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late final AboutStore _store;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _store = AboutStore();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _store.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutCustomTabBar(
            store: _store,
            controller: _pageController,
          ),
          T20UI.spaceHeight,
          Expanded(
            child: PageView(
              onPageChanged: _store.changeCurrentPage,
              controller: _pageController,
              children: const [
                AboutScreenInfos(),
                AboutSettings(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
