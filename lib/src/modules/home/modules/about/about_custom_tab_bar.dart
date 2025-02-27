import 'package:flutter/material.dart';
import 'package:tormenta20/src/core/theme/t20_ui.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_custom_tab_bar_item.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_store.dart';

class AboutCustomTabBar extends StatelessWidget {
  const AboutCustomTabBar({
    super.key,
    required this.store,
    required this.controller,
  });

  final AboutStore store;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    void changePage(int page) {
      store.changeCurrentPage(page);
      controller.animateToPage(
        page,
        curve: Curves.ease,
        duration: T20UI.defaultDurationAnimation,
      );
    }

    return Padding(
      padding: T20UI.allPadding,
      child: AnimatedBuilder(
        animation: store,
        builder: (_, __) {
          final currentPage = store.currentPage;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutCustomTabBarItem(
                title: 'Sobre',
                page: 0,
                changePage: changePage,
                currentPage: currentPage,
              ),
              AboutCustomTabBarItem(
                title: 'Backups',
                page: 1,
                changePage: changePage,
                currentPage: currentPage,
              )
            ],
          );
        },
      ),
    );
  }
}
